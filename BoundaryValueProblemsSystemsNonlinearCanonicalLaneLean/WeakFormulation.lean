import HautevilleHouse.BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.BoundaryConditions

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure WeakFormulationPackage {S : NonlinearPDESystemPackage}
    {B : BoundaryConditionsPackage S} where
  weakFormulation : Prop
  testSpace : Prop
  bilinearForm : Prop
  weakSolutionConcept : Prop

structure WeakFormulationEvidence {S : NonlinearPDESystemPackage}
    {B : BoundaryConditionsPackage S} (W : WeakFormulationPackage S B) where
  weakFormulationClosed : W.weakFormulation
  testSpaceClosed : W.testSpace
  bilinearFormClosed : W.bilinearForm
  weakSolutionConceptClosed : W.weakSolutionConcept

def WeakFormulationClosed {S : NonlinearPDESystemPackage}
    {B : BoundaryConditionsPackage S} (W : WeakFormulationPackage S B) : Prop :=
  W.weakFormulation ∧ W.testSpace ∧ W.bilinearForm ∧ W.weakSolutionConcept

theorem weak_formulation_closed_from_evidence
    {S : NonlinearPDESystemPackage} {B : BoundaryConditionsPackage S}
    (W : WeakFormulationPackage S B) (E : WeakFormulationEvidence W) :
    WeakFormulationClosed W := by
  exact And.intro E.weakFormulationClosed
    (And.intro E.testSpaceClosed
      (And.intro E.bilinearFormClosed E.weakSolutionConceptClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse