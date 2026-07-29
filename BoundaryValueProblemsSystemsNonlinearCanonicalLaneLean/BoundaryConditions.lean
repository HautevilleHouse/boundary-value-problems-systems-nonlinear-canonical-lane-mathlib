import HautevilleHouse.BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.NonlinearPDESystem

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure BoundaryConditionsPackage {S : NonlinearPDESystemPackage} where
  boundaryOperator : Prop
  regularityCondition : Prop
  compatibilityCondition : Prop
  traceTheorem : Prop

structure BoundaryConditionsEvidence {S : NonlinearPDESystemPackage}
    (B : BoundaryConditionsPackage S) where
  boundaryOperatorClosed : B.boundaryOperator
  regularityConditionClosed : B.regularityCondition
  compatibilityConditionClosed : B.compatibilityCondition
  traceTheoremClosed : B.traceTheorem

def BoundaryConditionsClosed {S : NonlinearPDESystemPackage}
    (B : BoundaryConditionsPackage S) : Prop :=
  B.boundaryOperator ∧ B.regularityCondition ∧
  B.compatibilityCondition ∧ B.traceTheorem

theorem boundary_conditions_closed_from_evidence
    {S : NonlinearPDESystemPackage} (B : BoundaryConditionsPackage S)
    (E : BoundaryConditionsEvidence B) : BoundaryConditionsClosed B := by
  exact And.intro E.boundaryOperatorClosed
    (And.intro E.regularityConditionClosed
      (And.intro E.compatibilityConditionClosed E.traceTheoremClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse