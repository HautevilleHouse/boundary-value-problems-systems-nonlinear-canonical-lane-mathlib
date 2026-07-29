import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure BifurcationPackage (A : AdmissibleBVP) where
  parameterSpace : Type u
  trivialBranch : Prop
  bifurcationPoint : Prop
  branchSwitching : Prop

structure BifurcationEvidence {A : AdmissibleBVP} (B : BifurcationPackage A) where
  parameterSpaceClosed : B.parameterSpace
  trivialBranchClosed : B.trivialBranch
  bifurcationPointClosed : B.bifurcationPoint
  branchSwitchingClosed : B.branchSwitching

def BifurcationClosed {A : AdmissibleBVP} (B : BifurcationPackage A) : Prop :=
  B.parameterSpace ∧ B.trivialBranch ∧ B.bifurcationPoint ∧ B.branchSwitching

theorem bifurcation_closed_from_evidence {A : AdmissibleBVP} (B : BifurcationPackage A) (E : BifurcationEvidence B) : BifurcationClosed B :=
  by
    exact And.intro E.parameterSpaceClosed (And.intro E.trivialBranchClosed (And.intro E.bifurcationPointClosed E.branchSwitchingClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse
