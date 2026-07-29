import BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.NonlinearOperatorPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure WeakFormulationPackage {N : NonlinearOperatorPackage} where
  testFunctionSpace : Type
  weakForm : Prop
  bilinearForm : Prop
  linearFunctional : Prop
  laxMilgramConditions : Prop

structure WeakFormulationEvidence {N : NonlinearOperatorPackage}
    (W : WeakFormulationPackage N) where
  weakFormClosed : W.weakForm
  bilinearFormClosed : W.bilinearForm
  linearFunctionalClosed : W.linearFunctional
  laxMilgramConditionsClosed : W.laxMilgramConditions

def WeakFormulationClosed {N : NonlinearOperatorPackage}
    (W : WeakFormulationPackage N) : Prop :=
  W.weakForm ∧ W.bilinearForm ∧ W.linearFunctional ∧ W.laxMilgramConditions

theorem weak_formulation_closed_from_evidence
    {N : NonlinearOperatorPackage} (W : WeakFormulationPackage N)
    (E : WeakFormulationEvidence W) : WeakFormulationClosed W := by
  exact And.intro E.weakFormClosed
    (And.intro E.bilinearFormClosed
      (And.intro E.linearFunctionalClosed E.laxMilgramConditionsClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse