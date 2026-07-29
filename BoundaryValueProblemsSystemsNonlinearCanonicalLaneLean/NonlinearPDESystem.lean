import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure NonlinearPDESystemPackage where
  domainType : Type u
  operator : Prop
  nonlinearity : Prop
  smoothness : Prop
  aPrioriEstimates : Prop

structure NonlinearPDESystemEvidence (S : NonlinearPDESystemPackage) where
  operatorClosed : S.operator
  nonlinearityClosed : S.nonlinearity
  smoothnessClosed : S.smoothness
  aPrioriEstimatesClosed : S.aPrioriEstimates

def NonlinearPDESystemClosed (S : NonlinearPDESystemPackage) : Prop :=
  S.operator ∧ S.nonlinearity ∧ S.smoothness ∧ S.aPrioriEstimates

theorem nonlinear_pde_system_closed_from_evidence
    (S : NonlinearPDESystemPackage) (E : NonlinearPDESystemEvidence S) :
    NonlinearPDESystemClosed S := by
  exact And.intro E.operatorClosed
    (And.intro E.nonlinearityClosed
      (And.intro E.smoothnessClosed E.aPrioriEstimatesClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse