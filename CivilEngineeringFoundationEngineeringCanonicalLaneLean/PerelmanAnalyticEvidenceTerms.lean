import canonicalLaneMathlib.AdmissibleClass
import CivilEngineeringFoundationEngineeringCanonicalLaneLean.FoundationAnalyticProof

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure FoundationalLayerEvidenceTerms {S : SoilLayerPackage} (L : FoundationalLayerAnalyticCertificate S) where
  layerThicknessValid : L.layerThicknessValid
  compressibilityCoeff : L.compressibilityCoeff
  elasticModulusGiven : L.elasticModulusGiven
  layerStratificationClosed : FoundationalLayerClosed S

def FoundationalLayerAnalyticCertificate.evidenceTerms
    {S : SoilLayerPackage} (L : FoundationalLayerAnalyticCertificate S) : 
    FoundationalLayerEvidenceTerms L :=
  {
    layerThicknessValid := L.layerThicknessValidClosed
    compressibilityCoeff := L.compressibilityCoeffClosed
    elasticModulusGiven := L.elasticModulusGivenClosed
    layerStratificationClosed := foundational_layer_closed_from_evidence S L.layerEvidence
  }

structure BearingCapacityEvidenceTerms {B : BearingCapacityPackage} (C : BearingCapacityAnalyticCertificate B) where
  shearStrengthParameters : C.shearStrengthParameters
  bearingCapacityFactors : C.bearingCapacityFactors
  eccentricityConsidered : C.eccentricityConsidered
  bearingCapacityClosed : BearingCapacityClosed B

def BearingCapacityAnalyticCertificate.evidenceTerms
    {B : BearingCapacityPackage} (C : BearingCapacityAnalyticCertificate B) :
    BearingCapacityEvidenceTerms C :=
  {
    shearStrengthParameters := C.shearStrengthParametersClosed
    bearingCapacityFactors := C.bearingCapacityFactorsClosed
    eccentricityConsidered := C.eccentricityConsideredClosed
    bearingCapacityClosed := bearing_capacity_closed_from_evidence B C.bearingEvidence
  }

structure SettlementAnalysisEvidenceTerms {St : SettlementPackage} 
    (C : SettlementAnalyticCertificate St) where
  elasticSettlementComputed : C.elasticSettlementComputed
  consolidationSettlementComputed : C.consolidationSettlementComputed
  differentialSettlementChecked : C.differentialSettlementChecked
  settlementClosed : SettlementClosed St

def SettlementAnalyticCertificate.evidenceTerms
    {St : SettlementPackage} (C : SettlementAnalyticCertificate St) :
    SettlementAnalysisEvidenceTerms C :=
  {
    elasticSettlementComputed := C.elasticSettlementComputedClosed
    consolidationSettlementComputed := C.consolidationSettlementComputedClosed
    differentialSettlementChecked := C.differentialSettlementCheckedClosed
    settlementClosed := settlement_closed_from_evidence St C.settlementEvidence
  }

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
