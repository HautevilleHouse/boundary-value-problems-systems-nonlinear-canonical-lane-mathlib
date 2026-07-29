import BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.NonlinearBoundaryLayer

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure IterativeMethod (S : BVPSystem) (L : NonlinearBoundaryLayer S) where
  iterationScheme : Type u
  convergenceRate : ℝ
  fixedPointReached : Prop
  residualBound : ℝ

def IterativeMethodClosed {S : BVPSystem} {L : NonlinearBoundaryLayer S} (M : IterativeMethod S L) : Prop :=
  M.fixedPointReached ∧ M.convergenceRate > 0 ∧ M.residualBound > 0

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse