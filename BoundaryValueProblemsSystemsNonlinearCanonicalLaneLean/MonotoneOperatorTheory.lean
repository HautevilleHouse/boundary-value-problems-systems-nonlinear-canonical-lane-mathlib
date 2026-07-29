import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure MonotoneOperatorPackage where
  operator : Type u → Type u
  space : Type u
  innerProduct : space → space → ℝ
  monotonicityInequality : Prop
  coercivityCondition : Prop
  boundedness : Prop
  operatorClosed : Prop

def MonotoneOperatorClosed (M : MonotoneOperatorPackage) : Prop :=
  M.monotonicityInequality ∧ M.coercivityCondition ∧ M.boundedness ∧ M.operatorClosed

structure MonotoneOperatorEvidence (M : MonotoneOperatorPackage) where
  monotonicityInequalityClosed : M.monotonicityInequality
  coercivityConditionClosed : M.coercivityCondition
  boundednessClosed : M.boundedness
  operatorClosedClosed : M.operatorClosed

theorem monotone_operator_closed_from_evidence (M : MonotoneOperatorPackage) (E : MonotoneOperatorEvidence M) :
    MonotoneOperatorClosed M := by
  exact And.intro E.monotonicityInequalityClosed
    (And.intro E.coercivityConditionClosed
      (And.intro E.boundednessClosed E.operatorClosedClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse