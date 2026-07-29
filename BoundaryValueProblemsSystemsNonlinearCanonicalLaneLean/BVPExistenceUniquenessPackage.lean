import BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.WeakFormulationPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure BVPExistenceUniquenessPackage {N : NonlinearOperatorPackage}
    (W : WeakFormulationPackage N) where
  existence : Prop
  uniqueness : Prop
  stability : Prop
  regularity : Prop

structure BVPExistenceUniquenessEvidence {N : NonlinearOperatorPackage}
    {W : WeakFormulationPackage N} (E : BVPExistenceUniquenessPackage W) where
  existenceClosed : E.existence
  uniquenessClosed : E.uniqueness
  stabilityClosed : E.stability
  regularityClosed : E.regularity

def BVPExistenceUniquenessClosed {N : NonlinearOperatorPackage}
    {W : WeakFormulationPackage N} (E : BVPExistenceUniquenessPackage W) : Prop :=
  E.existence ∧ E.uniqueness ∧ E.stability ∧ E.regularity

theorem bvp_existence_uniqueness_closed_from_evidence
    {N : NonlinearOperatorPackage} {W : WeakFormulationPackage N}
    (E : BVPExistenceUniquenessPackage W) (Ev : BVPExistenceUniquenessEvidence E) :
    BVPExistenceUniquenessClosed E := by
  exact And.intro Ev.existenceClosed
    (And.intro Ev.uniquenessClosed
      (And.intro Ev.stabilityClosed Ev.regularityClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse