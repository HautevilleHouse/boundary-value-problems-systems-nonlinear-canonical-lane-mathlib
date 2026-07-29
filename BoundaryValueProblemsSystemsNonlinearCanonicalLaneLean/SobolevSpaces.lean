import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueSystemsNonlinearCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type u
  domainTopology : TopologicalSpace domain
  measure : Type v
  p : ℝ≥0∞
  exponentDefined : Prop
  embeddingTheorem : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  exponentDefinedClosed : S.exponentDefined
  embeddingTheoremClosed : S.embeddingTheorem

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.exponentDefined ∧ S.embeddingTheorem

theorem sobolev_space_closed_from_evidence
    (S : SobolevSpacePackage) (E : SobolevSpaceEvidence S) :
    SobolevSpaceClosed S := by
  exact And.intro E.exponentDefinedClosed E.embeddingTheoremClosed

end BoundaryValueSystemsNonlinearCanonicalLaneLean
end HautevilleHouse