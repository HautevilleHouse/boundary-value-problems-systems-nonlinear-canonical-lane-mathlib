import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure LeraySchauderDegree where
  baseSpace : Type u
  norm : baseSpace → ℝ
  compactOperator : baseSpace → baseSpace
  degreeValue : ℤ
  degreeWellDefined : Prop
  homotopyInvariance : Prop

def LeraySchauderDegreeClosed (D : LeraySchauderDegree) : Prop :=
  D.degreeWellDefined ∧ D.homotopyInvariance

structure LeraySchauderDegreeEvidence (D : LeraySchauderDegree) where
  degreeWellDefinedClosed : D.degreeWellDefined
  homotopyInvarianceClosed : D.homotopyInvariance

theorem leray_schauder_degree_closed_from_evidence (D : LeraySchauderDegree) (E : LeraySchauderDegreeEvidence D) :
    LeraySchauderDegreeClosed D := by
  exact And.intro E.degreeWellDefinedClosed E.homotopyInvarianceClosed

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse