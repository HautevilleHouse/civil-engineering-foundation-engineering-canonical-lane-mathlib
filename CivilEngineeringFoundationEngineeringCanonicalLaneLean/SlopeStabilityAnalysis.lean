import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure SlopeStabilityAnalysisPackage where
  factorOfSafety : Prop
  slipSurfaceGeometry : Prop
  shearStrengthParameters : Prop
  poreWaterPressure : Prop
  seismicLoading : Prop
  stabilizationMeasures : Prop

structure SlopeStabilityAnalysisEvidence (S : SlopeStabilityAnalysisPackage) where
  factorOfSafetyClosed : S.factorOfSafety
  slipSurfaceGeometryClosed : S.slipSurfaceGeometry
  shearStrengthParametersClosed : S.shearStrengthParameters
  poreWaterPressureClosed : S.poreWaterPressure
  seismicLoadingClosed : S.seismicLoading
  stabilizationMeasuresClosed : S.stabilizationMeasures

def SlopeStabilityAnalysisClosed (S : SlopeStabilityAnalysisPackage) : Prop :=
  S.factorOfSafety ∧ S.slipSurfaceGeometry ∧ S.shearStrengthParameters ∧
  S.poreWaterPressure ∧ S.seismicLoading ∧ S.stabilizationMeasures

theorem slope_stability_analysis_closed_from_evidence (S : SlopeStabilityAnalysisPackage)
    (E : SlopeStabilityAnalysisEvidence S) : SlopeStabilityAnalysisClosed S := by
  exact And.intro E.factorOfSafetyClosed
    (And.intro E.slipSurfaceGeometryClosed
      (And.intro E.shearStrengthParametersClosed
        (And.intro E.poreWaterPressureClosed
          (And.intro E.seismicLoadingClosed E.stabilizationMeasuresClosed))))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
