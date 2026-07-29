import canonicalLaneMathlib.AdmissibleClass
import CivilEngineeringFoundationEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.admissible

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.admissible

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
