import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure NonlinearOperatorPackage where
  domain : Type u
  boundary : Type v
  operator : (domain → ℝ) → (boundary → ℝ)
  frechetDerivative : Prop
  monotonicity : Prop
  compactness : Prop
  coercivity : Prop

structure NonlinearOperatorEvidence (N : NonlinearOperatorPackage) where
  frechetDerivativeClosed : N.frechetDerivative
  monotonicityClosed : N.monotonicity
  compactnessClosed : N.compactness
  coercivityClosed : N.coercivity

def NonlinearOperatorClosed (N : NonlinearOperatorPackage) : Prop :=
  N.frechetDerivative ∧ N.monotonicity ∧ N.compactness ∧ N.coercivity

theorem nonlinear_operator_closed_from_evidence
    (N : NonlinearOperatorPackage) (E : NonlinearOperatorEvidence N) :
    NonlinearOperatorClosed N := by
  exact And.intro E.frechetDerivativeClosed
    (And.intro E.monotonicityClosed
      (And.intro E.compactnessClosed E.coercivityClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse