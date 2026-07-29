import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure MonotoneOperator (V : Type u) [NormedAddCommGroup V] where
  operator : V → V
  monotone : Prop
  hemicontinuous : Prop
  coercive : Prop
  bounded : Prop

structure MonotoneOperatorEvidence (M : MonotoneOperator V) where
  monotoneClosed : M.monotone
  hemicontinuousClosed : M.hemicontinuous
  coerciveClosed : M.coercive
  boundedClosed : M.bounded

def MonotoneOperatorClosed (M : MonotoneOperator V) : Prop :=
  M.monotone ∧ M.hemicontinuous ∧ M.coercive ∧ M.bounded

theorem monotone_operator_closed_from_evidence
    (M : MonotoneOperator V) (E : MonotoneOperatorEvidence M) :
    MonotoneOperatorClosed M := by
  exact And.intro E.monotoneClosed
    (And.intro E.hemicontinuousClosed
      (And.intro E.coerciveClosed E.boundedClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse