import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringFoundationEngineeringCanonicalLaneLean.SoilBearingCapacity

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure ShallowFoundationDesignPackage {S : SoilBearingCapacityPackage}
    (B : SoilBearingCapacityEvidence S) where
  footingDimensions : Prop
  depthOfFooting : Prop
  reinforcementDesign : Prop
  slidingStability : Prop
  overturningStability : Prop

structure ShallowFoundationDesignEvidence {S : SoilBearingCapacityPackage}
    {B : SoilBearingCapacityEvidence S} (D : ShallowFoundationDesignPackage B) where
  footingDimensionsClosed : D.footingDimensions
  depthOfFootingClosed : D.depthOfFooting
  reinforcementDesignClosed : D.reinforcementDesign
  slidingStabilityClosed : D.slidingStability
  overturningStabilityClosed : D.overturningStability

def ShallowFoundationDesignClosed {S : SoilBearingCapacityPackage}
    {B : SoilBearingCapacityEvidence S} (D : ShallowFoundationDesignPackage B) : Prop :=
  D.footingDimensions ∧ D.depthOfFooting ∧ D.reinforcementDesign ∧ D.slidingStability ∧ D.overturningStability

theorem shallow_foundation_design_closed_from_evidence
    {S : SoilBearingCapacityPackage} {B : SoilBearingCapacityEvidence S}
    (D : ShallowFoundationDesignPackage B) (E : ShallowFoundationDesignEvidence D) :
    ShallowFoundationDesignClosed D := by
  exact And.intro E.footingDimensionsClosed
    (And.intro E.depthOfFootingClosed
      (And.intro E.reinforcementDesignClosed
        (And.intro E.slidingStabilityClosed E.overturningStabilityClosed)))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
