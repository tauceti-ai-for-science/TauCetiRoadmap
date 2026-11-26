# Roadmap: characters of unitary groups of rank one and Weil data

**Summary.** Let `E` be a CM field with maximal totally real subfield `E⁺`, complex conjugation `x ↦ x̄`, and a CM type
`Φ`. The norm-one torus `U(1)` of `E/E⁺` has the adelic points `U(1)(𝔸) = {u ∈ 𝔸_E^× : uū = 1}` and the rational points
`U(1)(E⁺) = {γ ∈ E^× : γγ̄ = 1}`; the quotient `[U(1)] = U(1)(𝔸)/U(1)(E⁺)` is compact. This roadmap is the theory of
the characters of `[U(1)]` that the family `ShortGRH` uses, and of the arithmetic data on `E` that fix its Weil
representations. Its objects are: characters of `[U(1)]` with a *weight* `e : Φ → ℤ` and a *tame part* (a family of
characters of the residue fields); their base change `ν̃(x) = ν(x/x̄)` to Hecke characters of `E`; the partial L-values
`L^S(z, ν)` of the base change at real `z ≥ 1`; *splitting characters* `υ`, unitary Hecke characters of `E` that are
`∏_{τ∈Φ} x_τ/|x_τ|` on the ideles with unit finite part and satisfy `υ(x̄) = υ(x)⁻¹`; and *Weil data* `(υ, ȷ, α)`.

The headline theorems are these.

(1) *Hilbert's Theorem 90 for finite ideles* (1.2). For an automorphism `σ` of order `n` of a number field `L`, a
finite adele `u` of `L` with `u·σ(u)⋯σ^{n−1}(u) = 1` is `c/σ(c)` for a finite idele `c`. For a CM field, every finite
idele `u` with `uū = 1` is `y/ȳ`, and every point of `U(1)(𝔸)` is `y/ȳ` for an idele `y`.

(2) *Existence and finiteness* (2.2). A character of `[U(1)]` of weight `e` and tame part `ψ` exists if and only if
`∏_{τ∈Φ} τ(γ)^{e(τ)}·∏_w ψ_w(γ mod w) = 1` for every algebraic integer `γ` of `E` with `γγ̄ = 1`, and the characters
with given `(e, ψ)` are finite in number.

(3) *Partial L-values* (3.1). For a character `ν` of `[U(1)]` of nonzero weight and a finite set `S` of finite places
outside of which (and of the conjugates of which) `ν̃` is unramified, the Euler product `L^S(z, ν)` over the places
outside `S ∪ S̄` has a limit as `z → 1⁺`, the function `z ↦ L^S(z, ν)` is continuous and has no zero on `[1, ∞)`, and
`L^S(z, ν⁻¹) = L^S(z, ν)`.

(4) *Splitting characters* (4.1, 4.2). A splitting character restricts to the ideles of `E⁺` as the quadratic
character of `E/E⁺`, and so takes the value `−1` at the uniformisers of the finite places `w = w̄`. One exists when
`E` contains a primitive root of unity of order `5040` and every root of unity of `E` is `δ/δ̄` for a unit `δ` of `𝒪_E`
with `∏_{τ∈Φ} τ(δ) = 1`.

The roadmap builds on Tau Ceti's ideles, idele norm and Hecke characters of a number field, and on Mathlib's CM
fields. It takes the continuation and the non-vanishing of the L-functions of algebraic Hecke characters from
LFunctions (its presented L-function and the non-vanishing on the boundary line), and states only the identification
of `L^S(z, ν)` with those. Its splitting characters are, in each rank, splitting characters in the sense of
MetaplecticAutomorphicForms and of ThetaKernelsForUnitaryDualPairs (a Hecke character with a prescribed restriction to
the ideles of `E⁺`); this roadmap supplies the particular one that the route uses. It feeds the roadmaps of the family
`ShortGRH` that name characters of `U(1)`, twists, Hecke L-values and Weil data: DivisibilityOfThetaDerivatives,
OneSidedPrimeSumBoundsAndAdmissibleData, DeterminantsOfThetaLiftChains, ThetaLiftChainsAndTheSeesawIdentity and
SelmerBoundsForAnticyclotomicTwists.

There are four layers. Layer 1 is the group `U(1)(𝔸)`, Hilbert's Theorem 90 for finite ideles and the class groups of
`U(1)`. Layer 2 is the characters of `[U(1)]` with a weight and a tame part: their laws, existence and finiteness,
base change, the arithmetic of their values, and the two kinds of tamely ramified characters that the route names.
Layer 3 is the partial L-values. Layer 4 is splitting characters and Weil data.

## Conventions and notation

- *Labels.* The labels are those of the [index of the family](../README.md). Under each section heading, `*Origin:*`
  says where its statement comes from and `*Method of the formal proof:*` how [ShortProof] proves it. [ShortProof] is
  the formal proof whose route the family `ShortGRH` states (References); the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under its directory `src/`) and the
  declarations where it proves the statement. The names of [ShortProof] occur only on that line. A roadmap is cited
  by section number: `Name §k.n (what is taken)`.
- *The field.* `E` is a CM field in the sense of Mathlib's
  [`NumberField.IsCMField`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/NumberField/CMField.html),
  `E⁺` its maximal totally real subfield (`NumberField.maximalRealSubfield`), and `x ↦ x̄` its complex conjugation
  (`NumberField.IsCMField.complexConj`), the nontrivial element of `Gal(E/E⁺)`. `𝒪_E` is the ring of integers, `𝔇_E`
  its different over `ℤ`, and `h_E` the class number.
- *Places.* A finite place `w` of `E` is a nonzero prime of `𝒪_E`; `E_w` is the completion, `𝒪_w` its ring of
  integers, `𝔽_w` the residue field, `q_w = #𝔽_w`, `v_w` the normalised valuation and `|x|_w = q_w^{−v_w(x)}`. The
  conjugate place `w̄` is the image of `w` under conjugation; conjugation maps `E_w` onto `E_{w̄}`. For a set `S` of
  finite places, `S̄ = {w̄ : w ∈ S}`.
- *CM types.* `Φ` is a CM type of `E` (Tau Ceti's `TauCeti.CMType`): a set of embeddings `τ : E → ℂ` containing exactly
  one of each conjugate pair `{τ, τ̄}`, `τ̄(x) = τ(x̄)`. The elements of `Φ` correspond to the infinite places of `E`.
  Weights, splitting characters and Weil data depend on `Φ`.
- *Ideles.* `𝔸_E^×` is the idele group of `E` (Mathlib's `NumberField.IdeleGroup`), `𝔸_{E,f}^×` the group of finite
  ideles, and `Ô` the ring of finite adeles that are integral at every finite place. A finite idele is read as an
  idele with components `1` at the infinite places, and an element of `E_w^×` as the finite idele with that component
  at `w` and `1` elsewhere. For an idele `x` and `τ ∈ Φ`, `x_τ ∈ ℂ^×` is the image of the component of `x` at the place
  of `τ` under the continuous extension of `τ` to the completion. Conjugation acts on the ideles through the action of
  `Gal(E/E⁺)` (Tau Ceti's `ideleMulDistribMulAction`): `(x̄)_w = conj(x_{w̄})` and `(x̄)_τ = conj(x_τ)`, where `conj`
  is complex conjugation of `ℂ` and the isomorphism `E_{w̄} → E_w` induced by conjugation. The ideles fixed by
  conjugation are the ideles of `E⁺` (Tau Ceti's `mem_range_ideleExtension_iff`). `|x|` is the idele norm (Tau Ceti's
  `ideleNorm`, with values in the positive reals: the square of the absolute value at each infinite place of `E`, and
  `|·|_w` at each finite place).
- *Hecke characters.* A Hecke character of `E` is a continuous homomorphism `𝔸_E^×/E^× → ℂ^×` (Tau Ceti's
  `HeckeCharacter`); it is unitary if its values have absolute value `1`. A Hecke character `χ` is *unramified* at a
  finite place `w` if it is trivial on `𝒪_w^×`; then `χ(ϖ_w)` is its value at any uniformiser of `E_w`.
- *Base change.* In this roadmap the base change of a character `ν` of `[U(1)]` is the Hecke character
  `ν̃(x) = ν(x/x̄)` of `E` (2.3). It is not the base change of Hecke characters along a field extension (Tau Ceti's
  `HeckeCharacter.baseChange`, composition with the norm).

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, E⁺, x̄, Φ` | a CM field, its maximal totally real subfield, complex conjugation, a CM type | Conventions |
| `w, w̄, E_w, 𝒪_w, 𝔽_w, q_w, S̄` | a finite place, its conjugate, completion, integers, residue field, its order, the conjugate set | Conventions |
| `x_τ`, `\|x\|`, `Ô` | the component of an idele read through `τ ∈ Φ`, the idele norm, the integral finite adeles | Conventions |
| `U(1)(𝔸), U(1)(E⁺), [U(1)]` | norm-one ideles, norm-one elements, their quotient | 1.1 |
| `K_S, Cl_S` | the integral points congruent to `1` at `S`, the class group of `U(1)` of tame level `S` | 1.3 |
| `e, ψ` | a weight `Φ → ℤ`, a tame part `(ψ_w)_w` | 2.1 |
| `ν̃` | the base change `x ↦ ν(x/x̄)` | 2.3 |
| `\|x\|_σ` | the absolute value of a finite idele at an embedding `σ : E → ℂ_p` | 2.4 |
| `χ_𝔠, χ_ψ` | the local character of a split tame character, the character of `𝒪_E/𝔪` of a tame part | 2.5 |
| `L^S(z, ν)` | the partial L-value | 3.1 |
| `υ, υ₁` | a splitting character, its restriction to `U(1)(𝔸)` | 4.1, 4.3 |
| `χ_f` | the character `x ↦ υ(x)·\|x\|^{−1/2}` of the finite ideles | 4.4 |
| `ȷ, α, c₀` | the skew element and the finite idele of Weil data, `(1 − ȷ⁻¹)/2` | 4.5 |

## Layer 1: Norm-one ideles and Hilbert's Theorem 90

This layer is the group on which the characters live. It defines `U(1)(𝔸)` and `[U(1)]` (1.1), proves Hilbert's
Theorem 90 for finite ideles and its consequences for a CM field (1.2), and defines the class groups of `U(1)` of tame
level, which are finite quotients of the ideal class group of `E` (1.3).

### 1.1 The groups `U(1)(𝔸)`, `U(1)(E⁺)` and `[U(1)]`

*Origin:* definitions and conventions; the compactness is published (the norm-one torus of a quadratic extension is
anisotropic, and the adelic quotient of an anisotropic torus is compact; Platonov and Rapinchuk, §5.3).

*Method of the formal proof:* definitions; (b) follows from `|ū| = |u|` and `|u|·|ū| = 1`. [ShortProof] does not state
(c).

`U(1)` is the norm-one torus of `E/E⁺`, a group over `E⁺`. Define its adelic points `U(1)(𝔸) := {u ∈ 𝔸_E^× : uū = 1}`,
a closed subgroup of the ideles, its rational points `U(1)(E⁺) := {γ ∈ E^× : γγ̄ = 1}`, embedded diagonally, and
`[U(1)] := U(1)(𝔸)/U(1)(E⁺)`. A *character of `[U(1)]`* is a continuous homomorphism `U(1)(𝔸) → S¹` trivial on
`U(1)(E⁺)`; these form a group under pointwise multiplication.

(a) `U(1)(𝔸)` is the kernel of the norm map from the ideles of `E` to the ideles of `E⁺` (Tau Ceti's `ideleNormMap`),
and `U(1)(𝔸) ∩ E^× = U(1)(E⁺)`.

(b) For `u ∈ U(1)(𝔸)`: `|u_τ| = 1` for every `τ ∈ Φ`, `u_{w̄} = conj(u_w)^{−1}` at every finite place, and
`|u| = 1`. If every finite component of `u` is integral, then every finite component is a unit.

(c) `[U(1)]` is compact: the map `[U(1)] → 𝔸_E^×/E^×` is a closed embedding into the idele classes of norm one, which
are compact (Tau Ceti's `isCompact_normOne`).

**Checks.**

- `E = ℚ(i)`: `U(1)(E⁺)` contains `(3 + 4i)/5`, which is not a unit at the two places above `5`; `U(1)(𝔸)` is not
  contained in the ideles with unit finite part.
- At a finite place `w = w̄` the component `u_w` lies in the norm-one subgroup of `E_w^×`; at a pair `w ≠ w̄` the
  component `u_w ∈ E_w^×` is arbitrary and determines `u_{w̄}`.

*Needs:* Mathlib `NumberField.IsCMField`, `NumberField.IsCMField.complexConj`, `NumberField.IdeleGroup`; Tau Ceti
`ideleMulDistribMulAction`, `ideleNormMap`, `ideleNorm`, `isCompact_normOne`.

[ShortProof], `Lib/ClassField/HeckeCharacter/Basic.lean` (`New.AutChar`, `New.rationalU1`, `New.norm_unitary_fst`,
`New.isUnit_reduceAt_unitary`); `Lib/Adelic/Adeles/IdeleModulus.lean` (`New.ideleAbs_star`,
`New.ideleAbs_eq_one_of_mem_unitary`)

### 1.2 Hilbert's Theorem 90 for finite ideles

*Origin:* published (the vanishing of the first cohomology of the ideles of a Galois extension, in degree one and for
a cyclic group: Neukirch, Schmidt and Wingberg, Chapter VIII §1; Hilbert's Theorem 90 for fields is Hilbert (1897),
Satz 90). The statement for finite ideles alone and the corollaries for a CM field are in the form the family uses.

*Method of the formal proof:* the map `x ↦ u·σ(x)` on the finite adeles is semilinear over `σ` and of order `n`, so by
Galois descent its fixed points span the finite adeles over `L`; of two fixed points, taking at each place the one of
larger valuation gives a fixed point that divides both, so some fixed point divides `1`. For (c), the finite part is
(b) and at each infinite place `u_τ = z/z̄` for a square root `z` of `u_τ`.

(a) Let `L` be a number field and `σ` an automorphism of `L` of order `n`, acting on the finite adeles of `L` (Tau
Ceti's `finiteAdeleGaloisAction`). If a finite adele `u` satisfies `u·σ(u)⋯σ^{n−1}(u) = 1`, then there is a finite
idele `c` with `u = c/σ(c)`.

(b) Let `E` be a CM field. Every finite idele `u` of `E` with `uū = 1` is `y/ȳ` for a finite idele `y`.

(c) Every `u ∈ U(1)(𝔸)` is `y/ȳ` for an idele `y` of `E`. Hence `x ↦ x/x̄` is a continuous surjective homomorphism
`𝔸_E^× → U(1)(𝔸)` whose kernel is the group of ideles of `E⁺`; it is open.

**Checks.**

- (a) for `n = 1` is trivial (`u = 1`); for `σ` conjugation of a CM field it is (b).
- (b) does not give `y` with unit components where `u` has unit components and `E_w/E⁺_v` is ramified: for
  `E = ℚ(i)` and `u = i` at the place above `2`, `i = y/ȳ` forces `v(y)` odd.

The rational analogue, that every `γ ∈ U(1)(E⁺)` is `b/b̄` with `b ∈ E^×`, is Hilbert's Theorem 90 for the cyclic
extension `E/E⁺`, which Mathlib proves; the cohomological form of that theorem for fields is stated in the roadmap
ProfiniteCohomology, in its section on Hilbert 90, and is not needed here.

*Needs:* 1.1; Mathlib `groupCohomology.Hilbert90.exists_div_of_norm_eq_one`; Tau Ceti `finiteAdeleGaloisAction`,
`mem_range_ideleExtension_iff`.

[ShortProof], `Lib/GaloisRep/Hilbert90/UnitaryGroups.lean` (`New.hilbert90_finite_idele`);
`Lib/ClassField/HeckeCharacter/Basic.lean` (`New.exists_snd_div_divStar_finIdeleIncl_eq_one`,
`New.exists_eq_mul_star`, `New.divStar_surjective`); `Lib/ClassField/HeckeCharacter/SplittingCharacters.lean`
(`New.divStar_eq_one_iff`). [ShortProof] does not state that the map of (c) is open; it uses this, through the open
mapping theorem for locally compact groups, in the description of the image of the base change (2.3 (a)).

### 1.3 Class groups of `U(1)` of tame level

*Origin:* adapted from the finiteness of ray class groups (Neukirch, Chapter VI §1), for the norm-one torus of a CM
field and a level given by a finite set of places.

*Method of the formal proof:* `K_S` is open because reduction modulo `w` is locally constant. By 1.2 every class is
that of `y/ȳ` for a finite idele `y`; this class does not change when `y` is multiplied by a principal idele or by an
idele with unit components that is `1` modulo the places of `S ∪ S̄`, so `Cl_S` is a quotient of a ray class group.

For a finite set `S` of finite places let `K_S ⊂ U(1)(𝔸)` be the subgroup of the `u` whose finite components are
integral and satisfy `u_w ≡ 1 (mod w)` for every `w ∈ S`, and let `Cl_S := U(1)(𝔸)/(U(1)(E⁺)·K_S)`, the *class group of
`U(1)` of tame level `S`*.

(a) `K_S` is an open subgroup of `U(1)(𝔸)`, it contains the points with finite part `1`, and `K_T ⊂ K_S` for `S ⊂ T`.

(b) `Cl_S` is the group of finite ideles `u` with `uū = 1` modulo the subgroup generated by the norm-one elements of
`E^×` and the finite ideles of `K_S`.

(c) The map `y ↦ [y/ȳ]` from the finite ideles to `Cl_S` is a surjective homomorphism. It is trivial on the principal
ideles, and on the finite ideles with unit components when `S = ∅`.

(d) `Cl_S` is finite, and `#Cl_∅` divides `h_E`: (c) for `S = ∅` induces a surjection from the ideal class group of `E`
onto `Cl_∅`.

(e) There is `N ≥ 1` (the number of roots of unity of `E`) such that every algebraic integer `γ` of `E` with
`γγ̄ = 1` satisfies `γ^N = 1`: `U(1)(E⁺) ∩ K_∅` is the group of roots of unity of `E`.

**Checks.**

- `E = ℚ(i)`, `S = ∅`: `h_E = 1`, so `Cl_∅` is trivial and `U(1)(𝔸) = U(1)(E⁺)·K_∅`.
- `K_S = K_{S ∪ S̄}`: a congruence `u_w ≡ 1 (mod w)` gives `u_{w̄} = conj(u_w)^{−1} ≡ 1 (mod w̄)`.

*Needs:* 1.1, 1.2; Mathlib `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (Kronecker's theorem, for (e)),
`NumberField.classNumber`.

[ShortProof], `Lib/ClassField/HeckeCharacter/Basic.lean` (`New.integralU1`, `New.isOpen_integralU1`,
`New.mem_integralU1_of_snd_eq_one`, `New.AdelicU1ClassGroup`, `New.exists_mk_divStar_eq`,
`New.divStar_principalIdele_mem_sup`, `New.divStar_mem_integralU1_empty`, `New.finite_u1_classGroup`,
`New.card_u1_classGroup_dvd_classNumber`, `New.pow_torsionOrder_eq_one`); for (b) and (c) on finite ideles,
`New/Congruences/Selmer/StickelbergerSystems.lean` (`New.Selmer.U1ClassGroup`, `New.Selmer.divStarClass_surjective`)

## Layer 2: Characters of `[U(1)]` with a weight and a tame part

A character of `[U(1)]` of the kind the route uses is given on the points with integral finite part by an explicit
formula: a monomial in the archimedean components and a product of characters of residue fields. This layer defines
that notion and its laws (2.1), proves the existence criterion and the finiteness (2.2), studies the base change to
Hecke characters of `E` (2.3) and the arithmetic of the values at finite points (2.4), and defines split tame
characters and characters tame for a modulus (2.5).

### 2.1 Weight and tame part

*Origin:* adapted from the classical theory of algebraic Hecke characters (Weil (1956): characters of type `A₀`, their
infinity type and their conductor), on the norm-one torus of a CM field, with the ramification restricted to characters
of the residue fields.

*Method of the formal proof:* definitions; the laws are algebra of the defining formula; (c) holds because a character
of weight `0` whose tame part is trivial off `S` is trivial on `U(1)(E⁺)·K_S`, and conversely a character of the finite
group `Cl_S` is trivial on `K_S`, so on `K_∅` it factors through the reductions at `S`.

A *tame part* is a family `ψ = (ψ_w)_w`, one multiplicative character `ψ_w : 𝔽_w^× → ℂ^×` for each finite place `w` of
`E` (Mathlib's `MulChar` of the residue field), with `ψ_w = 1` for almost all `w`. A character `ν` of `[U(1)]` *has
weight `e : Φ → ℤ` and tame part `ψ`* if for every `u ∈ U(1)(𝔸)` whose finite components are integral

`ν(u) = ∏_{τ∈Φ} u_τ^{e(τ)} · ∏_w ψ_w(u_w mod w)`.

The product over `w` is finite, and each `u_w mod w` is a unit of `𝔽_w` (1.1 (b)).

(a) *Weight.* If `ν` has weight `e` and weight `e′` (with any tame parts), then `e = e′`. A character `ν` of `[U(1)]`
has weight `e` and some tame part if and only if there is a finite set `S` of finite places with
`ν(u) = ∏_τ u_τ^{e(τ)}` for every `u ∈ K_S`.

(b) *Laws.* The trivial character has weight `0` and tame part `1`. If `ν` has weight `e` and tame part `ψ` and `ν′`
has weight `e′` and tame part `ψ′`, then `νν′` has weight `e + e′` and tame part `ψψ′`, `ν⁻¹` has weight `−e` and tame
part `ψ⁻¹`, and `ν^n` has weight `n·e` and tame part `ψ^n` for every integer `n`.

(c) *Weight `0`.* For a finite set `S` of finite places, the characters of the finite group `Cl_S` (1.3), pulled back
to `U(1)(𝔸)`, are exactly the characters of `[U(1)]` that have weight `0` and a tame part trivial off `S`. The values
of a character of weight `0` are roots of unity.

(d) *Level.* If `ν` has weight `e` and a tame part trivial off `S`, then `ν(u) = ∏_τ u_τ^{e(τ)}` for `u ∈ K_S`.

⚠ The weight of a character is determined by it; a tame part is not. On integral points only the products
`ψ_w(u_w)·ψ_{w̄}(conj(u_w)^{−1})` at pairs `w ≠ w̄`, and the restriction of `ψ_w` to the elements of norm one of
`𝔽_w` at places `w = w̄`, enter the formula. Statements therefore carry the tame part as data ("has tame part `ψ`"),
and never speak of "the" tame part of a character.

**Checks.**

- If `ψ_{w̄} = ψ_w ∘ c` at a pair `w ≠ w̄`, with `c : 𝔽_{w̄} → 𝔽_w` induced by conjugation, and `ψ` is trivial at the
  other places, then the trivial character has weight `0` and tame part `ψ`: the two factors cancel.
- Replacing `τ` by `τ̄` in `Φ` replaces `u_τ` by `conj(u_τ) = u_τ^{−1}`: the weight for the new CM type is the
  negative of `e` at that element.
- `E = ℚ(i)`, `Φ = {id}`: there is no character of weight `e = 1` and trivial tame part, since the formula gives `i`
  at the rational integral point `i`; there is one of weight `4` (2.2).

*Needs:* 1.1, 1.3.

[ShortProof], `Lib/ClassField/HeckeCharacter/Basic.lean` (`New.AutChar.HasWeight`, `New.AutChar.HasWeight.one`,
`New.AutChar.HasWeight.mul`, `New.AutChar.HasWeight.inv`, `New.AutChar.HasWeight.zpow`, `New.AutChar.tameChars`,
`New.AutChar.exists_mem_tameChars`, `New.AutChar.exists_classGroup_char_eq_of_hasWeight_zero`,
`New.AutChar.HasWeight.isOfFinOrder_apply`, `New.AutChar.eq_of_mem_integralU1`). [ShortProof] does not state (a); it
proves the "only if" direction of its second sentence, which is (d).

### 2.2 Existence and finiteness

*Origin:* adapted from Weil (1956) (a character of type `A₀` with given infinity type and conductor exists when the
infinity type is trivial on the units congruent to `1`), on the norm-one torus of a CM field; the finiteness is the
finiteness of `Cl_∅`.

*Method of the formal proof:* the formula defines a homomorphism on `K_∅`, and the hypothesis says that it is trivial
on `U(1)(E⁺) ∩ K_∅`; it extends to `U(1)(E⁺)·K_∅` by `1` on rational points, and from this subgroup of finite index
(1.3 (d)) to `U(1)(𝔸)` because the circle is divisible. A homomorphism given by the formula on the open subgroup `K_S`
is continuous. Two characters with the same weight and tame part differ by a character of `Cl_∅`.

(a) Let `χ : U(1)(𝔸) → ℂ^×` be a homomorphism, trivial on `U(1)(E⁺)`, with
`χ(u) = ∏_τ u_τ^{e(τ)}·∏_w ψ_w(u_w mod w)` for every `u` with integral finite components, for a weight `e` and a tame
part `ψ`. Then `χ` is continuous with values in `S¹`: it is a character of `[U(1)]` of weight `e` and tame part `ψ`.

(b) For a weight `e` and a tame part `ψ`, a character of `[U(1)]` of weight `e` and tame part `ψ` exists if and only
if `∏_{τ∈Φ} τ(γ)^{e(τ)} · ∏_w ψ_w(γ mod w) = 1` for every algebraic integer `γ` of `E` with `γγ̄ = 1`. By 1.3 (e) these
`γ` are the roots of unity of `E`, so the condition is a finite one.

(c) The characters of weight `e` and tame part `ψ` are a coset of the group of characters of `Cl_∅` (2.1 (c)), or there
are none: their number is `0` or `#Cl_∅`, which divides `h_E`. In particular they are finite in number.

[ShortProof] proves the "if" direction of (b) and the finiteness in (c); the "only if" direction is the value of the
formula at the rational point `γ`, and the count follows from 2.1 (b), (c).

**Checks.**

- `E = ℚ(i)`: the condition of (b) for trivial `ψ` is `i^{e} = 1`, that is `4 | e`.
- Weight `0`, trivial tame part: the characters are those of `Cl_∅`; the trivial one always exists.
- A condition quantified over all `γ ∈ U(1)(E⁺)` instead of the integral ones would be false for every `e ≠ 0`: the
  formula does not hold at points that are not integral.

*Needs:* 1.3, 2.1.

[ShortProof], `Lib/ClassField/HeckeCharacter/Basic.lean` (`New.AutChar.exists_hasWeight`,
`New.AutChar.exists_hasWeight_of_prod_eq_one`, `New.AutChar.finite_tameChars`, `New.AutChar.finite_setOf_hasWeight`)

### 2.3 Base change to Hecke characters of `E`

*Origin:* adapted from the classical base change from the norm-one torus of a quadratic extension (Rogawski (1990),
for `U(1)`); the local formulas are computations with the defining formula.

*Method of the formal proof:* `x/x̄` is rational for `x ∈ E^×`; injectivity and the description of the image are 1.2
(c); the archimedean formula is `z/z̄ = (z/|z|)²`; for the local formulas, `x/x̄` for `x ∈ E_w^×` has integral finite
components under the stated hypotheses, and the defining formula applies.

For a character `ν` of `[U(1)]`, its *base change* is `ν̃(x) := ν(x/x̄)`, a unitary Hecke character of `E`.

(a) `ν ↦ ν̃` is an injective homomorphism from the characters of `[U(1)]` to the unitary Hecke characters of `E`. Its
image is the group of unitary Hecke characters that are trivial on the ideles of `E⁺`. For every `ν`,
`ν̃(x̄) = ν̃(x)⁻¹`, and `ν̃(u) = ν(u)²` for `u ∈ U(1)(𝔸)`.

(b) If `ν` has weight `e`, then `ν̃(x) = ∏_{τ∈Φ} (x_τ/|x_τ|)^{2e(τ)}` on the ideles with finite part `1`. So `ν̃` is an
algebraic Hecke character (Tau Ceti's `HeckeCharacter.IsAlgebraic`) with shift `0`, and `ν̃ ≠ 1`, `ν̃² ≠ 1` when
`e ≠ 0`.

(c) Let `ν` have weight `e` and tame part `ψ`, and let `w` be a finite place. If `w ≠ w̄` and `ψ_{w̄} = 1`, then
`ν̃(x) = ψ_w(x mod w)` for `x ∈ 𝒪_w^×`. If `w = w̄`, then `ν̃(x) = ψ_w((x/x̄) mod w)` for every `x ∈ E_w^×`; in
particular `ν̃` is trivial on `E_w^×` when `ψ_w = 1`.

(d) If `ψ_w = ψ_{w̄} = 1`, then `ν̃` is unramified at `w` and at `w̄`, and `ν̃(ϖ_{w̄}) = ν̃(ϖ_w)⁻¹`. More generally, for
any `ν`, if `ν̃` is unramified at `w` then it is unramified at `w̄` and `ν̃(ϖ_{w̄}) = ν̃(ϖ_w)⁻¹`.

**Checks.**

- `ν = 1`: `ν̃ = 1`. A Hecke character trivial on the ideles of `E⁺` need not have a weight: its restriction to the
  finite units can be wildly ramified.
- The exponent in (b) is `2e(τ)`, not `e(τ)`: the base change of a character of weight `e` has even angular
  frequencies. The splitting character of 4.1, of angular frequency `1`, is not a base change.
- In (c) for `w = w̄` and `x = ϖ_w` a uniformiser fixed by conjugation (`E_w/E⁺_v` unramified), `x/x̄ = 1` and
  `ν̃(ϖ_w) = 1`, whatever `ψ_w` is.

*Needs:* 1.1, 1.2, 2.1; Tau Ceti `HeckeCharacter`, `HeckeCharacter.IsAlgebraic`, `HeckeCharacter.shift`,
`HeckeCharacter.finiteComponent`.

[ShortProof], `Lib/ClassField/HeckeCharacter/Basic.lean` (`New.AutChar.baseChange`, `New.AutChar.baseChange_toUnits`,
`New.AutChar.baseChange_injective`); `Lib/ClassField/HeckeCharacter/SplittingCharacters.lean`
(`New.HeckeChar.exists_baseChange_iff`); `Lib/ClassField/HeckeCharacter/AlgebraicValues.lean`
(`New.AutChar.HasWeight.baseChange_apply_inf`, `New.AutChar.HasWeight.isHeckeOfType`);
`Lib/ClassField/HeckeCharacter/SplitTameCharacters.lean`
(`New.AutChar.HasWeight.exists_baseChange_finPart_locIdele`, `New.AutChar.HasWeight.baseChange_finPart_locIdele`,
`New.AutChar.HasWeight.baseChange_finPart_locIdele_eq_one`); `Lib/ClassField/Avatar/HeckeBaseChange.lean`
(`New.AutChar.HasWeight.charUnramifiedAt`, `New.AutChar.HasWeight.atUniformizer_star`). [ShortProof] proves the case
`ψ_w = 1` of (c) at a place `w = w̄`, and (d) under the hypothesis `ψ_w = ψ_{w̄} = 1`.

### 2.4 Values at finite points

*Origin:* published (Weil (1956): the values of a character of type `A₀` on finite ideles are algebraic numbers), for
characters of `[U(1)]` with a weight; the conjugate character is the action of `Aut(ℂ)` on characters of type `A₀`.

*Method of the formal proof:* a power `u^n` of a finite point is a rational point times an integral point (1.3 (d)),
and a further power removes the root of unity contributed by the tame part; the absolute values are read off the
rational point, at the place induced by the embedding. The conjugate character is defined by permuting the archimedean
monomial and applying `σ` to the rest.

A *finite point* of `U(1)(𝔸)` is a `u` with `u_τ = 1` for every `τ ∈ Φ`. For a prime `p`, a field embedding
`σ : E → ℂ_p` and a finite idele `x`, put `|x|_σ := |σ_w(x_w)|_p`, where `w` is the finite place of `E` that `σ` induces,
`σ_w : E_w → ℂ_p` the continuous extension of `σ`, and `|·|_p` the absolute value of `ℂ_p` with `|p|_p = 1/p`.

Let `ν` have weight `e` (and some tame part) and let `u` be a finite point.

(a) There are an integer `n ≥ 1` and `γ ∈ U(1)(E⁺)` such that every finite component of `u^n·γ` is a unit and
`ν(u)^n = ∏_{τ∈Φ} τ(γ)^{e(τ)}`. In particular `ν(u)` is an algebraic number.

(b) `|σ(ν(u))| = 1` for every ring homomorphism `σ : ℂ → ℂ`.

(c) For every prime `p` and every ring homomorphism `ι : ℂ → ℂ_p`, `|ι(ν(u))|_p = ∏_{τ∈Φ} |u|_{ι∘τ}^{−e(τ)}`.

(d) *Conjugates.* Let `ν` have weight `e` and tame part `ψ`, and let `σ` be an automorphism of `ℂ` with `σ∘τ ∈ Φ` for
every `τ ∈ Φ`. Then there is a character `ν^σ` of `[U(1)]` of weight `τ ↦ e(σ⁻¹∘τ)` and tame part `(σ∘ψ_w)_w` with
`ν^σ(u) = σ(ν(u))` for every finite point `u`.

**Checks.**

- `u = γ_f`, the finite part of `γ ∈ U(1)(E⁺)`: `ν(γ_f) = ∏_τ τ(γ)^{−e(τ)}`, since `ν` is trivial at the rational point
  `γ`. In (a) one may take `n = 1` and `γ⁻¹`, and (c) reads `|ι(ν(γ_f))|_p = ∏_τ |ι(τ(γ))|_p^{−e(τ)}`. The sign of the
  exponent in (c) is fixed by this case.
- Weight `0`: `ν(u)` is a root of unity (2.1 (c)) and both sides of (c) are `1`.

*Needs:* 1.3, 2.1, 2.2.

[ShortProof], `Lib/ClassField/HeckeCharacter/Basic.lean` (`New.AutChar.HasWeight.exists_pow_eq_prod`,
`New.AutChar.HasWeight.exists_conj`); `Lib/ClassField/HeckeCharacter/AlgebraicValues.lean`
(`New.AutChar.HasWeight.norm_map_eq_one`, `New.AutChar.HasWeight.norm_padic_eq_prod`)

### 2.5 Split tame characters and characters tame for a modulus

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the formulas are the defining formula of 2.1 at points supported on `S` or
on the places dividing the modulus.

(a) *Split tame characters.* Let `μ : Φ → ℤ` with `μ(τ) > 0` for every `τ`. A *split tame character `𝔠` of weight `μ`*
consists of a character `ν` of `[U(1)]`, a tame part `ψ` and a finite set `S` of finite places such that `ν` has
weight `μ` and tame part `ψ`, `S` is nonempty, `S ∩ S̄ = ∅`, and `ψ_w ≠ 1` exactly for `w ∈ S`. The places of `S` are
split over `E⁺` (`w ≠ w̄`), and `ψ` is trivial on `S̄`.

(b) *The local character.* For a split tame character `𝔠 = (ν, ψ, S)`, its *local character* `χ_𝔠` is the function on
the ring `E_S := ∏_{w∈S} E_w` with `χ_𝔠(t) = ν̃(t) = ν(t/t̄)` for invertible `t`, read as the finite idele with
components `t_w` at `w ∈ S` and `1` elsewhere, and `χ_𝔠(t) = 0` if `t` is not invertible. It is multiplicative. For a
unit `t` of `∏_{w∈S} 𝒪_w`, `χ_𝔠(t) = ∏_{w∈S} ψ_w(t_w mod w)`. For `u ∈ U(1)(𝔸)` with integral finite components,
`ν(u) = ∏_τ u_τ^{μ(τ)} · χ_𝔠((u_w)_{w∈S})`.

(c) *Moduli.* A *modulus* is a nonzero ideal `𝔪` of `𝒪_E` such that no prime `w` divides `𝔪` together with its
conjugate `w̄`; in particular no prime `w = w̄` divides `𝔪`. For a tame part `ψ`, `χ_ψ` is the multiplicative character
`x ↦ ∏_{w | 𝔪} ψ_w(x mod w)` of the finite ring `𝒪_E/𝔪` (zero on non-units). A character `ν` of `[U(1)]` is *tame for
`(𝔪, χ)` with weight `e`*, for a multiplicative character `χ` of `𝒪_E/𝔪`, if `𝔪 ≠ 𝒪_E` and `ν` has weight `e` and a
tame part `ψ` such that `ψ_w ≠ 1` exactly for the primes `w | 𝔪`, and `χ = χ_ψ`.

(d) *Laws and values.* If `ν` is tame for `(𝔪, χ)` with weight `e`, then `ν⁻¹` is tame for `(𝔪, χ⁻¹)` with weight
`−e`, and `νν′` is tame for `(𝔪, χ)` with weight `e + d` for every `ν′` of weight `d` and trivial tame part. For every
`u ∈ U(1)(𝔸)` with integral finite components, `ν(u) = ∏_τ u_τ^{e(τ)} · χ(u mod 𝔪)`, where `u mod 𝔪` is the image of
the finite part of `u` in `Ô/𝔪Ô = 𝒪_E/𝔪`.

(e) A split tame character `(ν, ψ, S)` of weight `μ` is tame for `(𝔪, χ_ψ)` with weight `μ` for every modulus `𝔪`
whose prime divisors are exactly the places of `S`.

[ShortProof] states the value formula of (d) for determinants of integral points of unitary groups of any rank; (d)
is its case of rank one, and the determinant form follows from it because the determinant of an integral unitary
matrix is an integral point of `U(1)(𝔸)` and reduction commutes with determinants.

**Checks.**

- `𝔪 = 𝒪_E` is a modulus, but no character is tame for it.
- A prime `w = w̄` never supports a split tame character or divides a modulus; at such a prime the base change sees only
  `ψ_w` on elements of norm one (2.3 (c)).
- In (b), on a non-unit `t = ϖ_w` at one place `w ∈ S`, `χ_𝔠(t) = ν̃(ϖ_w)` depends on the uniformiser, since `ν̃` is
  ramified at `w`.

*Needs:* 2.1, 2.3; Mathlib `MulChar`.

[ShortProof], `Lib/ClassField/HeckeCharacter/SplitTameCharacters.lean` (`New.Exchange.SplitTameChar`,
`New.Exchange.SplitTameChar.semilocalChar`, `New.Exchange.SplitTameChar.localChar_apply_of_isUnit`,
`New.Exchange.SplitTameChar.character_apply_of_integral`); `Lib/Weil/DualPair/Defs.lean` (`New.Modulus`);
`Lib/ClassField/HeckeCharacter/TameModulus.lean` (`New.Modulus.charOfTamePart`, `New.Exchange.IsTameFor`,
`New.Exchange.IsTameFor.inv`, `New.Exchange.IsTameFor.mul`, `New.Exchange.IsTameFor.apply_det`,
`New.AutChar.HasWeight.apply_det_eq_charOfTamePart`)

## Layer 3: Partial L-values

### 3.1 The partial L-values `L^S(z, ν)`

*Origin:* published (Hecke (1920): the L-functions of Größencharaktere, their continuation and non-vanishing on the
line `Re s = 1`; Tate (1950)), read at real arguments for the base change of a character of `[U(1)]`; the inversion
identity is the invariance of the L-function of `E` under conjugation of the character.

*Method of the formal proof:* [ShortProof] treats only real `z ≥ 1`. It continues the partial L-function of a
nontrivial Hecke character of integral angular type to a neighbourhood of `1` from Tate's integral over the finite
ideles, by a Riemann sum in place of Poisson summation, and proves the non-vanishing on `[1, ∞)` by the inequality
`3 + 4cos θ + cos 2θ ≥ 0` applied to prime densities, when the square of the character is nontrivial; for a base change
of nonzero weight the square has nonzero angular type. For (d) conjugation of the place inverts the Euler coefficient
(2.3 (d)) and preserves `q_w`.

Let `ν` be a character of `[U(1)]` and `S` a finite set of finite places such that `ν̃` is unramified at every finite
place outside `S ∪ S̄`; this holds when `ν` has a tame part trivial off `S ∪ S̄` (2.3 (d)). For real `z > 1` define

`L^S(z, ν) := ∏_{w ∉ S ∪ S̄} (1 − ν̃(ϖ_w)·q_w^{−z})⁻¹`,

the product over the finite places of `E` outside `S ∪ S̄`, and `L^S(1, ν) := lim_{z→1⁺} L^S(z, ν)` when the limit
exists.

(a) For `z > 1` the product converges absolutely and `L^S(z, ν) ≠ 0`. For `S ⊂ T`,
`L^T(z, ν) = L^S(z, ν)·∏_{w ∈ (T∪T̄) ∖ (S∪S̄)} (1 − ν̃(ϖ_w)·q_w^{−z})`, for `z > 1` and for `z = 1` when either limit
exists.

(b) *Identification.* Let `ν` have a weight, so that `ν̃` is algebraic (2.3 (b)), and let `χ` be the presentation of
`ν̃` in the sense of LFunctions §6.1 at a modulus of definition (a modulus of Tau Ceti's type `Modulus E`, not of 2.5
(c)) whose finite part has exactly the places of `S ∪ S̄` as prime divisors; such a modulus exists because `ν̃` is
unramified outside `S ∪ S̄`. Then `L^S(z, ν)` is the value at `s = z` of the presented L-function `lFunctionC` of
LFunctions §6.5, for `z > 1`.

(c) *The value at `1` and non-vanishing.* If `ν` has a weight `e ≠ 0`, then the limit `L^S(1, ν)` exists, the function
`z ↦ L^S(z, ν)` is continuous on `[1, ∞)` and agrees there with the continued function of (b), and `L^S(z, ν) ≠ 0` for
every real `z ≥ 1`.

(d) *Inversion.* `L^S(z, ν⁻¹) = L^S(z, ν)` for `z > 1`, and for `z = 1` when either limit exists. Since
`conj(L^S(z, ν)) = L^S(z, ν⁻¹)`, the number `L^S(z, ν)` is real.

The Euler product does not converge absolutely at `z = 1`; `L^S(1, ν)` is the limit, not a product.

[ShortProof] defines `L^S(z, ν)` for every `ν` and every set `S`, with the value of `ν̃` at a chosen uniformiser as
coefficient at the places outside `S ∪ S̄` where `ν̃` is ramified, and proves (d) when `ν` has a tame part trivial off
`S`. The route uses only the case stated here. The non-vanishing on the line `Re s = 1` for complex `s`, which
LFunctions §7.3 states, is not needed by the route.

The same Hecke L-function is identified with the standard L-function of a character of `U(1)` in the roadmap
LocalFactorsOfTwistsAndTypes of the family RiemannHypothesisForDirichletLFunctions (its section on the standard
L-function of a one-dimensional representation, in the case of rank one); that identification is not needed here.

**Checks.**

- `ν = 1`, `S = ∅`: `L^∅(z, 1) = ζ_E(z)`, the Dedekind zeta function, for `z > 1`; the limit at `1` does not exist. The
  hypothesis `e ≠ 0` in (c) cannot be dropped.
- `E = ℚ(i)`, `ν` of weight `4` and trivial tame part (2.2), `S = ∅`: `ν̃((α)) = (α/ᾱ)^{4}` or its inverse on principal
  ideals, according to `Φ`, and `L^∅(z, ν)` is the L-function of that angular character; by (d) the two choices of `Φ`
  give the same function. This is the case `k = 2` of the angular characters `(α) ↦ (α/ᾱ)^{2k}` of LFunctions §7.4.
- (d) fails for a general unitary Hecke character `χ` of `E` in place of `ν̃`: it uses `χ(x̄) = χ(x)⁻¹`.

*Needs:* 2.1, 2.3; LFunctions §6.1 (presentations of algebraic Hecke characters at a modulus), §6.5 (the presented
L-function `lFunctionC` and its Euler product on the half-plane of convergence), §6.9 (its continuation), §7.3 (order
`0` at the points of the boundary line for a presentation whose unitary weight is not a norm twist; here at `s = 1`,
where it gives a finite nonzero value).

[ShortProof], `Lib/ClassField/Avatar/HeckeBaseChange.lean` (`New.AutChar.L`, `New.AutChar.HasWeight.L_ne_zero`,
`New.AutChar.HasWeight.L_inv`); `Lib/ClassField/HeckeL/EulerProduct.lean` (`New.eulerProd`, `New.heckeCoeff`,
`New.hasProd_eulerProd`); `Lib/ClassField/HeckeL/ContinuationAtOne.lean`
(`New.IsHeckeOfType.exists_analyticAt_one_eulerProd`, `New.IsHeckeOfType.continuousOn_eulerProd`,
`New.IsHeckeOfType.eulerProd_ne_zero`)

## Layer 4: Splitting characters and Weil data

The Weil representation of a unitary dual pair over `E` needs a Hecke character of `E` whose restriction to the ideles
of `E⁺` is the quadratic character of `E/E⁺` (MetaplecticAutomorphicForms §3.3). The route fixes one such character
`υ`, unramified at every finite place and of angular frequency `1` at every element of `Φ`, and builds the characters
of all ranks from it and from characters of `[U(1)]`. This layer defines such *splitting characters* and proves their
properties (4.1) and their existence under a hypothesis on the units (4.2); it relates them to characters of `[U(1)]`
and to the splitting characters of a rank (4.3), studies the algebraic character `υ|·|^{−1/2}` (4.4), and defines Weil
data (4.5).

### 4.1 Splitting characters

*Origin:* adapted from the theory of characters of type `A₀` extending the quadratic character of a CM field (Weil
(1956); Raghuram, §4); the name and the normalisation are those of [ShortProof].

*Method of the formal proof:* (a) is the definition applied to `x/y`. For (b), `υ` is trivial on `(E⁺)^×·N(𝔸_E^×)`
because `υ(z z̄) = 1`; conversely an idele of `E⁺` at which `υ` is `1` is shown to be a rational number times a norm, by
moving its finite part into the principal ideles times norms with the norm index of class field theory and comparing
signs at the infinite places. (c) follows: at `w = w̄` the quadratic character is `−1` at some idele of `E⁺` supported
at `w`, whose value is a power of `υ(ϖ_w)`, and `υ(ϖ_w)² = 1`.

A *splitting character* of `E` for the CM type `Φ` is a unitary Hecke character `υ` of `E` such that

- `υ(x̄) = υ(x)⁻¹` for every idele `x`, and
- `υ(x) = ∏_{τ∈Φ} x_τ/|x_τ|` for every idele `x` whose finite components are all units.

(a) `υ` is unramified at every finite place. If an idele `x` and a finite idele `y` have the same valuation at every
finite place, then `υ(x) = ∏_τ x_τ/|x_τ| · υ(y)`. For every finite place `w`, `υ(ϖ_w)·υ(ϖ_{w̄}) = 1`.

(b) On the ideles of `E⁺`, `υ` is the quadratic character `η` of `E/E⁺`: `υ(x) = 1` if `x` lies in
`(E⁺)^×·N_{E/E⁺}(𝔸_E^×)` and `υ(x) = −1` otherwise.

(c) `υ(ϖ_w) = −1` at every finite place `w = w̄`.

(d) If `E` has a splitting character, then `E/E⁺` is unramified at every finite place, and
`∏_{τ∈Φ} τ(δ)/|τ(δ)| = 1` for every unit `δ` of `𝒪_E`.

(e) The splitting characters for `Φ` are a coset of the group of characters `κ` of the ideal class group of `E` with
`κ(𝔞̄) = κ(𝔞)⁻¹`, or there are none. `υ⁻¹` is a splitting character for the conjugate CM type.

[ShortProof] states (a), (b), (c); (d) and (e) follow from them: for (d), `η` is unramified at every finite place
because `υ` is, and `υ` is trivial at a unit read as a principal idele; for (e), the quotient of two splitting
characters is trivial on `E^×` and on the ideles with unit finite part.

**Checks.**

- No imaginary quadratic field has a splitting character: some prime ramifies. For `E = ℚ(i)` the unit condition of (d)
  already fails at `δ = i`.
- (b) at the idele `x` of `E⁺` that is `−1` at one real place and `1` elsewhere: the second condition gives
  `υ(x) = −1`, and `x` is not in `(E⁺)^×·N(𝔸_E^×)`, since the quadratic character is `−1` at `−1 ∈ ℝ^×` for `ℂ/ℝ`.
- A definition asking only for the restriction `η` to the ideles of `E⁺` (the splitting characters of
  MetaplecticAutomorphicForms §3.3 for odd rank) would not fix the angular frequencies or the ramification; the
  statements of 4.3 and 4.4 use both.

*Needs:* 1.2; ClassFieldTheory §11.1 (the global Artin map `globalArtinMap` of the quadratic extension of `E⁺` by
`E`, an isomorphism from the idele classes of `E⁺` modulo norms onto the Galois group, so that the norm subgroup has
index `2`, and its compatibility with the local Artin maps), §6.1 (for a quadratic extension of local fields the local
Artin map is nontrivial exactly at the elements that are not norms,
`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`); Tau Ceti `HeckeCharacter`, `ideleNormMap`,
`mem_range_ideleExtension_iff`.

[ShortProof], `Lib/Weil/Construction/WeilData.lean` (`New.SplittingChar`); `Lib/Adelic/Adeles/LocalFactors.lean`
(`New.upsilon_eq_prod_mul_of_v_eq`, `New.upsilon_eq_atUniformizer_zpow`, `New.upsilon_atUniformizer_mul_star`);
`Lib/ClassField/Global/CMSplittingCharacters.lean` (`New.Cohomology.quadraticIdeleChar`,
`New.Cohomology.upsilon_eq_quadraticIdeleChar`, `New.Cohomology.upsilon_locFullIdele_eq_neg_one_of_star_eq`,
`New.Cohomology.upsilon_atUniformizer_eq_neg_one`, `New.Cohomology.υ_star_eq_inv_and_apply_eq`)

### 4.2 Existence of splitting characters

*Origin:* adapted from Weil (1956) (existence of a character of type `A₀` with given infinity type), with hypotheses
under which the character can be taken unramified and inverted by conjugation; particular to this proof in that form.

*Method of the formal proof:* for (a), the field contains the roots of unity of orders `4` and `7`, hence `i` and
`ω = (1 + √−7)/2`; the discriminant of `1, y` over `𝒪_{E⁺}` is the unit `(y − ȳ)²`. For (b), let
`P(x) = ∏_τ x_τ/|x_τ|`, `U` the open subgroup of the ideles with unit finite components, and `R` the group of the ideles
`y·b·b̄` with `y ∈ E^×` and `b` an idele. `P = 1` on `U ∩ R`: for such an element `ȳ/y` is an integer all of whose
conjugates have absolute value `1`, a root of unity, hence `δ/δ̄` by hypothesis; `a = yδ` lies in `E⁺`, the finite part
of `a·b·b̄` is a unit fixed by conjugation and so the norm of a unit because `E/E⁺` is unramified, and then
`∏_τ τ(a) > 0` by class field theory for `E/E⁺`. So `P` on `U` extends to a character of `U·R` trivial on `R`, and to
the ideles because the circle is divisible; it is continuous because it is so on the open subgroup `U`.

(a) Let `E` be a CM field that contains a primitive root of unity of order `5040`. Then `𝒪_E` contains `i` with
`i² = −1` and `ī = −i`, and `ω` with `ω + ω̄ = 1` and `ωω̄ = 2`; the integer `y = iω` has `y − ȳ = i`, a unit; `E/E⁺` is
unramified at every finite place; and no place of `E` above `2` is fixed by conjugation.

(b) Let `E` be a CM field with a CM type `Φ`. Suppose that `E` contains a primitive root of unity of order `5040`, and
that every root of unity `y` of `E` is `δ/δ̄` for a unit `δ` of `𝒪_E` with `∏_{τ∈Φ} τ(δ) = 1`. Then `E` has a splitting
character for `Φ`.

**Checks.**

- The hypothesis of (b) on roots of unity implies the unit condition of 4.1 (d) at roots of unity: for `y = δ/δ̄`,
  `∏_τ τ(y) = (∏_τ τ(δ))²/∏_τ |τ(δ)|² = 1`, the denominator being `|N_{E/ℚ}(δ)| = 1`.
- `E = ℚ(i)` satisfies neither hypothesis of (b), and has no splitting character (4.1, Checks).
- In (a), `ω = (1 + √−7)/2` and `ω̄` generate the two primes of `ℚ(√−7)` above `2`, which conjugation exchanges.

*Needs:* 4.1; ClassFieldTheory §11.1 (the global Artin map of the extension of `E⁺` by `E` is trivial on principal
ideles and is the product of the local Artin maps: a nonzero element of `E⁺` that is a norm from `E` at every finite
place is negative at an even number of real places), §6.1 (at an unramified extension of local fields the local Artin map is the Frobenius to
the power of the valuation, `localArtinMap_eq_frobenius_pow_valuation`, so every unit is a norm of a unit); Mathlib
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, `IsPrimitiveRoot`.

[ShortProof], `Lib/Adelic/Adeles/Basic.lean` (`New.HasPrimitiveRoot5040`,
`New.HasPrimitiveRoot5040.exists_mul_self_eq_neg_one`,
`New.HasPrimitiveRoot5040.exists_add_star_eq_one_mul_star_eq_two`, `New.HasPrimitiveRoot5040.exists_isUnit_sub_star`);
`Lib/ClassField/Global/CMSplittingCharacters.lean` (`New.Cohomology.prod_Φ_pos_of_principalIdele_mul_norm_eq_one`,
`New.nonempty_splittingChar`). In (a), [ShortProof] states the existence of `i`, `ω` and `y`; the last two assertions
follow from them (the order `𝒪_{E⁺}[y]` has unit discriminant, and a place above `2` contains exactly one of `ω`,
`ω̄`).

### 4.3 The restriction to `U(1)` and the characters of a rank

*Origin:* definitions and conventions; the laws are those of splitting characters of unitary dual pairs (Kudla (1994);
Harris, Kudla and Sweet (1996)), written with characters of `[U(1)]`.

*Method of the formal proof:* (a) is the second condition of 4.1 at integral points of `U(1)(𝔸)`; (b) is
`υ(x/x̄) = υ(x)·υ(x̄)⁻¹`; (c) is 2.3 (a) with 4.1 (b); the laws are algebra with (b).

Let `υ` be a splitting character of `E` for `Φ`, and `υ₁` its restriction to `U(1)(𝔸)`.

(a) `υ₁` is a character of `[U(1)]` of weight `1` (the constant function) and trivial tame part. For every integer
`z`, `υ₁^z` has weight `z` and trivial tame part; if `ν` has weight `e` and tame part `ψ`, then `ν·υ₁^z` has weight
`e + z` and tame part `ψ`.

(b) The base change of `υ₁` is `υ²`.

(c) *Characters of a rank.* For a character `α` of `[U(1)]` and an integer `n ≥ 0`, the *Hecke character of rank `n`
attached to `α`* is `α̃·υ^{−n}`. Its restriction to the ideles of `E⁺` is `η^n`; so it is a splitting character for a
Hermitian space of dimension `n` in the sense of MetaplecticAutomorphicForms §3.3. Conversely a unitary Hecke
character `χ` of `E` restricts to `η^n` on the ideles of `E⁺` if and only if `χ = α̃·υ^{−n}` for a character `α` of
`[U(1)]`, and then `α` is unique.

(d) *Laws.* For characters `α`, `α′` of `[U(1)]` and `k, l ≥ 0`:
`(αα′)^~·υ^{−(k+l)} = (α̃·υ^{−k})·(α̃′·υ^{−l})`; `(α⁻¹υ₁^k)^~·υ^{−k} = (α̃·υ^{−k})⁻¹`; and
`(α·υ₁^l)^~·υ^{−(k+2l)} = α̃·υ^{−k}`.

(e) *The rank twist.* For `n ≥ 0` put `α_n := α·υ₁^{⌊n/2⌋}`. The Hecke character of rank `n` attached to `α_n` is `α̃`
if `n` is even and `α̃·υ⁻¹` if `n` is odd. If `α` has weight `e` and tame part `ψ`, then `α_n` has weight `e + ⌊n/2⌋`
and tame part `ψ`.

(f) If `α` has weight `e`, then `(α̃·υ^{−n})(x) = ∏_{τ∈Φ} (x_τ/|x_τ|)^{2e(τ) − n}` on the ideles with finite part `1`.

**Checks.**

- `n = 0`: the character of rank `0` is `α̃`, trivial on the ideles of `E⁺`.
- `α = υ₁^k`, `n = 2k`: the character of rank `2k` is trivial.
- In (c) for odd `n` the character is not a base change, and for even `n` it is the base change of `α·υ₁^{−n/2}`.

The restriction condition of (c) is the condition `χ_V|_{F^×} = ω_{E/F}^{dim V}` that the roadmaps
MetaplecticAutomorphicForms (its section on unitary dual-pair splittings) and ThetaKernelsForUnitaryDualPairs (its
section on the global Weil representation of a unitary pair) put on the splitting characters of a unitary dual pair;
nothing is taken from them.

*Needs:* 2.1, 2.3, 4.1.

[ShortProof], `Lib/Weil/DualPair/Defs.lean` (`New.WeilData.upsilonU1`, `New.AutChar.spaceChar`, `New.rankTwist`);
`Lib/ClassField/HeckeCharacter/SplitTameCharacters.lean` (`New.WeilData.upsilonU1_hasWeight`,
`New.WeilData.hasWeight_upsilonU1_zpow`, `New.AutChar.HasWeight.mul_upsilonU1_pow`,
`New.AutChar.HasWeight.hasWeight_rankTwist`, `New.WeilData.baseChange_upsilonU1`);
`Lib/ClassField/HeckeCharacter/SplittingCharacters.lean` (`New.HeckeChar.IsSplitting`,
`New.HeckeChar.isSplitting_iff`, `New.AutChar.spaceChar_mul`, `New.AutChar.spaceChar_inv_mul_upsilonU1_pow`,
`New.AutChar.spaceChar_add_two_mul`, `New.AutChar.spaceChar_rankTwist_eq_ite`);
`Lib/ClassField/Avatar/HeckeBaseChange.lean` (`New.AutChar.HasWeight.spaceChar_apply_of_snd_eq_one`)

### 4.4 The character `υ|·|^{−1/2}` on finite ideles

*Origin:* published (Weil (1956): a unitary character of half-integral type becomes of type `A₀` after a twist by a
power of the norm, and its values on finite ideles are algebraic), for a splitting character.

*Method of the formal proof:* `υ|·|^{−1/2}` is an algebraic Hecke character with exponents `0` at the elements of `Φ`
and `−1` at their conjugates; a power of a finite idele is a principal idele times an idele with unit components, on
which the character is `1`, and the value at a principal idele is given by the exponents.

Let `υ` be a splitting character of `E` for `Φ`. The Hecke character `υ·|·|^{−1/2}` (the product of `υ` with Tau
Ceti's norm character `HeckeCharacter.normPow E (−1/2)`) is not unitary. Let `χ_f(x) := υ(x)·|x|^{−1/2}` be its
restriction to the finite ideles.

(a) `χ_f(x)` depends only on the valuations `v_w(x)`: `χ_f` is trivial on the finite ideles with unit components and
factors through the group of fractional ideals of `E`.

(b) `χ_f(x̄) = conj(χ_f(x))` and `|χ_f(x)| = |x|^{−1/2}`.

(c) For `y ∈ E^×`, read as a principal finite idele, `χ_f(y) = ∏_{τ∈Φ} τ(ȳ)`.

(d) For every finite idele `x` there are `n ≥ 1` and `y ∈ E^×` such that `x^n` and `y` have the same valuation at every
finite place and `χ_f(x)^n = ∏_{τ∈Φ} τ(ȳ)`. In particular `χ_f(x)` is an algebraic number, and
`|σ(χ_f(x))| = |x|^{−1/2}` for every ring homomorphism `σ : ℂ → ℂ`.

(e) For every prime `p` and every ring homomorphism `ι : ℂ → ℂ_p`, `|ι(χ_f(x))|_p = ∏_{τ∈Φ} |x|_{ι∘τ̄}`, with the
absolute values of 2.4 at the embeddings `ι∘τ̄ : y ↦ ι(τ(ȳ))`.

**Checks.**

- For an integral finite idele `x` generating an ideal `𝔞`, `|x| = N(𝔞)⁻¹` and `|χ_f(x)| = N(𝔞)^{1/2}`; in (c),
  `|∏_τ τ(ȳ)| = |N_{E/ℚ}(y)|^{1/2}`.
- (c) follows from the triviality of `υ` on the principal idele of `y`: its finite part has `υ = ∏_τ |τ(y)|/τ(y)` and
  norm `∏_τ |τ(y)|^{−2}`. With the exponent `+1/2` the value would be `∏_τ 1/τ(y)` instead.
- (e) at `x = y` principal is `|ι(∏_τ τ(ȳ))|_p = ∏_τ |ι(τ(ȳ))|_p`.

*Needs:* 4.1; Tau Ceti `ideleNorm` (the idele norm, with values in the positive reals), `HeckeCharacter.normPow`.

[ShortProof], `Lib/Weil/Construction/FiniteMultiplier.lean` (`New.chiAdelic`, `New.chiFin`, `New.chiFin_congr`,
`New.chiFin_star`); `Lib/ClassField/HeckeCharacter/AlgebraicValues.lean` (`New.WeilData.chiFinAlgebraic`,
`New.WeilData.exists_chiFin_pow_eq_prod`, `New.WeilData.norm_map_chiFin`,
`New.AlgHeckeChar.norm_map_eq_sqrt_finIdeleAbs_zpow`); `Lib/Adelic/Adeles/IdeleModulus.lean` (`New.ideleAbs`,
`New.ideleAbs_pos`, `New.finIdeleAbs`, `New.finIdeleAbs_principalIdele`). [ShortProof] does not state (c); it is the
computation of the second Check.

### 4.5 Weil data

*Origin:* particular to this proof: the arithmetic data that fix the adelic Weil representation of the family in its
vacuum model. The self-duality in (b) is published (Tate (1950), §2.2 and §4.1: the dual of the integers under the
standard character is the inverse different).

*Method of the formal proof:* (a) is 4.1 (c). For (b), the finite adeles `z` with `ψ_f(zu) = 1` for all `u ∈ Ô` are
those with `z𝔇_E ⊂ Ô`, and the valuation condition makes `ȷαᾱ` a generator of the inverse different at every place.

*Weil data* on a CM field `E` with a CM type `Φ` consist of

- a splitting character `υ` of `E` for `Φ` (4.1);
- an element `ȷ ∈ E` with `ȷ̄ = −ȷ` and `Im τ(ȷ) > 0` for every `τ ∈ Φ`, such that `c₀ := (1 − ȷ⁻¹)/2` is an algebraic
  integer; and
- a finite idele `α` of `E` with `v_w(ȷ·α·ᾱ) = −v_w(𝔇_E)` at every finite place `w`;

where `E` is required to contain a primitive root of unity of order `5040`, so that the statements of 4.2 (a) hold for
`E`.

(a) For Weil data, `υ(ϖ_w) = −1` at every finite place `w = w̄`. A definition of Weil data that lists this property as
a condition (DivisibilityOfThetaDerivatives §1.4 (c)) defines the same notion.

(b) `ȷ ≠ 0`, `c₀ + c̄₀ = 1`, and `ȷαᾱ` is fixed by conjugation up to sign: `conj(ȷαᾱ) = −ȷαᾱ`. Let `ψ_f` be the
standard additive character of the finite adeles, `ψ_f(x) = exp(2πi·Tr_{E/ℚ}(a))` for any `a ∈ E` with `x − a ∈ Ô`.
Then `Ô` is its own dual for the pairing `(z, u) ↦ ψ_f(ȷαᾱ·z·u)`: a finite adele `z` satisfies `ψ_f(ȷαᾱ·z·u) = 1` for
all `u ∈ Ô` if and only if `z ∈ Ô`.

(c) *The scale idele* of Weil data is the idele with component `(2π·Im τ(ȷ))^{−1/2}` at `τ ∈ Φ` and finite part `α`.

**Checks.**

- The data `ȷ = −1/√−d`, `α` built from the derivative of the cyclotomic polynomial, on `E = ℚ(√−d, ζ)`, are those of
  DivisibilityOfThetaDerivatives §1.4, where `c₀ = (1 + √−d)/2`.
- The condition on `α` determines the fractional ideal of `αᾱ`, not that of `α`: `α` may be multiplied by any finite
  idele `u` with `uū` a unit at every place.
- `ȷ` determines `Φ`: since `τ(ȷ)` is purely imaginary and nonzero, exactly one of `τ`, `τ̄` has `Im τ(ȷ) > 0`, and
  `Φ = {τ : Im τ(ȷ) > 0}`.

*Needs:* 4.1, 4.2 (a); Mathlib `differentIdeal`, `IsPrimitiveRoot`.

[ShortProof], `Lib/Weil/Construction/WeilData.lean` (`New.WeilData`, `New.WeilData.scaleIdele`,
`New.WeilData.traceOne`, `New.WeilData.j_ne_zero`);
`Lib/Adelic/Adeles/AdditiveCharacter.lean` (`New.ψf`); `Lib/Weil/Construction/FiniteMultiplier.lean`
(`New.forall_selfDualAddChar_mul_eq_one_iff`, `New.traceOneAdele_add_star`)

## Downstream consumers

The roadmaps of the family `ShortGRH` name these results on their `*Needs:*` lines as `ShortGRH background (…)`, or
state them in their Conventions. Each takes the following.

- DivisibilityOfThetaDerivatives §1.4 takes the definition of Weil data (4.5), the existence of a splitting character
  (4.2) and its value `−1` at the places `w = w̄` (4.1 (c)), and the character `χ_f` with its values (4.4: (c), (d) for
  the power of `s₀` that lies in `K`); its §1.6 takes characters of given weight and tame part and their existence and
  finiteness (2.1, 2.2); its §4.2 takes the `p`-adic absolute values of `χ_f` (4.4 (e)).
- OneSidedPrimeSumBoundsAndAdmissibleData §3.4 takes the definition of weight and tame part and their laws (2.1) and
  the weight of `υ₁` (4.3 (a)).
- DeterminantsOfThetaLiftChains takes, in its Conventions, `[U(1)]` (1.1), weight and tame part (2.1), the base change
  (2.3), `L^S(z, ν)` (3.1), moduli and characters tame for a modulus (2.5 (c), (d)), and the characters of a rank
  (4.3 (a), (c)); its §1.2 takes 3.1 (a), (c), (d); its §3.1 takes split tame characters and their local characters
  (2.5 (a), (b)).
- ThetaLiftChainsAndTheSeesawIdentity takes, in its Conventions, Weil data (4.5), weight and tame part (2.1) and the
  rank twist (4.3 (e)).
- SelmerBoundsForAnticyclotomicTwists §2.3 takes Hilbert's Theorem 90 for the finite ideles of a CM field (1.2 (b)) and
  the groups `Cl_Q` with the surjection `y ↦ [y/ȳ]` (1.3 (b), (c)).
- The route also uses the injectivity of the base change (2.3 (a)) in the exchange identity of
  DeterminantsOfThetaLiftChains, Layer 3, and the absolute values of the conjugates of values (2.4 (b)) in the bounds
  for conjugates of jets of ThetaLiftChainsAndTheSeesawIdentity.

## Scope and ownership

### Owned here

- the groups `U(1)(𝔸)`, `U(1)(E⁺)`, `[U(1)]` of a CM field, Hilbert's Theorem 90 for finite ideles, and the class
  groups `Cl_S` (Layer 1);
- characters of `[U(1)]` with a weight and a tame part: laws, existence, finiteness, base change to Hecke characters of
  `E`, the arithmetic of their values, split tame characters with their local characters, moduli and characters tame
  for a modulus (Layer 2);
- the partial L-values `L^S(z, ν)` at real `z ≥ 1`, their identification with the presented L-function of the base
  change, and the inversion identity (Layer 3);
- splitting characters of a CM field for a CM type, their existence, the characters of a rank, the character
  `υ|·|^{−1/2}` on finite ideles, and Weil data (Layer 4).

### Not owned here

- the ideles, the idele norm, the action of automorphisms on adeles and ideles, and Hecke characters of a number field
  with their algebraicity, shift and local components: Tau Ceti (`TauCeti.NumberTheory.NumberField.Global`);
- CM fields and their complex conjugation: Mathlib; CM types: Tau Ceti;
- L-functions of algebraic Hecke characters, their continuation, and their non-vanishing on the boundary line:
  LFunctions §§6.1, 6.5, 6.9, 7.3;
- class field theory of the quadratic extension `E/E⁺`: ClassFieldTheory §§6.1, 11.1;
- splitting characters of unitary dual pairs as data of the Weil representation, and the Weil representation itself:
  MetaplecticAutomorphicForms §3.3, RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs §4.4a. The
  adelic Weil representation in the vacuum model that Weil data determine (the Heisenberg cocycle, the vacuum, the
  self-dual measure) is not stated here;
- the Artin map on finite ideles, which SelmerBoundsForAnticyclotomicTwists §2.3 uses with 1.2: ClassFieldTheory
  §11.1;
- the particular Weil data of the field `E = K(ζ)` of the family, the characters `χ₀`, `χ_M`, the pairs, twists and
  the characters of the lifts: DivisibilityOfThetaDerivatives §§1.4–1.6, OneSidedPrimeSumBoundsAndAdmissibleData §3.4;
- the products `L_*(S, ν, e)` and the ratios of Hecke values: DeterminantsOfThetaLiftChains, Conventions and §1.1;
- the values of characters on determinants of integral points of unitary groups of higher rank, which follow from
  2.5 (d): the roadmaps that state levels of unitary groups.

## Exact supplier contracts

### From Mathlib

`NumberField.IsCMField`, `NumberField.maximalRealSubfield`, `NumberField.IsCMField.complexConj` (the CM field and its
conjugation); `NumberField.IdeleGroup`, `NumberField.IdeleClassGroup`, `IsDedekindDomain.FiniteAdeleRing` (ideles and
finite adeles); `groupCohomology.Hilbert90.exists_div_of_norm_eq_one` (Hilbert's Theorem 90 for a cyclic extension of
fields; used for rational points in 1.2); `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (Kronecker's theorem; 1.3
(e)); `MulChar` (characters of residue fields and of `𝒪_E/𝔪`); `differentIdeal`, `IsPrimitiveRoot`,
`NumberField.classNumber`.

### From Tau Ceti

`TauCeti.CMType` (CM types as sets of embeddings); `ideleMulDistribMulAction`, `finiteAdeleGaloisAction` (the action of
automorphisms on ideles and on finite adeles); `ideleExtension`, `mem_range_ideleExtension_iff` (the ideles of `E⁺`
are the ideles of `E` fixed by `Gal(E/E⁺)`); `ideleNormMap` (the relative norm of ideles); `ideleNorm` (the idele norm,
a homomorphism to the positive reals; its positivity needs no target here); `isCompact_normOne` (compactness of the
idele classes of norm one; 1.1 (c)); `HeckeCharacter`, `HeckeCharacter.IsAlgebraic`, `HeckeCharacter.shift`,
`HeckeCharacter.finiteComponent`, `HeckeCharacter.normPow` (Hecke characters, their algebraicity, shift, local
components and the norm characters).

### From other roadmaps

LFunctions §6.1 (the presentation `Grossencharacter K 𝔪` of an algebraic Hecke character at a modulus of definition,
with its unitary ideal weight equal to the value at a uniformiser at the primes outside the modulus); §6.5
(`lFunctionC` and `lFunctionC_eq`: on the half-plane of convergence it is the series over the ideals prime to the
modulus, with its Euler factors); §6.9 (continuation); §7.3 (`Grossencharacter.meromorphicOrderAt_lFunctionC`: order
`0` at the points `1 + σ + it` when the unitary weight is not a norm twist on its good ideals, which holds for `ν̃` of
nonzero weight because its angular frequencies `2e(τ)` are not all zero; used at `s = 1`, `σ = 0`, in 3.1 (c)).
ClassFieldTheory §11.1 (`globalArtinMap`, with `C_K/N_{L/K}(C_L) ≃ Gal(L/K)^ab`, `globalArtinMap_local` and
`globalArtinMap_principal`, for the quadratic extension `E/E⁺`; used in 4.1 (b), (c) and 4.2 (b)), §6.1
(`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`, used in 4.1 (c); the local Artin map of an unramified
extension, `localArtinMap_eq_frobenius_pow_valuation`, used in 4.2 (b)).

## References

- [ShortProof] The shorter Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet
  L-functions: the folder `grh` of github.com/lsernau/grh-lean at commit `72fead1`; paths are relative to its directory
  `src/`. It is distributed under the Apache 2.0 licence. This roadmap covers its files
  `Lib/ClassField/HeckeCharacter/Basic.lean`, `SplitTameCharacters.lean`, `SplittingCharacters.lean`,
  `AlgebraicValues.lean` and the definitions of `TameModulus.lean` in that folder,
  `Lib/ClassField/Avatar/HeckeBaseChange.lean` (the part on L-functions),
  `Lib/ClassField/Global/CMSplittingCharacters.lean`
  (the parts on splitting characters), `Lib/Weil/Construction/WeilData.lean` (the definitions of splitting characters and
  Weil data), and the declarations named in the pointers.
- M. Harris, S. S. Kudla, W. J. Sweet, *Theta dichotomy for unitary groups*, J. Amer. Math. Soc. 9 (1996), 941–1004:
  splitting characters of unitary dual pairs (4.3).
- E. Hecke, *Eine neue Art von Zetafunktionen und ihre Beziehungen zur Verteilung der Primzahlen. Zweite Mitteilung*,
  Math. Z. 6 (1920), 11–51: L-functions of Größencharaktere (3.1).
- D. Hilbert, *Die Theorie der algebraischen Zahlkörper*, Jahresber. Deutsch. Math.-Verein. 4 (1897), 175–546: Satz 90
  (1.2).
- S. S. Kudla, *Splitting metaplectic covers of dual reductive pairs*, Israel J. Math. 87 (1994), 361–401: the
  restriction condition on splitting characters (4.3).
- J. Neukirch, *Algebraic Number Theory*, Springer (1999): Chapter VI §1 (ideles, ray class groups; 1.3), Chapter VII
  §§6, 8 (Größencharaktere and their L-functions; 2.3, 3.1).
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, second edition, Springer (2008): Chapter VIII
  §1 (cohomology of the idele group; 1.2).
- V. Platonov, A. Rapinchuk, *Algebraic Groups and Number Theory*, Academic Press (1994): §5.3 (compactness of the
  adelic quotient of an anisotropic group; 1.1).
- A. Raghuram, *Notes on the arithmetic of Hecke L-functions*, arXiv:2207.03399: §4, characters of type `A₀` of CM
  fields (4.1, 4.2).
- J. D. Rogawski, *Automorphic Representations of Unitary Groups in Three Variables*, Annals of Mathematics Studies
  123, Princeton University Press (1990): base change from `U(1)` (2.3).
- J. Tate, *Fourier analysis in number fields and Hecke's zeta-functions*, thesis (1950), in J. W. S. Cassels and
  A. Fröhlich (eds.), *Algebraic Number Theory*, Academic Press (1967), Chapter XV: the standard additive character and
  its dual lattice, the integral representation of Hecke L-functions (3.1, 4.5).
- A. Weil, *On a certain type of characters of the idèle-class group of an algebraic number-field*, Proceedings of the
  international symposium on algebraic number theory, Tokyo and Nikko 1955, Science Council of Japan (1956), 1–7:
  characters of type `A₀`, their existence and the algebraicity of their values (2.1, 2.2, 2.4, 4.1, 4.2, 4.4).

The sources other than Hilbert, Kudla, Harris–Kudla–Sweet, Neukirch–Schmidt–Wingberg, Platonov–Rapinchuk and Rogawski
are those named in the heads of the files of [ShortProof] that this roadmap covers; its `REFERENCES.md` says which
citations were compared with their sources.
