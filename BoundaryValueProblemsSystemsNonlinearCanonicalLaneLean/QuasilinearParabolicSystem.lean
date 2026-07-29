import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure QuasilinearParabolicSystem where
  timeDomain : Type u
  spatialDomain : Type v
  parabolicity : Prop
  boundaryRegularity : Prop
  initialCondition : Prop
  parabolicityTerm : parabolicity
  boundaryRegularityTerm : boundaryRegularity
  initialConditionTerm : initialCondition

structure QuasilinearParabolicSystemEvidence (Q : QuasilinearParabolicSystem) where
  parabolicityClosed : Q.parabolicity
  boundaryRegularityClosed : Q.boundaryRegularity
  initialConditionClosed : Q.initialCondition

def QuasilinearParabolicSystemClosed (Q : QuasilinearParabolicSystem) : Prop :=
  Q.parabolicity ∧ Q.boundaryRegularity ∧ Q.initialCondition

theorem quasilinear_parabolic_system_closed_from_evidence
    (Q : QuasilinearParabolicSystem) (E : QuasilinearParabolicSystemEvidence Q) :
    QuasilinearParabolicSystemClosed Q := by
  exact And.intro E.parabolicityClosed
    (And.intro E.boundaryRegularityClosed E.initialConditionClosed)

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse
