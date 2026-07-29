import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure FoundationAdmittedObject where
  soilProfile : String
  foundationType : String
  loads : ℝ
  admissible : Prop

structure AdmissibleClass where
  object : FoundationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.admissible) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
