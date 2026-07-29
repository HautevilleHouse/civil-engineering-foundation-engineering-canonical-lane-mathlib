import canonicalLaneMathlib.AdmissibleClass
import CivilEngineeringFoundationEngineeringCanonicalLaneLean.FoundationLayers

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure FoundationalLayerAnalyticCertificate (S : SoilLayerPackage) where
  layerThicknessValid : Prop
  compressibilityCoeff : Prop
  elasticModulusGiven : Prop
  layerThicknessValidClosed : layerThicknessValid
  compressibilityCoeffClosed : compressibilityCoeff
  elasticModulusGivenClosed : elasticModulusGiven
  layerEvidence : SoilLayerEvidence S

def FoundationalLayerAnalyticCertificateClosed (S : SoilLayerPackage) (L : FoundationalLayerAnalyticCertificate S) : Prop :=
  L.layerThicknessValid ∧ L.compressibilityCoeff ∧ L.elasticModulusGiven ∧ FoundationalLayerClosed S

theorem foundational_layer_analytic_certificate_closed
    (S : SoilLayerPackage) (L : FoundationalLayerAnalyticCertificate S) :
    FoundationalLayerAnalyticCertificateClosed S L := by
  exact And.intro L.layerThicknessValidClosed
    (And.intro L.compressibilityCoeffClosed
      (And.intro L.elasticModulusGivenClosed (foundational_layer_closed_from_evidence S L.layerEvidence)))

structure BearingCapacityAnalyticCertificate (B : BearingCapacityPackage) where
  shearStrengthParameters : Prop
  bearingCapacityFactors : Prop
  eccentricityConsidered : Prop
  shearStrengthParametersClosed : shearStrengthParameters
  bearingCapacityFactorsClosed : bearingCapacityFactors
  eccentricityConsideredClosed : eccentricityConsidered
  bearingEvidence : BearingCapacityEvidence B

def BearingCapacityAnalyticCertificateClosed (B : BearingCapacityPackage) (C : BearingCapacityAnalyticCertificate B) : Prop :=
  C.shearStrengthParameters ∧ C.bearingCapacityFactors ∧ C.eccentricityConsidered ∧ BearingCapacityClosed B

theorem bearing_capacity_analytic_certificate_closed
    (B : BearingCapacityPackage) (C : BearingCapacityAnalyticCertificate B) :
    BearingCapacityAnalyticCertificateClosed B C := by
  exact And.intro C.shearStrengthParametersClosed
    (And.intro C.bearingCapacityFactorsClosed
      (And.intro C.eccentricityConsideredClosed (bearing_capacity_closed_from_evidence B C.bearingEvidence)))

structure SettlementAnalyticCertificate (St : SettlementPackage) where
  elasticSettlementComputed : Prop
  consolidationSettlementComputed : Prop
  differentialSettlementChecked : Prop
  elasticSettlementComputedClosed : elasticSettlementComputed
  consolidationSettlementComputedClosed : consolidationSettlementComputed
  differentialSettlementCheckedClosed : differentialSettlementChecked
  settlementEvidence : SettlementEvidence St

def SettlementAnalyticCertificateClosed (St : SettlementPackage) (C : SettlementAnalyticCertificate St) : Prop :=
  C.elasticSettlementComputed ∧ C.consolidationSettlementComputed ∧ C.differentialSettlementChecked ∧ SettlementClosed St

theorem settlement_analytic_certificate_closed
    (St : SettlementPackage) (C : SettlementAnalyticCertificate St) :
    SettlementAnalyticCertificateClosed St C := by
  exact And.intro C.elasticSettlementComputedClosed
    (And.intro C.consolidationSettlementComputedClosed
      (And.intro C.differentialSettlementCheckedClosed (settlement_closed_from_evidence St C.settlementEvidence)))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
