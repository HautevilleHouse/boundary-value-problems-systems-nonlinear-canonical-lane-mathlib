import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure WeakSolutionExistence where
  functionSpace : Type u
  weakFormulation : Prop
  existenceTheorem : Prop
  uniquenessCondition : Prop
  weakFormulationTerm : weakFormulation
  existenceTheoremTerm : existenceTheorem
  uniquenessConditionTerm : uniquenessCondition

structure WeakSolutionExistenceEvidence (W : WeakSolutionExistence) where
  weakFormulationClosed : W.weakFormulation
  existenceTheoremClosed : W.existenceTheorem
  uniquenessConditionClosed : W.uniquenessCondition

def WeakSolutionExistenceClosed (W : WeakSolutionExistence) : Prop :=
  W.weakFormulation ∧ W.existenceTheorem ∧ W.uniquenessCondition

theorem weak_solution_existence_closed_from_evidence
    (W : WeakSolutionExistence) (E : WeakSolutionExistenceEvidence W) :
    WeakSolutionExistenceClosed W := by
  exact And.intro E.weakFormulationClosed
    (And.intro E.existenceTheoremClosed E.uniquenessConditionClosed)

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse
