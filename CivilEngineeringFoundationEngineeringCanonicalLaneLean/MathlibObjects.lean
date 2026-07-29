import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure FoundationSoilModel where
  soilType : String
  bearingCapacity : Float
  settlement : Float
  groundwaterDepth : Float

default soilType := "sand"

structure FoundationSystem where
  foundationType : String
  depth : Float
  width : Float
  length : Float
  appliedLoad : Float
  soil : FoundationSoilModel
  safetyFactor : Float

default foundationType := "shallow"

def defaultSafetyFactor : Float := 3.0

structure AdmittedFoundationObject where
  system : FoundationSystem
  stabilityVerified : Prop
  settlementCompliant : Prop
  conclusion : stabilityVerified ∧ settlementCompliant

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
