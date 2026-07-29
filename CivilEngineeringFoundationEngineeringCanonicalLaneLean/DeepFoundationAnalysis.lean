import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringFoundationEngineeringCanonicalLaneLean.SoilBearingCapacity

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure DeepFoundationAnalysisPackage {S : SoilBearingCapacityPackage}
    (B : SoilBearingCapacityEvidence S) where
  pileType : Prop
  pileCapacity : Prop
  skinFriction : Prop
  endBearing : Prop
  groupEfficiency : Prop
  settlementPrediction : Prop

structure DeepFoundationAnalysisEvidence {S : SoilBearingCapacityPackage}
    {B : SoilBearingCapacityEvidence S} (D : DeepFoundationAnalysisPackage B) where
  pileTypeClosed : D.pileType
  pileCapacityClosed : D.pileCapacity
  skinFrictionClosed : D.skinFriction
  endBearingClosed : D.endBearing
  groupEfficiencyClosed : D.groupEfficiency
  settlementPredictionClosed : D.settlementPrediction

def DeepFoundationAnalysisClosed {S : SoilBearingCapacityPackage}
    {B : SoilBearingCapacityEvidence S} (D : DeepFoundationAnalysisPackage B) : Prop :=
  D.pileType ∧ D.pileCapacity ∧ D.skinFriction ∧ D.endBearing ∧ D.groupEfficiency ∧ D.settlementPrediction

theorem deep_foundation_analysis_closed_from_evidence
    {S : SoilBearingCapacityPackage} {B : SoilBearingCapacityEvidence S}
    (D : DeepFoundationAnalysisPackage B) (E : DeepFoundationAnalysisEvidence D) :
    DeepFoundationAnalysisClosed D := by
  exact And.intro E.pileTypeClosed
    (And.intro E.pileCapacityClosed
      (And.intro E.skinFrictionClosed
        (And.intro E.endBearingClosed
          (And.intro E.groupEfficiencyClosed E.settlementPredictionClosed))))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
