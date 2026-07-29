import BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.BVPSystemModel

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure NonlinearBoundaryLayer (S : BVPSystem) where
  boundaryCondition : Type w
  layerProfile : Prop
  layerWidth : ℝ
  stabilityMargin : ℝ
  compatibilityWithSystem : Prop

def NonlinearBoundaryLayerClosed {S : BVPSystem} (L : NonlinearBoundaryLayer S) : Prop :=
  L.layerProfile ∧ L.stabilityMargin > 0 ∧ L.compatibilityWithSystem

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse