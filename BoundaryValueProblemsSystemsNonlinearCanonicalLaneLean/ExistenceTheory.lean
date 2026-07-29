import HautevilleHouse.BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.WeakFormulation

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure ExistenceTheoryPackage {S : NonlinearPDESystemPackage}
    {B : BoundaryConditionsPackage S} {W : WeakFormulationPackage S B} where
  existenceResult : Prop
  uniquenessResult : Prop
  stabilityResult : Prop
  regularityResult : Prop

structure ExistenceTheoryEvidence {S : NonlinearPDESystemPackage}
    {B : BoundaryConditionsPackage S} {W : WeakFormulationPackage S B}
    (E : ExistenceTheoryPackage S B W) where
  existenceResultClosed : E.existenceResult
  uniquenessResultClosed : E.uniquenessResult
  stabilityResultClosed : E.stabilityResult
  regularityResultClosed : E.regularityResult

def ExistenceTheoryClosed {S : NonlinearPDESystemPackage}
    {B : BoundaryConditionsPackage S} {W : WeakFormulationPackage S B}
    (E : ExistenceTheoryPackage S B W) : Prop :=
  E.existenceResult ∧ E.uniquenessResult ∧ E.stabilityResult ∧ E.regularityResult

theorem existence_theory_closed_from_evidence
    {S : NonlinearPDESystemPackage} {B : BoundaryConditionsPackage S}
    {W : WeakFormulationPackage S B} (E : ExistenceTheoryPackage S B W)
    (Ev : ExistenceTheoryEvidence E) : ExistenceTheoryClosed E := by
  exact And.intro Ev.existenceResultClosed
    (And.intro Ev.uniquenessResultClosed
      (And.intro Ev.stabilityResultClosed Ev.regularityResultClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse