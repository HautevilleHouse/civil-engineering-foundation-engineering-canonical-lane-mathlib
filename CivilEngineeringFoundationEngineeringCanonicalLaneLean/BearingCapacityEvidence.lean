import CivilEngineeringFoundationEngineeringCanonicalLaneLean.FoundationAdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure BearingCapacityPackage where
  soilType : String
  unitWeight : Float
  cohesion : Float
  frictionAngle : Float
  footingWidth : Float
  footingDepth : Float
  bearingCapacityFactor_Nc : Float
  bearingCapacityFactor_Nq : Float
  bearingCapacityFactor_Ng : Float
  ultimateBearingCapacity : Float
  allowableBearingCapacity : Float
  factorOfSafety : Float

structure BearingCapacityEvidence (B : BearingCapacityPackage) where
  ultimateCalculated : B.ultimateBearingCapacity > 0
  allowableCalculated : B.allowableBearingCapacity > 0
  safetyFactorMet : B.ultimateBearingCapacity / B.allowableBearingCapacity ≥ B.factorOfSafety

def BearingCapacityClosed (B : BearingCapacityPackage) : Prop :=
  B.ultimateBearingCapacity > 0 ∧ B.allowableBearingCapacity > 0 ∧
  B.ultimateBearingCapacity / B.allowableBearingCapacity ≥ B.factorOfSafety

theorem bearing_capacity_closed_from_evidence (B : BearingCapacityPackage)
    (E : BearingCapacityEvidence B) : BearingCapacityClosed B := by
  exact And.intro E.ultimateCalculated (And.intro E.allowableCalculated E.safetyFactorMet)

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse