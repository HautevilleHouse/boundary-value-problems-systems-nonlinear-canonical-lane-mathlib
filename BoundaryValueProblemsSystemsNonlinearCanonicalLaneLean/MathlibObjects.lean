import BoundaryValueSystemsNonlinearCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueSystemsNonlinearCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BoundaryValueNonlinearSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  boundaryMeasure : Type

structure BoundaryValueNonlinearAdmittedObject where
  space : BoundaryValueNonlinearSpace
  weakSolutionExists : Prop
  uniqueness : Prop
  regularity : Prop
  conclusion : weakSolutionExists ∧ uniqueness ∧ regularity

structure BoundaryValueNonlinearEndgameState where
  object : BoundaryValueNonlinearAdmittedObject

def BoundaryValueNonlinearWitnessClosed (O : BoundaryValueNonlinearAdmittedObject) : Prop :=
  O.weakSolutionExists ∧ O.uniqueness ∧ O.regularity

end BoundaryValueSystemsNonlinearCanonicalLaneLean
end HautevilleHouse