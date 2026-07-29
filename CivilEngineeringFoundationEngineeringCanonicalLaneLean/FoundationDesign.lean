import HautevilleHouse.CivilEngineeringFoundationEngineeringCanonicalLaneLean.SlopeStability

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure FoundationDesignPackage {B : BearingCapacityPackage}
    {S : SettlementPackage B} {G : SlopeStabilityPackage S} where
  designType : String
  depth : ℝ
  width : ℝ
  reinforcementRatio : ℝ
  concreteStrength : ℝ
  steelStrength : ℝ
  designLoad : ℝ
  loadCombinationsConsidered : Prop
  structuralIntegrityChecked : Prop
  constructionMethod : String

structure FoundationDesignEvidence {B : BearingCapacityPackage}
    {S : SettlementPackage B} {G : SlopeStabilityPackage S}
    (D : FoundationDesignPackage G) where
  loadCombinationsClosed : D.loadCombinationsConsidered
  structuralIntegrityClosed : D.structuralIntegrityChecked
  designTypeDefined : D.designType ≠ ""
  constructionMethodDefined : D.constructionMethod ≠ ""

def FoundationDesignClosed {B : BearingCapacityPackage}
    {S : SettlementPackage B} {G : SlopeStabilityPackage S}
    (D : FoundationDesignPackage G) : Prop :=
  D.loadCombinationsConsidered ∧ D.structuralIntegrityChecked ∧
  D.designType ≠ "" ∧ D.constructionMethod ≠ ""

theorem foundation_design_closed_from_evidence
    {B : BearingCapacityPackage} {S : SettlementPackage B}
    {G : SlopeStabilityPackage S} (D : FoundationDesignPackage G)
    (E : FoundationDesignEvidence D) : FoundationDesignClosed D := by
  exact And.intro E.loadCombinationsClosed
    (And.intro E.structuralIntegrityClosed
      (And.intro E.designTypeDefined E.constructionMethodDefined))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse