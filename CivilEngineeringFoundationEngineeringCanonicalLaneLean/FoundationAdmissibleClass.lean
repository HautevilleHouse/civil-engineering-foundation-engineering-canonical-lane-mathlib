import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure FoundationEngineeringObject where
  soilType : String
  footingWidth : Float
  bearingCapacity : Float
  settlement : Float

structure FoundationAdmittedObject where
  foundation : FoundationEngineeringObject
  admissibleBearing : Prop
  settlementControlled : Prop
  conclusion : admissibleBearing ∧ settlementControlled

def foundationWitnessClosed (O : FoundationAdmittedObject) : Prop :=
  O.conclusion

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse