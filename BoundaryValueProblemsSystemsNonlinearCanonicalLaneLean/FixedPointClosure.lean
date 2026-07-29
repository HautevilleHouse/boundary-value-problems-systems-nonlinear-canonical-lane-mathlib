import BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.IterativeMethod

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure FixedPointClosure (S : BVPSystem) (L : NonlinearBoundaryLayer S) (M : IterativeMethod S L) where
  contractionConstant : ℝ
  banachFixedPointApplied : Prop
  solutionExistence : Prop
  uniquenessGuaranteed : Prop

def FixedPointClosed {S : BVPSystem} {L : NonlinearBoundaryLayer S} {M : IterativeMethod S L} (F : FixedPointClosure S L M) : Prop :=
  F.banachFixedPointApplied ∧ F.solutionExistence ∧ F.uniquenessGuaranteed

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse