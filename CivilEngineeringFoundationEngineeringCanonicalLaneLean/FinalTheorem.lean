import CivilEngineeringFoundationEngineeringCanonicalLaneLean.FoundationGateLemmas

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

def ConstrainedFoundationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_foundation_endgame (A : AdmissibleClass) :
    ConstrainedFoundationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse