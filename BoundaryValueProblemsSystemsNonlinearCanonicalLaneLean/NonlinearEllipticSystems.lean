import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure NonlinearEllipticSystemPackage where
  domain : Type u
  topology : TopologicalSpace domain
  boundary : Type v
  boundaryEmbedding : boundary → domain
  systemDimension : ℕ
  unknownFunction : Type w
  differentialOperator : Type x
  ellipticityCondition : Prop
  boundaryOperator : Type y
  complementingCondition : Prop
  coercivityEstimate : Prop
  regularityResult : Prop

structure NonlinearEllipticSystemEvidence (P : NonlinearEllipticSystemPackage) where
  ellipticityConditionClosed : P.ellipticityCondition
  complementingConditionClosed : P.complementingCondition
  coercivityEstimateClosed : P.coercivityEstimate
  regularityResultClosed : P.regularityResult

def NonlinearEllipticSystemClosed (P : NonlinearEllipticSystemPackage) : Prop :=
  P.ellipticityCondition ∧ P.complementingCondition ∧ P.coercivityEstimate ∧ P.regularityResult

theorem nonlinear_elliptic_system_closed_from_evidence
    (P : NonlinearEllipticSystemPackage) (E : NonlinearEllipticSystemEvidence P) :
    NonlinearEllipticSystemClosed P := by
  exact And.intro E.ellipticityConditionClosed
    (And.intro E.complementingConditionClosed
      (And.intro E.coercivityEstimateClosed E.regularityResultClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse