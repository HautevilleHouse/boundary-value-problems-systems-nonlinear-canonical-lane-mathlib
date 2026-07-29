import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure FixedPointIndexPackage where
  space : Type u
  compactMap : space → space
  isolatedFixedPoints : space → Prop
  indexValue : ℤ
  indexAdditivity : Prop
  homotopyInvariance : Prop
  indexClosed : Prop

def FixedPointIndexClosed (F : FixedPointIndexPackage) : Prop :=
  F.indexAdditivity ∧ F.homotopyInvariance ∧ F.indexClosed

structure FixedPointIndexEvidence (F : FixedPointIndexPackage) where
  indexAdditivityClosed : F.indexAdditivity
  homotopyInvarianceClosed : F.homotopyInvariance
  indexClosedClosed : F.indexClosed

theorem fixed_point_index_closed_from_evidence (F : FixedPointIndexPackage) (E : FixedPointIndexEvidence F) :
    FixedPointIndexClosed F := by
  exact And.intro E.indexAdditivityClosed
    (And.intro E.homotopyInvarianceClosed E.indexClosedClosed)

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse