import Mathlib

/-!
# Matrices over valuation rings and elementary inputs: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states, against the pinned Mathlib, suggested forms of the targets of the roadmap that need no
carrier beyond Mathlib's: the Smith form over a valuation domain (1.3 (a)), the length of the
kernel of a matrix modulo an element of a discrete valuation ring (2.1 (b)), the Cauchy–Schwarz
inequality for determinants (4.1 (a), (b)), generic points for the Gauss norm (5.1 (b)), the
functional equation of the exponential of a series (6.1 (b)), the combinatorial Nullstellensatz
with multiplicity (7.1) and the choice of a prime whose quadratic twists have no zero in a box
(8.2). It is a list of suggested forms, not an exhaustive checklist.

The following are not stated here.

* Valuation pairs and the Hermite and Smith forms over them (1.1, 1.2, 1.3 (b)), the generalised
  index and Jacobi's identity (3.1, 3.2): they are statable with Mathlib's matrices, subrings and
  `MeasureTheory.distribHaarChar`, but rest on the definition of a valuation pair and of the
  generalised index, which the README fixes; no signature is given for them in this file.
* The forms of Hadamard's and Fischer's inequalities for a positive semidefinite form (4.1 (c)),
  the remaining items of 5.1, and 6.2: they are corollaries or variants of statements given here
  or in Tau Ceti.
* The zero-density count 8.1, whose statement is the one of 8.2 with a count in place of an
  existence.
-/

namespace TauCetiRoadmap.ShortGRH.MatricesOverValuationRingsAndElementaryInputs

open Matrix

/-! ## Layer 1: the Smith form over a valuation domain -/

/-- **Smith form over a valuation domain** (1.3 (a)). Every square matrix over a valuation domain
is equivalent, by matrices of unit determinant, to a diagonal matrix whose entries form a
divisibility chain. Zero entries are allowed. The ring need not be discrete or noetherian. -/
theorem exists_smith_normal_form_of_valuationRing {O : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] {n : ℕ} (M : Matrix (Fin n) (Fin n) O) :
    ∃ (L Q : Matrix (Fin n) (Fin n) O) (s : Fin n → O), IsUnit L.det ∧ IsUnit Q.det ∧
      (∀ ⦃i j : Fin n⦄, i ≤ j → s i ∣ s j) ∧ L * M * Q = diagonal s := by
  sorry

/-! ## Layer 2: the length of the kernel of a matrix modulo an element -/

section Minors

variable {O r k : Type*} [CommRing O] [Fintype k] [DecidableEq k]

/-- The maximal minors of the matrix made of the rows of `M` and of `a • 1` (2.1): the
determinants of the choices of `card k` rows, a choice with a repetition giving `0`. The rows of
`M` may be infinitely many. -/
def maximalMinors (M : Matrix r k O) (a : O) : Set O :=
  Set.range fun f : k → r ⊕ k ↦ ((M.fromRows (a • 1)).submatrix f id).det

/-- The kernel of `M` on `B ^ k`, for an `O`-module `B` (2.1). -/
def matrixKernel (M : Matrix r k O) (B : Type*) [AddCommGroup B] [Module O B] :
    Submodule O (k → B) :=
  ⨅ i : r, LinearMap.ker (∑ j : k, M i j • LinearMap.proj j : (k → B) →ₗ[O] B)

/-- **Lengths by minors** (2.1 (b)). Over a discrete valuation ring `O` and for `a ≠ 0`, the
length of the kernel of `M` on `(O / a) ^ k` is the least valuation of a maximal minor of the
matrix made of the rows of `M` and of `a • 1`. -/
theorem isLeast_length_matrixKernel [IsDomain O] [IsDiscreteValuationRing O] (M : Matrix r k O)
    {a : O} (ha : a ≠ 0) :
    IsLeast (IsDiscreteValuationRing.addVal O '' maximalMinors M a)
      (Module.length O (matrixKernel M (O ⧸ Ideal.span {a}))) := by
  sorry

end Minors

/-! ## Layer 4: the Cauchy–Schwarz inequality for determinants -/

section Determinants

variable {𝕜 ι : Type*} [RCLike 𝕜] [Fintype ι] [DecidableEq ι]

open scoped ComplexOrder in
/-- **Cauchy–Schwarz inequality for determinants**, block form (4.1 (a)). If the block matrix with
rows `(P, X)` and `(Xᴴ, Q)`, all blocks square of the same size, is positive semidefinite, then
`|det X|² ≤ |det P|·|det Q|`. -/
theorem norm_det_sq_le_of_posSemidef_fromBlocks {P X Q : Matrix ι ι 𝕜}
    (h : (fromBlocks P X Xᴴ Q).PosSemidef) : ‖X.det‖ ^ 2 ≤ ‖P.det‖ * ‖Q.det‖ := by
  sorry

open scoped InnerProductSpace in
/-- **Cauchy–Schwarz inequality for determinants**, Gram form (4.1 (b)). For two families `u`, `w`
of the same finite size in an inner product space,
`|det ⟪u i, w k⟫|² ≤ |det ⟪u i, u k⟫|·|det ⟪w i, w k⟫|`. -/
theorem norm_det_inner_sq_le {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
    (u w : ι → E) :
    ‖(of fun i k ↦ ⟪u i, w k⟫_𝕜).det‖ ^ 2 ≤ ‖(gram 𝕜 u).det‖ * ‖(gram 𝕜 w).det‖ := by
  sorry

end Determinants

/-! ## Layer 5: generic points for the Gauss norm -/

/-- **Generic points** (5.1 (b)), in multiplicative form. Over an algebraically closed field with a
nontrivial non-archimedean norm, finitely many polynomials attain their Gauss norms of a radius
`c` of the value group at one common point of norm at most `c`. With `c = b ^ (-ρ)` and
`v = -log_b ‖·‖` this is the statement of the README for the Gauss valuation of radius `ρ`. -/
theorem exists_forall_norm_eval_eq_gaussNorm {K : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [IsAlgClosed K] {m : Type*} [Finite m] (g : m → Polynomial K) {c : ℝ}
    (hc : c ∈ Set.range (norm : K → ℝ)) (hc₀ : c ≠ 0) :
    ∃ y : K, ‖y‖ ≤ c ∧ ∀ i, ‖(g i).eval y‖ = (g i).gaussNorm (NormedField.toAbsoluteValue K) c := by
  sorry

/-! ## Layer 6: the exponential of a power series -/

/-- **The functional equation of the exponential of a series** (6.1 (b)). For power series `G`,
`G'` in several variables without constant term over a `ℚ`-algebra,
`exp (G + G') = exp G * exp G'`, where `exp G` is the exponential series with `G` substituted. -/
theorem exp_subst_add {𝔸 σ : Type*} [CommRing 𝔸] [Algebra ℚ 𝔸] {G G' : MvPowerSeries σ 𝔸}
    (hG : MvPowerSeries.constantCoeff G = 0) (hG' : MvPowerSeries.constantCoeff G' = 0) :
    (PowerSeries.exp 𝔸).subst (G + G') =
      (PowerSeries.exp 𝔸).subst G * (PowerSeries.exp 𝔸).subst G' := by
  sorry

/-! ## Layer 7: the combinatorial Nullstellensatz with multiplicity -/

open MvPolynomial in
/-- **The combinatorial Nullstellensatz with multiplicity and weights** (7.1). Give the variable
`u` the cost `1 / κ u`. Take at least `∏ u, κ u` distinct points `z t` at which each `X u ^ κ u`
agrees with a polynomial `g u` all of whose monomials cost less than `1`. Then every nonzero
polynomial that vanishes to order `δ` at these points has a monomial of cost at least `δ`. -/
theorem exists_le_weight_of_mem_vanishingIdeal_pow {K ι S : Type*} [Field K] [Fintype ι]
    [Fintype S] (κ : ι → ℕ) (hκ : ∀ u, 0 < κ u) (z : S → ι → K) (hz : Function.Injective z)
    (hcard : ∏ u, κ u ≤ Fintype.card S) (g : ι → MvPolynomial ι K)
    (hg_cost : ∀ u, ∀ α ∈ (g u).support, Finsupp.weight (fun u ↦ ((κ u : ℝ))⁻¹) α < 1)
    (hg_eval : ∀ u t, eval (z t) (g u) = z t u ^ κ u) (δ : ℕ) (f : MvPolynomial ι K)
    (hf : f ≠ 0) (hf_van : ∀ t, f ∈ vanishingIdeal K {z t} ^ δ) :
    ∃ α ∈ f.support, (δ : ℝ) ≤ Finsupp.weight (fun u ↦ ((κ u : ℝ))⁻¹) α := by
  sorry

/-! ## Layer 8: a prime whose quadratic twists have no zero in a box -/

/-- The product `ξ·(·/d)` of a Dirichlet character `ξ` modulo `N` and the Legendre symbol of the
prime `d`, a Dirichlet character modulo `N * d` (Conventions, **Characters**). -/
noncomputable def quadraticTwist {N : ℕ} (d : ℕ) [Fact d.Prime] (ξ : DirichletCharacter ℂ N) :
    DirichletCharacter ℂ (N * d) :=
  DirichletCharacter.changeLevel (Dvd.intro d rfl) ξ *
    DirichletCharacter.changeLevel (Dvd.intro_left N rfl)
      ((quadraticChar (ZMod d)).ringHomComp (Int.castRingHom ℂ))

/-- **Choice of the prime** (8.2). Let `β > 1/2`, `H` real and `a` an invertible class modulo `N`
all of whose primes are `≡ 7 (mod 8)` and prime to `N`. Then for some prime `d` of the class no
`L(s, ξ·(·/d))`, `ξ` modulo `N`, vanishes in `β ≤ Re s`, `|Im s| ≤ H`. It is a theorem of
[ShortProof], `Lib/Analytic/QuadraticTwist.lean` (`New.exists_entireL_quadTwist_ne_zero`). -/
theorem exists_prime_LFunction_quadraticTwist_ne_zero {N : ℕ} [NeZero N] {β : ℝ} (H : ℝ)
    {a : ZMod N} (hβ : 1 / 2 < β) (ha : IsUnit a)
    (hclass : ∀ d : ℕ, d.Prime → (d : ZMod N) = a → d % 8 = 7 ∧ N.Coprime d) :
    ∃ (d : ℕ) (_ : Fact d.Prime), (d : ZMod N) = a ∧
      ∀ (ξ : DirichletCharacter ℂ N) (s : ℂ), β ≤ s.re → |s.im| ≤ H →
        (quadraticTwist d ξ).LFunction s ≠ 0 := by
  sorry

end TauCetiRoadmap.ShortGRH.MatricesOverValuationRingsAndElementaryInputs
