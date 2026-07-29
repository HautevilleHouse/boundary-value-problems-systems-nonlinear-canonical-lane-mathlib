import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure NonlinearBVPSystem where
  domain : Type u
  boundary : Type v
  operator : (domain → ℝ) → (domain → ℝ)
  boundaryCondition : (domain → ℝ) → Prop
  sourceTerm : domain → ℝ
  solutionSpace : Set (domain → ℝ)
  wellPosedness : Prop

structure NonlinearBVPEvidence (S : NonlinearBVPSystem) where
  operatorContinuous : S.operator ∈ Cb(S.solutionSpace, ℝ)
  boundaryConditionClosed : ∀ u : S.solutionSpace, S.boundaryCondition u
  sourceTermInLp : S.sourceTerm ∈ Lp S.domain 2
  solutionExistence : ∃ u : S.solutionSpace, S.operator u = S.sourceTerm ∧ S.boundaryCondition u
  wellPosednessClosed : S.wellPosedness

def NonlinearBVPClosed (S : NonlinearBVPSystem) : Prop :=
  S.wellPosedness ∧ ∃ u : S.solutionSpace, S.operator u = S.sourceTerm ∧ S.boundaryCondition u

theorem nonlinear_bvp_closed_from_evidence
    (S : NonlinearBVPSystem) (E : NonlinearBVPEvidence S) :
    NonlinearBVPClosed S := by
  refine And.intro E.wellPosednessClosed ?_
  exact E.solutionExistence

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse