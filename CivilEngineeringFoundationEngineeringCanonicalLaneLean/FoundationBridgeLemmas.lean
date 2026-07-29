import canonicalLaneMathlib.AdmissibleClass
import CivilEngineeringFoundationEngineeringCanonicalLaneLean.FoundationAdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  foundationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse