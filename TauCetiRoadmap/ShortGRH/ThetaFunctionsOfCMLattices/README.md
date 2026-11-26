# Roadmap: theta functions of CM lattices

**Summary.** This roadmap is the theory of one elliptic curve with complex multiplication, written with theta
functions instead of a Weierstrass model. Its objects are a lattice `Λ ⊂ ℂ` with a point `t` of order two, scaled so
that `℘″(t) = 2`; the sigma function `σ` of `Λ`, normalised as a theta function for the hermitian form
`H(l, z) = (π/A)·l̄z` (`A` the area of `ℂ/Λ`); its translate `θ` by `t`, normalised by `θ(0) = 1`; and the coordinates
`x(z) = ℘(z + t) − ℘(t)`, `y(z) = (℘′(z + t) − a₁x(z))/2` of the cubic `y² + a₁xy = x³ + x`, in which `y` is a parameter at
the origin. A *CM lattice* is such a lattice that is stable under the integers of `K = ℚ(√−d)`, for a prime
`d ≡ 7 (mod 8)`, with `t` the point of order two that neither prime of `K` above `2` kills.

The headline theorems are these, for a CM lattice and every prime `p`, with `𝒪` the valuation ring of `ℂ_p` and
complex numbers read in `ℂ_p` through any embedding.

(1) *Good reduction* (2.3). The discriminant `a₁⁴ − 64` of the cubic is a unit at every prime, and `a₁` is integral.

(2) *The integrality principle* (3.3, 3.4). The sections of degree `m`, that is the theta functions for `mH` and the
`m`-th power of the multiplier of `θ`, are spanned by the monomials `θ^a(σ²)^bG^c` (`G` the entire function `yθ³`). The
values of the monomials at torsion points, with the exponential factor of the degree, are integral, and a section
whose values at torsion points are integral is an integral combination of monomials; its Taylor series is `θ^m` times an
integral power series in `y`.

(3) *The ring `𝒪[[y]]` and the formal parameter* (3.1, 3.5, 4.1 to 4.6). The ring `𝒪[[y]]` of integral series in `y`
contains `x`, is stable under `d/dz`, under the isogenies between CM lattices and under the group law, and contains
`θ(αz)/θ(z)^{αᾱ}` for `α ∈ 𝒪_K`; `√−d·(log θ)″(0)` is integral. The part `T` of `y` in the degrees
`≡ 1 (mod q_p − 1)` generates `𝒪[[y]]`, and after the scaling `z ↦ ϖz`, with `ϖ` of valuation `ρ_p = v(π_p)/(q_p − 1)`,
it is `ϖ` times an integral series congruent to `Σ_j z^{q_p^j}` modulo `π_p`.

(4) *Conjugates* (5.1 to 5.3). An automorphism of `ℂ` over `K` carries the Taylor series of `θ`, `x`, `y` to those of
the CM lattice with the conjugate `a₁`; when the lattice is `Ω₀𝒪_K`, one finite adele of `K` describes its action on
the translates of `θ` by the points of `KΩ₀` (complex multiplication, without the reciprocity law); and there is one
number `u`, a unit at every prime, such that every conjugate lattice, scaled by the conjugate of `u`, has the area
`π·exp(γ − Re (L′/L)(1, χ_K))·2π/√d` (the Chowla–Selberg formula with a unit).

The roadmap belongs to the family ShortGRH and states, as numbered targets, the results on CM lattices that
DivisibilityOfThetaDerivatives uses from the folder `src/Lib` of [ShortProof]: that roadmap takes the functions of a CM
lattice and the ring `𝒪[[y]]` for its formal group layer (its §§2.1 to 2.5), the sections and their torsion values for
the integral vacuum (its §§4.5, 4.6, 4.9, 4.10), the conjugates and the Chowla–Selberg unit for the scale of Taylor
series (its §§4.2, 4.7), and the group law and the scaled parameter for the sharpness of its bound (its §5.2). It builds
on Tau Ceti's Weierstrass functions of a lattice (`PeriodPair.weierstrassSigma`, the quasi-periods and Legendre's
relation, the addition theorem, the recovery of a lattice from `g₂`, `g₃` and the uniformisation theorem) and on the
Chowla–Selberg formula in class-mean form (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (a), in Tau
Ceti as `TauCeti.NumberField.chowlaSelberg_classMean`). The roadmaps of RiemannHypothesisForDirichletLFunctions state
neighbouring results in another normalisation (a Weierstrass model of unit discriminant, primes away from `d` and from a
finite set); the relation is noted under the sections concerned.

There are five layers. Layer 1 is analytic and has no hypothesis on `d`: the sigma function, normalised pointed
lattices, `θ`, the cubic, `−log θ`, and the sections. Layer 2 is the arithmetic of CM lattices: they are multiples of
ideals, sections pull back along isogenies, the discriminant is a unit, and there are finitely many lattices. Layer 3
is the integrality principle at one prime: the ring `𝒪[[y]]`, torsion values, integral sections, and isogenies in
`𝒪[[y]]`. Layer 4 is the formal group: `−log θ`, the group law, the height, the formal parameter and its scaling.
Layer 5 is the conjugates of a CM lattice.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line.
- *Lattices.* A lattice `Λ ⊂ ℂ` is given by a pair of periods (Mathlib's `PeriodPair`); `℘`, `℘′`, `g₂`, `g₃` are
  Mathlib's `PeriodPair.weierstrassP`, `PeriodPair.derivWeierstrassP`, `PeriodPair.g₂`, `PeriodPair.g₃`, and `σ_W`,
  `ζ_W`, `η` are Tau Ceti's `PeriodPair.weierstrassSigma`, `PeriodPair.weierstrassZeta` and `PeriodPair.quasiPeriod`.
  `A = A(Λ)` is the area of `ℂ/Λ`, that is `|Im(ω̄₁ω₂)|` for periods `ω₁, ω₂`. A point `u ∈ ℂ` is a *torsion point* of
  `Λ` if `nu ∈ Λ` for some integer `n ≥ 1`.
- *The hermitian form and twisted translation.* `H(l, z) := (π/A)·l̄z` and `E(u, v) := Im(ūv)/A`, which is
  integral on `Λ`. For `m ≥ 0`, `u ∈ ℂ` and a function `f` on `ℂ`,
  `(T^m_uf)(z) := exp(−mπ(zū + |u|²/2)/A)·f(z + u)`, the *twisted translate of degree `m`* of `f` by `u`. Then
  `T^{m+n}_u(fg) = T^m_uf·T^n_ug`.
- *Isogenies.* For lattices `Λ`, `Λ′` with areas `A`, `A′`, a number `a ∈ ℂ` and a natural number `N`,
  "`z ↦ az` is an isogeny of degree `N` from `Λ` to `Λ′`" means `aΛ ⊂ Λ′` and `aā·A = N·A′`. If `aΛ ⊂ Λ′`, there is
  exactly one such `N`. The case `a = 0`, `N = 0` is allowed.
- *The field.* From Layer 2 on, `d` is a prime with `d ≡ 7 (mod 8)`, `K = ℚ(√−d) ⊂ ℂ` with `√−d = i√d`,
  `β_K = (1 + √−d)/2`, so `𝒪_K = ℤ[β_K]`, and `χ_K = (·/d)` is the quadratic character of `K`. The prime `2` splits
  in `K`. A prime `p` is *split*, *inert* or *ramified* in `K` according as `χ_K(p) = 1`, `−1`, `0`.
- *Primes and valuations.* `p` is a prime and `ι_p : ℂ → ℂ_p` a ring homomorphism; the statements hold for every
  choice of `ι_p`. `v` is the valuation of `ℂ_p` with `v(p) = 1`, `‖x‖ = p^{−v(x)}`, and `𝒪` is the valuation ring of
  `ℂ_p`. A series over `ℂ_p` is *integral* if its coefficients lie in `𝒪`; a complex number `c` is *`p`-integral* if
  `ι_p(c) ∈ 𝒪`, and a *unit at `p`* if `‖ι_p(c)‖ = 1`.
- *Taylor series.* For `f` analytic at `0`, its Taylor series at `0` is a power series in `z` over `ℂ`; "read in
  `ℂ_p`" means that `ι_p` is applied to its coefficients, and for an automorphism `s` of `ℂ`, "the conjugate series"
  means that `s` is applied to them. The series of `θ`, `x`, `y` are written with the same letters. `F(az)` is
  Mathlib's `PowerSeries.rescale a F`, and `F(S)`, for `S` without constant term, is `PowerSeries.subst`.
- *The exponential and the logarithm of a series.* For a power series `S` without constant term over a field of
  characteristic `0`, `exp(S) := Σ_n S^n/n!` (Mathlib's `PowerSeries.exp` with `S` substituted), as in
  MatricesOverValuationRingsAndElementaryInputs §6.1, which gives `exp(S + S′) = exp(S)·exp(S′)`. For `F` with
  `F(0) = 1`, `log F := Σ_{n≥1} (−1)^{n−1}(F − 1)^n/n` (Mathlib's `PowerSeries.logOf`). Their relations are 1.4 (o).
- *Automorphisms.* In Layer 5 the letter `σ` denotes an automorphism of `ℂ` over `K`, as in the roadmaps that cite
  that layer; the sigma function does not occur there.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `A`, `H`, `E`, `T^m_u` | the area, the hermitian form, its alternating form, twisted translation | Conventions |
| `s₂`, `σ`, `ε` | the constant with `η(l) = s₂l + (π/A)l̄`, the sigma function `σ_W·exp(−s₂z²/2)`, its sign | 1.1 |
| `(Λ, t, a₁)`, `C` | a normalised pointed lattice; a CM lattice | 1.2 |
| `θ`, `x`, `y`, `G`, `χ` | the functions of a normalised pointed lattice and the multiplier of `θ` | 1.3 |
| `g` | `−log θ` | 1.4 |
| sections of degree `m`, monomials | theta functions for `(mH, χ^m)`; `θ^a(σ²)^bG^c`, of degree `a + 2b + 3c` | 1.5 |
| `n(l)` | the integer `|l|²√d/(2A)` for `l ∈ Λ` | 2.2 |
| `𝒪[[y]]` | the integral power series in `y` | 3.1 |
| `F[u]_n` | the torsion value `(T^n_uF)(0)` | 3.2 |
| `𝒪[[y(μz)]]` | the integral power series in the `y(μ_iz)` | 4.2 |
| `π_p`, `q_p`, `ρ_p`, `o(α)` | `√−d` or `p`; `p²` or `p`; `v(π_p)/(q_p − 1)`; the reduced order of `y(αz)` | 4.4 |
| `T` | the formal parameter | 4.5 |
| `σ(C)`, `u` | the conjugate of a CM lattice; the Chowla–Selberg unit | 5.1, 5.3 |

## Layer 1: The sigma function, the functions of a pointed lattice, and sections

This layer is classical function theory on one lattice. The sigma function is normalised so that its factor of
automorphy is that of the hermitian form `H` (1.1); a point of order two and a scaling give the coordinates of a cubic
`y² + a₁xy = x³ + x` whose origin is `z = 0` (1.2, 1.3); the second logarithmic derivative of `θ` is `−x` up to a
constant (1.4); and the theta functions of each degree are spanned by monomials in three of them (1.5).

### 1.1 The sigma function of a lattice

*Origin:* adapted from the classical theory of the sigma function and of theta functions of one variable (Weil
(1976), Chapters IV and VI; Silverman (1994), Chapter I §5; for the dimension, Frobenius's formula for theta functions,
Mumford (1970), Chapter I): here, the sigma function divided by the Gaussian that makes its factor of automorphy the one of
`H`, with the sign `ε`.

*Method of the formal proof:* [ShortProof] does not use the Weierstrass product. It proves the dimension formula (c)
from a general dimension formula for theta functions of complex tori, takes for `σ` an odd element with derivative
`1` at `0` of the line of theta functions for `(H, ε)` (the odd part of a nonzero element is nonzero, because a theta
function for `(H, ε)` cannot be even), and proves that a nonzero theta function for `(H, χ)` vanishing at `0` has
simple zeros exactly on `Λ`. The left side of the addition formula, as a function of `u`, is a theta function for
`(2H, 1)`, hence a combination of `σ²` and `℘σ²` by the last statement of (d), and the coefficients are found at
`u = 0` and `u = v`. The identification (a), (b) with
`σ_W` is not made in [ShortProof]; with Tau Ceti's quasi-periodicity of `σ_W` it is the computation
`σ(z + l) = ε(l)·exp((η(l) − s₂l)(z + l/2))·σ(z)`.

Let `Λ` be a lattice with area `A`, and put `ε(l) := 1` if `l/2 ∈ Λ` and `ε(l) := −1` otherwise.
(a) There is exactly one `s₂ = s₂(Λ) ∈ ℂ` with `η(l) = s₂·l + (π/A)·l̄` for every `l ∈ Λ`.
(b) The *sigma function* `σ(z) := σ_W(z)·exp(−s₂z²/2)` is entire and odd, `σ′(0) = 1`, its zeros are the points of
`Λ` and are simple, and `σ(z + l) = ε(l)·exp(H(l, z) + H(l, l)/2)·σ(z)` for `l ∈ Λ`; that is, `T^1_lσ = ε(l)·σ`.
(c) Let `χ : Λ → ℂ` have `|χ| = 1` and `χ(l + l′) = χ(l)χ(l′)·(−1)^{E(l, l′)}` (for example `χ = ε`). For `m ≥ 1` the
entire functions `f` with `f(z + l) = χ(l)^m·exp(m·(H(l, z) + H(l, l)/2))·f(z)` for all `l ∈ Λ`, the *theta functions
for `(mH, χ^m)`*, form a space of dimension `m`; for `m = 0` they are the constants. In particular `σ` is the only odd
theta function for `(H, ε)` with derivative `1` at `0`.
(d) For `u, v ∉ Λ`: `σ(u + v)·σ(u − v) = (℘(v) − ℘(u))·σ(u)²·σ(v)²`; for `z ∉ Λ`: `σ(2z) = −℘′(z)·σ(z)⁴`; and the
entire functions `σ²` and `℘σ²` are a basis of the theta functions for `(2H, 1)`.

**Checks.** For `Λ = ℤ[i]`: `σ_W(iz) = iσ_W(z)` gives `η(il) = −iη(l)`, so `η` is conjugate-linear, `s₂ = 0` and
`η(1) = π`. With `σ_W` in place of `σ` the factor of automorphy is `exp(η(l)(z + l/2))`, which is not `exp(H(l, z) +
H(l, l)/2)` unless `s₂ = 0`. In (c) the function `ε` satisfies the hypothesis: `ε(l + l′)ε(l)ε(l′) = (−1)^{E(l, l′)}`,
since for a basis `ω₁, ω₂` and `l = aω₁ + bω₂` one has `ε(l) = (−1)^{a+b+ab}` and `E(l, l′) ≡ ab′ − a′b (mod 2)`.

*Needs:* Tau Ceti (`PeriodPair.weierstrassSigma` with `PeriodPair.weierstrassSigma_neg`,
`PeriodPair.deriv_weierstrassSigma_zero`, `PeriodPair.weierstrassSigma_eq_zero_iff`,
`PeriodPair.analyticOrderAt_weierstrassSigma_coe`, `PeriodPair.weierstrassSigma_add_coe_of_div_two_mem`,
`PeriodPair.weierstrassSigma_add_coe_of_div_two_notMem`; `PeriodPair.quasiPeriod`, `PeriodPair.quasiPeriod_legendre`;
`PeriodPair.logDeriv_weierstrassSigma`); Mathlib (`PeriodPair`, `PeriodPair.weierstrassP`).

*Relation to the library.* ModularCurvesPartII §1.4a is the sigma function `σ_W` with its quasi-periods and Legendre's
relation, which Tau Ceti has; ThetaChainsOnDefiniteUnitaryGroups §3.1c calls `σ_W·exp(−s₂z²/2)` the reduced theta
function of the lattice of that roadmap. Neither states (c) or (d).

[ShortProof], `Lib/CM/Sigma/Basic.lean` (`PeriodPair.area`, `PeriodPair.hermitianForm`, `New.sigmaSign`,
`New.IsAppellHumbert.finrank_thetaSpace_nsmul`, `New.IsAppellHumbert.theta_eq_zero_iff_mem_lattice`,
`New.IsAppellHumbert.deriv_theta_ne_zero`, `New.IsAppellHumbert.thetaSpace_two_eq_span_pair`, `PeriodPair.σ`,
`New.sigma_add_of_mem_lattice`, `New.sigma_neg`, `New.deriv_sigma_ne_zero`, `New.sigma_add_mul_sigma_sub`,
`New.sigma_two_mul`)

### 1.2 Normalised pointed lattices and CM lattices

*Origin:* definitions and conventions; the facts are classical (the differential equation of `℘` at a point of order
two; a lattice is determined by `g₂`, `g₃`).

*Method of the formal proof:* definitions. [ShortProof] has one structure with a parameter `d`, in which the
conditions on `𝒪_K` are void for `d = 0`; the facts are computations from `℘′² = 4℘³ − g₂℘ − g₃` and
`℘″ = 6℘² − g₂/2`, with `℘′(t) = 0`.

A *normalised pointed lattice* is a lattice `Λ` with a point `t ∈ ℂ` such that `2t ∈ Λ` and `t ∉ Λ`, scaled so that
`g₂(Λ) = 12℘(t)² − 4`, together with a number `a₁ ∈ ℂ` with `a₁² = 12℘(t)`. For a prime `d ≡ 7 (mod 8)`, a *CM
lattice* `C` (for `d`) is a normalised pointed lattice `(Λ, t, a₁)` such that `𝒪_KΛ ⊂ Λ`, `β_Kt ∉ Λ` and `β̄_Kt ∉ Λ`.
Facts, for a normalised pointed lattice:
(a) `℘′(t) = 0`, `℘″(t) = 2`, `g₃ = 4℘(t)³ − g₂℘(t)`, and `g₂³ − 27g₃² = a₁⁴ − 64`; in particular `a₁⁴ ≠ 64`.
(b) Two normalised pointed lattices with the same `a₁²` have the same lattice `Λ` and the same `t` modulo `Λ`.
(c) For every lattice `Λ₀` and every `t₀` with `2t₀ ∈ Λ₀`, `t₀ ∉ Λ₀` there is `c ≠ 0` such that `(cΛ₀, ct₀)`, with
either square root of `12℘_{cΛ₀}(ct₀)`, is a normalised pointed lattice; the possible `c` are one of them times the
fourth roots of unity.

**Checks.** With `e = ℘(t) = a₁²/12`: `g₂ = 12e² − 4` and `g₃ = 4e − 8e³`, so
`g₂³ − 27g₃² = 144e² − 64 = a₁⁴ − 64`. The scaling `℘″(t) = 2` can be reached because `℘″(t₀) ≠ 0` at a point of order
two (`℘″(t₀) = 2(e₁ − e₂)(e₁ − e₃)`), and `℘″_{cΛ}(ct) = c^{−4}℘″_Λ(t)`.

*Needs:* 1.1; Mathlib (`PeriodPair.derivWeierstrassP_sq`, `PeriodPair.g₂`, `PeriodPair.g₃`); Tau Ceti
(`PeriodPair.deriv_derivWeierstrassP`, `PeriodPair.lattice_eq_iff_g₂_eq_and_g₃_eq`,
`PeriodPair.weierstrassP_eq_weierstrassP_iff`).

[ShortProof], `Lib/CM/Sigma/Basic.lean` (`New.CMLattice`, `New.quadGen`, `New.quadInt`,
`New.derivWeierstrassP_eq_zero_iff`, `New.deriv_derivWeierstrassP`), `Lib/CM/Sigma/ThetaSections.lean`
(`New.CMLattice.g₃_eq`, `New.CMLattice.disc_eq`); (b) and (c) are not stated there in this form ((c) is inside
`New.QuadField.exists_cmLattice_latticeModule_eq_scaledIdeal` and `New.CMLattice.pow_four_eq_one_of_mul_mem_iff` of 2.1)

### 1.3 The functions `θ`, `x`, `y` and the cubic

*Origin:* adapted from the classical theory of the Weierstrass functions (Silverman (1986), Chapter VI; Weil (1976)):
here, with the origin moved to the point `t` of order two, the theta function `θ` of degree one normalised at `0`, and
the cubic `y² + a₁xy = x³ + x`.

*Method of the formal proof:* `θ` is even because `σ` is odd and `2t ∈ Λ`; `θ² = (℘ − ℘(t))σ²` is the addition formula
of 1.1 (d) at `v = t`, and `σ² = xθ²` follows from it by translating by `t`, the constant being fixed by the behaviour
at `0`; the cubic is the differential equation of `℘` at `z + t` (Check of 1.2); `G` is entire because the poles of
`y` at `−t + Λ` are cancelled by `θ³`; the addition formula for `θ` is that of `σ` translated.

Let `(Λ, t, a₁)` be a normalised pointed lattice. Put
`θ(z) := (T^1_tσ)(z)/(T^1_tσ)(0)`, `x(z) := ℘(z + t) − ℘(t)`, `y(z) := (℘′(z + t) − a₁x(z))/2`,
`G := σ·(σ′θ − σ·(θ′ + (a₁/2)θ))`, and for `l ∈ Λ` the *multiplier* `χ(l) := ε(l)·exp(2πi·E(l, t))`.
(a) `(T^1_tσ)(0) = exp(−π|t|²/(2A))·σ(t)` is a fourth root of unity. `θ` is entire and even, `θ(0) = 1`, its zeros are
the points of `−t + Λ = t + Λ` and are simple, and `T^1_lθ = χ(l)·θ` for `l ∈ Λ`, with `χ(l) = −1` if `t + l/2 ∈ Λ` and
`χ(l) = 1` otherwise.
(b) `θ(z)² = (℘(z) − ℘(t))·σ(z)²` for `z ∉ Λ`, and `σ(z)² = x(z)·θ(z)²` for `z ∉ t + Λ`.
(c) For `z ∉ t + Λ`: `x′² = x·(4x² + a₁²x + 4)`, `y² + a₁xy = x³ + x`, `x′ = 2y + a₁x` and `y′ = 1 + 3x² − a₁y`.
Moreover `x` and `y` are analytic at `0`, `x(0) = y(0) = 0`, `y′(0) = 1`, and `x = z² + O(z⁴)`.
(d) `G` is entire, `G = yθ³` off `t + Λ`, and `G² + a₁σ²θG = σ⁶ + σ²θ⁴` everywhere.
(e) For `z ∉ t + Λ` and every `w`: `θ(z + w)·θ(z − w) = θ(z)²·(θ(w)² − x(z)·σ(w)²)`.

**Checks.** `x′² = 4x(x² + 3ex + 1)` with `12e = a₁²`, by the Check of 1.2, and then
`y² + a₁xy = (x′² − a₁²x²)/4 = x³ + x`. The cubic `y² + a₁xy = x³ + x` has discriminant `a₁⁴ − 64`, the number of
1.2 (a). The point `z = 0` goes to the point `(0, 0)` of order two of the cubic and `z = t` to its point at infinity:
the parameter at the origin of the group law used below is `y`, not `−x/y`.

*Needs:* 1.1, 1.2; Mathlib (`PeriodPair.derivWeierstrassP_sq`).

[ShortProof], `Lib/CM/Sigma/Basic.lean` (`New.CMLattice.twistedTranslate`, `New.CMLattice.multiplier`,
`New.CMLattice.θ`, `New.CMLattice.translatedX`, `New.CMLattice.translatedY`, `New.CMLattice.translatedYThetaCube`),
`Lib/CM/Sigma/ThetaSections.lean` (`New.CMLattice.theta_zero`, `New.CMLattice.theta_eq_zero_iff`,
`New.CMLattice.deriv_θ_ne_zero`, `New.CMLattice.twistedTranslate_theta_of_mem`,
`New.CMLattice.multiplier_eq_neg_sigmaSign`, `New.CMLattice.theta_neg`, `New.CMLattice.theta_sq`,
`New.CMLattice.sigma_sq_eq_translatedX_mul_theta_sq`, `New.CMLattice.deriv_translatedX_sq`,
`New.CMLattice.weierstrass_equation`, `New.CMLattice.deriv_translatedX`, `New.CMLattice.deriv_translatedY_eq`,
`New.CMLattice.deriv_translatedY_zero`, `New.CMLattice.translatedYThetaCube_eq_translatedY_mul_theta_cube`,
`New.CMLattice.translatedYThetaCube_sq_add`, `New.CMLattice.theta_add_mul_theta_sub`,
`New.CMLattice.taylorVia_curve_eq`), `Lib/CM/Integrality/Doubling.lean`
(`New.CMLattice.twistedTranslate_t_sigma_zero_pow_four`), `Lib/CM/Integrality/LogTheta.lean`
(`New.CMLattice.coeff_two_taylorVia_translatedX`)

### 1.4 The logarithm of `θ` and the duplication formulas

*Origin:* adapted from the classical formulas `(log σ_W)″ = −℘` and the duplication formula of the sigma function
(Silverman (1986), Chapter VI): here for `θ` and `σ` of a normalised pointed lattice.

*Method of the formal proof:* (o) is formal, by comparing derivatives and constant terms. The addition formula
1.3 (e), differentiated twice in `w` at `w = 0`, gives (a); (b) is its statement for power series, with (o). The
duplication formulas come from the addition formulas 1.1 (d) and 1.3 (e) with equal arguments (for `θ`:
`θ(2z)·θ(0) = θ(z)²·(θ(z)² − x(z)σ(z)²)` and `σ² = xθ²`).

(o) *Exponential and logarithm.* Let `k` be a field of characteristic `0`, `S ∈ k[[z]]` without constant term and
`F ∈ k[[z]]` with `F(0) = 1`. Then `exp(S)′ = S′·exp(S)`, `F·(log F)′ = F′`, `log(exp(S)) = S` and `exp(log F) = F`.

Let `(Λ, t, a₁)` be a normalised pointed lattice and `g := −log θ`, the logarithm of the Taylor series of `θ` at `0`
with the sign changed; so `g(0) = 0` and `exp(−g) = θ`.
(a) `θ′(0) = 0`, and `θ′² = θθ″ + (x − θ″(0))·θ²` off `t + Λ`.
(b) `g′(0) = 0` and `g″ = g″(0) + x` as power series, with `g″(0) = −θ″(0)`.
(c) `g″(0) = s₂ + a₁²/12`.
(d) `θ(2z) = θ(z)⁴ − σ(z)⁴` and `σ(2z)² = θ²σ²·(4θ⁴ + a₁²θ²σ² + 4σ⁴)` at every `z`.

**Checks.** (c): `(log σ)″ = −℘ − s₂` by 1.1 (b) and `(log σ_W)″ = −℘`, so `g″ = ℘(z + t) + s₂ = x + ℘(t) + s₂`. In
(d), dividing the second formula by the square of the first gives, for `x = σ²/θ²`,
`x(2z) = x·(4x² + a₁²x + 4)/(x² − 1)²`: the duplication formula `X(2P) = (X² − 1)²/(X·(4X² + a₁²X + 4))` of the cubic
followed by the translation by its point `(0, 0)`, which is `X ↦ 1/X`.

*Needs:* 1.1, 1.3; MatricesOverValuationRingsAndElementaryInputs §6.1 (a) (the constant term of `exp(S)`); Mathlib
(`PowerSeries.exp`, `PowerSeries.logOf`, `PowerSeries.derivative`); Tau Ceti
(`PeriodPair.hasDerivAt_logDeriv_weierstrassSigma`, for (c)).

*Relation to the library.* (c) identifies `g″(0)` with the number `s₂ + b₂/12` of
ThetaChainsOnDefiniteUnitaryGroups §3.1c (a) (there `b₂ = a₁²`); [ShortProof] does not state (c) and works with
`g″(0)` throughout.

[ShortProof], `Lib/General/Algebra/SeriesBounds.lean` (`New.derivative_expSubst`, `New.mul_derivative_logOf`,
`New.logOf_expSubst`, `New.expSubst_logOf`), `Lib/CM/Integrality/LogTheta.lean` (`New.CMLattice.deriv_theta_zero`,
`New.CMLattice.deriv_theta_sq`, `New.CMLattice.negLogTheta`, `New.CMLattice.coeff_one_negLogTheta`,
`New.CMLattice.derivative_derivative_negLogTheta`), `Lib/CM/Integrality/Doubling.lean`
(`New.CMLattice.theta_two_mul`, `New.CMLattice.sigma_two_mul_sq`); [ShortProof] proves (o) over `ℂ_p` and reads `g` in
`ℂ_p`

### 1.5 Sections

*Origin:* adapted from the classical description of the elliptic functions with poles at one point as polynomials in
`℘` and `℘′` (Silverman (1986), Chapter VI, Theorem 3.2), stated for theta functions: here, the sections of degree `m`
and their spanning monomials.

*Method of the formal proof:* the monomials are sections by 1.3 and the rule for products. The span is proved by
induction on the degree: a section of degree `m ≥ 2`, minus a multiple of a monomial of degree `m` without a factor
`θ` (which does not vanish at `−t`), vanishes on the zeros of `θ`, hence is `θ` times a section of degree `m − 1` by
the division statement (e); the degrees `0` and `1` are (b). (e) holds because the quotient is entire (the zeros of
`g` are simple) and has the right factor of automorphy.

Let `(Λ, t, a₁)` be a normalised pointed lattice. A *section of degree `m`* is a theta function for `(mH, χ^m)`
(1.1 (c), with the multiplier `χ` of 1.3): an entire `F` with `T^m_lF = χ(l)^m·F` for all `l ∈ Λ`. The *monomial*
of a triple `(a, b, c)` of natural numbers is `θ^a·(σ²)^b·G^c`, and its *degree* is `a + 2b + 3c`.
(a) `θ`, `σ²`, `G` are sections of degrees `1`, `2`, `3`; the product of sections of degrees `m`, `n` is a section of
degree `m + n`; so the monomial of `(a, b, c)` is a section of degree `a + 2b + 3c`, equal to `θ^{a+2b+3c}x^by^c` off
`t + Λ`.
(b) The sections of degree `0` are the constants, and the sections of degree `m ≥ 1` have dimension `m`.
(c) Every section of degree `m` is a complex combination of the monomials of degree `m` with `c ≤ 1`.
(d) Every section `F` of degree `m` is `θ^m·(P₀(x) + y·P₁(x))` off `t + Λ`, for polynomials `P₀`, `P₁` with
`2·deg P₀ ≤ m` and `2·deg P₁ + 3 ≤ m`; if `F` is even, then `P₁ = 0`.
(e) Let `(Λ′, t′, a₁′)` be a normalised pointed lattice, `u ∈ ℂ`, `a ≠ 0`, and suppose `g(z) := (T′^1_uθ′)(az)` is a
section of degree `m` for `Λ` (`T′`, `θ′` those of `Λ′`). Then the zeros of `g` are simple, and a section of degree
`m + k` for `Λ` that vanishes at every zero of `g` is `g` times a section of degree `k`.

**Check.** The monomials of degree `m ≥ 1` with `c ≤ 1` number `⌊m/2⌋ + 1 + ⌊(m − 3)/2⌋ + 1 = m` (the second count
being `0` for `m < 3`), the dimension of (b); so they are a basis.

*Needs:* 1.1 (c), 1.3.

*Relation to the library.* NonordinaryCMSpecialValues §4.2 defines theta spaces `T_{r,𝔞}` on the ideals of an
imaginary quadratic field with another normalisation of the factor of automorphy and their integral structures by
sections of line bundles on a curve with good reduction; it does not give the monomials or the statements of Layer 3.

[ShortProof], `Lib/CM/Sigma/Basic.lean` (`New.CMLattice.sections`), `Lib/CM/Sigma/ThetaSections.lean`
(`New.CMLattice.theta_mem`, `New.CMLattice.mem_sections_iff_twistedTranslate`, `New.CMLattice.mem_sections_iff`,
`New.CMLattice.monomialDeg`, `New.CMLattice.monomialSection`, `New.CMLattice.monomialSection_eq`,
`New.CMLattice.monomialSection_mem`, `New.CMLattice.sections_zero_le_const`,
`New.CMLattice.deriv_twistedTranslate_theta_comp_mul_ne_zero`, `New.CMLattice.exists_mul_eq_of_mem_sections`,
`New.CMLattice.spanningExponents`, `New.CMLattice.sections_le_span_monomialSection`),
`Lib/CM/Integrality/IntegralSections.lean` (`New.CMLattice.exists_eq_theta_pow_mul_eval`,
`New.CMLattice.exists_eq_theta_pow_mul_eval_of_even`)

## Layer 2: CM lattices, ideals and isogenies

From here on `d` is a prime with `d ≡ 7 (mod 8)` and `K = ℚ(√−d)`. The lattices of CM lattices are the multiples of
the fractional ideals of `K`, one scaling up to fourth roots of unity for each ideal (2.1). The hypothesis on `d`
makes the multiplier of `θ` the canonical one, `(−1)^{n(l)}`, so that sections pull back along isogenies (2.2). The
scaling `℘″(t) = 2` at the distinguished point of order two makes the discriminant of the cubic a unit at every prime
(2.3). There are finitely many lattices, which bounds the values of `θ` uniformly (2.4).

### 2.1 CM lattices as multiples of ideals

*Origin:* adapted from the classical correspondence between the lattices with multiplication by `𝒪_K` and the ideal
classes (Silverman (1994), Chapter II §1) and from Gauss's genus theory (the class number of `ℚ(√−d)` is odd for a
prime `d ≡ 3 (mod 4)`; Cox (1989), §§3 and 6): here, with the point `t` and the scaling.

*Method of the formal proof:* a lattice stable under `𝒪_K` is `u𝔞`: divide by a nonzero element. For (b), since `2`
splits, the points of order two of `ℂ/Λ` are `t`, `β_Kt`, `β̄_Kt` for exactly one class `t`, the one killed by neither
prime above `2`; 1.2 (c) scales it. The area is the covolume of an ideal. For (c) the formal proof shows directly,
from the fact that only `d` ramifies in `K`, that the class group has no element of order two, without genus theory.
For (d), `c` maps the points killed by `β_K` to points killed by `β_K`, and `℘″` is homogeneous of degree `−4`.

Let `d` be a prime `≡ 7 (mod 8)`.
(a) The lattice of every CM lattice is `u𝔞` for some `u ∈ ℂ^×` and a nonzero fractional ideal `𝔞` of `K`, and its
area is then `|u|²·N(𝔞)·√d/2`.
(b) For every nonzero fractional ideal `𝔞` of `K` there are a CM lattice and `u ∈ ℂ^×` with lattice `u𝔞`. In every
lattice `Λ` stable under `𝒪_K` there is, modulo `Λ`, exactly one point `t` with `2t ∈ Λ` and `t, β_Kt, β̄_Kt ∉ Λ`.
(c) Squaring is a bijection of the class group of `K`. Hence the lattice of every CM lattice is `w𝔠²` for some
`w ∈ ℂ^×` and a nonzero ideal `𝔠` of `𝒪_K`.
(d) If `C`, `D` are CM lattices and `c ≠ 0` satisfies `cΛ_C = Λ_D`, then `c·t_C − t_D ∈ Λ_D` and `c⁴ = 1`.

**Check.** For `d = 7` the class number is `1` and `Λ = u𝒪_K`; the three classes of order two are those of `u/2`,
`uβ_K/2`, `uβ̄_K/2`, and `t ≡ u/2`, since `β_K·(uβ̄_K/2) = u ∈ Λ` and `β̄_K·(uβ_K/2) = u ∈ Λ` while
`β_K·u/2 ∉ Λ`.

*Needs:* 1.2; Mathlib (`ClassGroup`, `FractionalIdeal`, `NumberField.RingOfIntegers`); Tau Ceti
(`TauCeti.NumberField.absNorm_mul_sqrt_abs_discr_of_image_eq`, the covolume of an ideal lattice of an imaginary
quadratic field).

[ShortProof], `Lib/CM/GoodReduction.lean` (`New.CMLattice.latticeModule`, `New.QuadField.scaledIdeal`,
`New.CMLattice.exists_latticeModule_eq_scaledIdeal`, `New.QuadField.exists_cmLattice_latticeModule_eq_scaledIdeal`,
`New.QuadField.area_eq_of_eq_scaledIdeal`), `Lib/CM/ChowlaSelberg.lean` (`New.QuadField.classGroup_sq_bijective`,
`New.CMLattice.exists_latticeModule_eq_scaledIdeal_sq`), `Lib/CM/FiniteLattices.lean`
(`New.CMLattice.mul_t_sub_t_mem`, `New.CMLattice.pow_four_eq_one_of_mul_mem_iff`)

### 2.2 Sections under isogenies

*Origin:* adapted from the classical behaviour of theta functions under isogenies (Mumford (1970), Chapter I): here, for
the sections of CM lattices, where the hypothesis `d ≡ 7 (mod 8)` identifies the multiplier of `θ`.

*Method of the formal proof:* (a) is a computation with the areas. For (b), the cocycle rule applied to
`l = β_Kl + β̄_Kl` gives `χ(l) = exp(πi·E(β̄_Kl, l))`, because `χ` is `1` on `β_KΛ` and on `β̄_KΛ` (this is where
the conditions `β_Kt, β̄_Kt ∉ Λ` and `d ≡ 7 (mod 8)` enter), and `E(β̄_Kl, l) = |l|²√d/(2A)`. (c) follows from (a),
(b), and (d) from (c) and the commutation in (a).

(a) Let `Λ`, `Λ′` be lattices and `z ↦ az` an isogeny of degree `N` from `Λ` to `Λ′`. Then `H′(au, av) = N·H(u, v)`,
and for every `n`, function `F` and `u ∈ ℂ`: `T^{nN}_u(F(a·)) = (T′^n_{au}F)(a·)`.
(b) Let `C` be a CM lattice and `l ∈ Λ`. Then `n(l) := |l|²·√d/(2A)` is an integer and `χ(l) = (−1)^{n(l)}`, that is
`T^1_lθ = (−1)^{n(l)}·θ`.
(c) Let `C`, `C′` be CM lattices and `z ↦ az` an isogeny of degree `N` from `C` to `C′`. Then `χ′(al) = χ(l)^N` for
`l ∈ Λ`, and if `F` is a section of degree `k` of `C′`, then `z ↦ F(az)` is a section of degree `kN` of `C`.
(d) Let `C` be a CM lattice, `δ ∈ ℂ` such that `z ↦ δ̄z` is an isogeny of degree `N` from `C` to itself, and `u ∈ ℂ`
with `δu ∈ Λ`. Then `z ↦ (T^1_uθ)(δ̄z)` is a section of degree `N` of `C`. For `α ∈ 𝒪_K`, `z ↦ αz` is an isogeny of
degree `αᾱ` from `C` to itself.

**Check.** For `Λ = u𝒪_K` and `l = uλ`: `A = |u|²√d/2` by 2.1 (a), so `n(l) = λλ̄`, and (b) says
`χ(uλ) = (−1)^{N(λ)}`: the semicharacter `(−1)^{N(·)}` of ThetaChainsOnDefiniteUnitaryGroups §3.1c. For
`d ≡ 3 (mod 8)` the prime `2` is inert and `N(λ)` is odd for every `λ ∉ 2𝒪_K`, so that `(−1)^{N(·)}` is `ε`, the
multiplier of `σ` itself, and not the multiplier of the translate of `σ` by any point of order two: (b) fails there
for every choice of `t`.

*Needs:* 1.3, 1.5, 2.1.

[ShortProof], `Lib/CM/Sigma/Basic.lean` (`PeriodPair.IsIsogeny`, `New.exists_isIsogeny_of_mul_mem_lattice`),
`Lib/CM/Sigma/ThetaSections.lean` (`New.CMLattice.hermitianForm_mul_of_isIsogeny`,
`New.CMLattice.twistedTranslate_comp_isogeny`, `New.CMLattice.multiplier_eq_canonicalMultiplier`,
`New.CMLattice.exists_int_twistedTranslate_theta_eq_neg_one_zpow`, `New.CMLattice.multiplier_mul_of_isIsogeny`,
`New.CMLattice.comp_mul_mem_sections`, `New.CMLattice.twistedTranslate_comp_mem`)

### 2.3 The discriminant is a unit

*Origin:* adapted from the theory of Weber's class invariants and of Siegel units (Birch (1969); Kubert and Lang
(1981), Chapter 2: the twelfth power of Klein's form at a torsion point, times the discriminant, is an algebraic
integer, and a unit if two different primes divide the annihilator of the point): here, at the point `t`, whose
annihilator is `(2) = 𝔭𝔭̄`, where the number is the discriminant of the lattice scaled by `℘″(t) = 2`.

*Method of the formal proof:* for a lattice `L` and a point `u` of order two put
`s_L(u) := 288℘(u)²/℘″(u) − 64`, the discriminant of `L` after the scaling that makes `℘″(u) = 2`. The three numbers
`s_L(u)` have the sum `−48` and the product `−2¹²`, and for the isogeny of degree two with kernel `u₁`,
`s_L(u₁)·s_{L′}(cu₂) = 2¹²`. Take a CM lattice in each ideal class. The isogenies with kernels `β_Kt`, `β̄_Kt` permute
the classes (multiplication by the classes of the primes above `2`), so along a cycle the numbers at the points
`β_Kt`, `β̄_Kt` are integral at `p` (an elementary lemma on cyclic families with `s·s′ = 2¹²` and
`s + s′ + s₀ = −48`), hence so are the numbers `s(t) = −48 − s(β_Kt) − s(β̄_Kt)`; their product over the classes is
`±1`, so each is a unit.

Let `C` be a CM lattice for a prime `d ≡ 7 (mod 8)`, `p` a prime and `ι : ℂ → ℂ_p` a ring homomorphism. Then
`‖ι(a₁)⁴ − 64‖ = 1` and `‖ι(a₁)‖ ≤ 1`.

**Checks.** For `d = 7`: the cubic `y² + a₁xy = x³ + x` has `j = (a₁⁴ − 48)³/(a₁⁴ − 64)`, and `j = −3375` forces
`a₁⁴ − 64 ∈ {−1, (−47 ± 45√−7)/2}`; the value at `t` is `−1`, so `a₁⁴ = 63`, and the other two, of norm `2¹²`, belong to
the points `β_Kt`, `β̄_Kt`, which are killed by a prime above `2`: the condition on `t` in the definition of a CM
lattice is needed. The three values have the sum `−48` and the product `−2¹²`. If `‖ι(a₁)‖ > 1`, then
`‖ι(a₁)⁴ − 64‖ = ‖ι(a₁)‖⁴ > 1`; so the second statement follows from the first.

*Needs:* 1.2, 2.1; Mathlib (`ClassGroup`, finite).

*Relation to the library.* ComplexMultiplicationAndExplicitReciprocity §4.3 and LocalGainOfThetaChains §4.9a use the
good reduction of the canonical CM curve over the Hilbert class field at the primes not dividing `d`; the statement
here is for the model fixed by `t`, at every prime, including `d` and `2`.

[ShortProof], `Lib/CM/GoodReduction.lean` (`PeriodPair.IsOrderTwo`, `PeriodPair.scaledDisc`,
`PeriodPair.IsOrderTwo.scaledDisc_sum_prod`, `PeriodPair.IsOrderTwo.scaledDisc_mul_of_isogeny`,
`New.CMLattice.IsInClass`, `New.CMLattice.exists_forall_isInClass`, `New.CMLattice.norm_scaledDisc_le_one`,
`New.CMLattice.prod_scaledDisc_t`, `New.CMLattice.norm_disc_eq_one`), `Lib/CM/Integrality/TorsionValues.lean`
(`New.CMLattice.norm_a₁_le_one`)

### 2.4 Finitely many lattices, and a bound for the values of `θ`

*Origin:* particular to this proof: a bound for `|(T^1_uθ)(0)|` that depends only on `d`. The finiteness is the
finiteness of the class group with 2.1 (d).

*Method of the formal proof:* by 2.1 every CM lattice is `c` times one of finitely many, with `c⁴ = 1`. The function
`θ` is determined by the lattice, since the sections of degree one are a line (1.5 (b)) and `θ(0) = 1`, the point `t`
being determined modulo `Λ` (2.1 (b)). For one lattice `|(T^1_uθ)(0)|` is continuous and `Λ`-periodic in `u`.

Let `d` be a prime `≡ 7 (mod 8)`.
(a) Only finitely many subgroups of `ℂ` are the lattice of a CM lattice for `d`.
(b) Two CM lattices with the same lattice have the same area and the same function `θ`.
(c) There is `M = M(d)` such that `|(T^1_uθ)(0)| = exp(−π|u|²/(2A))·|θ(u)| ≤ M` for every CM lattice for `d` and
every `u ∈ ℂ`.

*Needs:* 1.3, 1.5 (b), 2.1; Mathlib (the class group of a number field is finite).

*Relation to the library.* GluedTargetAndDivisionInequality §8.3 bounds a theta function pointwise by its `L²`
norm; (c) is a bound uniform over the lattices for `d`, with no norm on the right.

[ShortProof], `Lib/CM/FiniteLattices.lean` (`New.CMLattice.finite_range_latticeModule`,
`New.CMLattice.area_eq_of_latticeModule_eq`, `New.CMLattice.theta_eq_of_latticeModule_eq`,
`New.CMLattice.exists_norm_twistedTranslate_theta_le`)

## Layer 3: Integral sections

In this layer `C` is a CM lattice for a prime `d ≡ 7 (mod 8)`, `p` is any prime and `ι_p` any embedding. The ring
`𝒪[[y]]` (3.1) is where the Taylor series live. The values of sections at torsion points, with the exponential factor
of the degree (3.2), are integral for the monomials (3.3), and conversely a section with integral values is an
integral combination of monomials (3.4); applied to pull-backs along isogenies this gives the integrality of
isogenies on Taylor series (3.5).

### 3.1 The ring `𝒪[[y]]`

*Origin:* adapted from the theory of the formal group of a Weierstrass curve (Silverman (1986), Chapter IV §1): here
in the parameter `y` at the point `(0, 0)` of the cubic `y² + a₁xy = x³ + x`, over the valuation ring of `ℂ_p`.

*Method of the formal proof:* the statements on rings `𝒪[[S]]` are formal (substitution, inverse series). For (b),
`x` is the root without constant term of `X³ + X − a₁yX − y² = 0` over `𝒪[[y]]`, which exists by Hensel's lemma
because the derivative `3X² + 1 − a₁y` is a unit at `X = 0` (`a₁` is integral by 2.3); (c) follows from
`y′ = 1 + 3x² − a₁y`.

For a series `S = z + O(z²)` over `ℂ_p`, let `𝒪[[S]]` be the ring of the series `F(S)` with `F` integral.
(a) `𝒪[[S]]` is a subring of `ℂ_p[[z]]`, closed under multiplication by elements of `𝒪` and closed for the topology
of coefficientwise convergence; `F ↦ F(S)` is injective; an element whose constant term has norm `1` is a unit of
`𝒪[[S]]`; every `S′ = z + O(z²)` in `𝒪[[S]]` satisfies `𝒪[[S′]] = 𝒪[[S]]`; the constant term and the coefficient of
`z` of an element of `𝒪[[S]]` are integral; and if `S(az) ∈ 𝒪[[S]]` for some `a ∈ ℂ_p`, then `F(az) ∈ 𝒪[[S]]` for
every `F ∈ 𝒪[[S]]`.
(b) Let `C` be a CM lattice and `y` the Taylor series of its function `y`, read in `ℂ_p`; `𝒪[[y]]` is the ring of (a)
for `S = y`. Then `x ∈ 𝒪[[y]]`, with `x = y² + O(y³)`.
(c) `𝒪[[y]]` is stable under `d/dz`; in particular `y′ ∈ 𝒪[[y]]`, a unit of that ring.

**Check.** `𝒪[[y]]` is not the ring of integral series in `z`: by 4.6 (Check) the coefficient of `z^{q_p}` in `y` is
not integral, so `z ∉ 𝒪[[y]]`. In (b) the series of `x` is the solution of the cubic for `x` in terms of
`y`: `x = y² + a₁y³ + O(y⁴)`.

*Needs:* 1.3 (c), 2.3; Mathlib (`PowerSeries.subst`, `PowerSeries.derivative`).

[ShortProof], `Lib/CM/FormalGroup/IntegralParameter.lean` (`New.IsSeriesGenerator`,
`New.IsSeriesGenerator.smul_mem`, `New.IsSeriesGenerator.subst_injective`, `New.IsSeriesGenerator.exists_mul_eq_one`,
`New.IsSeriesGenerator.of_mem`, `New.IsSeriesGenerator.norm_constantCoeff_le_one_and_norm_coeff_one_le_one`,
`New.IsSeriesGenerator.rescale_mem`, `New.CMLattice.integralSeriesRing`,
`New.CMLattice.isSeriesGenerator_translatedY`, `New.CMLattice.taylorVia_translatedX_mem_integralSeriesRing`,
`New.CMLattice.derivative_mem_integralSeriesRing`), `Lib/CM/Integrality/LogTheta.lean`
(`New.IsSeriesGenerator.isClosed`), `Lib/CM/FormalGroup/InseparableDegree.lean`
(`New.CMLattice.reducedOrder_translatedX`)

### 3.2 Torsion values

*Origin:* definitions and conventions, with elementary rules.

*Method of the formal proof:* computations with the exponential factors; in (c) the factor is a root of unity because
`E` is rational on `ℚΛ`.

Let `Λ` be a lattice. For a function `F`, a degree `n ≥ 0` and `u ∈ ℂ`, the *value of `F` at `u` in degree `n`* is
`F[u]_n := (T^n_uF)(0) = F(u)·exp(−nπ|u|²/(2A))`; at a torsion point `u` it is a *torsion value*. For a prime `p` and
`ι_p`, `F` *has integral torsion values in degree `n`* if `ι_p(F[u]_n) ∈ 𝒪` for every torsion point `u`.
(a) `(FF′)[u]_{m+n} = F[u]_m·F′[u]_n` and `(F^k)[u]_{kn} = (F[u]_n)^k`.
(b) If `z ↦ az` is an isogeny of degree `N` from `Λ` to `Λ′`, then `a` maps torsion points to torsion points and
`(F(a·))[u]_{nN} = F[au]_n`, the right side formed for `Λ′`.
(c) `(T^n_vF)[u]_n = F[u + v]_n·exp(−nπi·Im(uv̄)/A)`, and for torsion points `u`, `v` the last factor is a root of
unity.
(d) Hence integral torsion values are inherited by products (the degrees add), by powers, by pull-backs along
isogenies (the degree is multiplied by `N`) and by the twisted translates `T^n_v` by torsion points `v`.

*Needs:* the Conventions; 2.2 (a).

[ShortProof], `Lib/CM/Integrality/TorsionValues.lean` (`New.CMLattice.IsTorsion`, `New.CMLattice.torsionValue`,
`New.CMLattice.torsionValue_eq`, `New.CMLattice.torsionValue_mul`, `New.CMLattice.torsionValue_pow`,
`New.CMLattice.torsionValue_comp_isogeny`, `New.CMLattice.torsionValue_twistedTranslate`,
`New.CMLattice.norm_torsionValue_twistedTranslate`, `New.CMLattice.HasIntegralValues`,
`New.CMLattice.HasIntegralValues.mul`, `New.CMLattice.HasIntegralValues.pow`,
`New.CMLattice.HasIntegralValues.comp_isogeny`, `New.CMLattice.HasIntegralValues.translate`)

### 3.3 The torsion values of `σ`, `θ` and the monomials

*Origin:* adapted from the integrality of Siegel functions at torsion points (Kubert and Lang (1981), Chapter 2):
here for the pair `(θ, σ)` of a CM lattice, at every prime, by duplication.

*Method of the formal proof:* by 1.4 (d) and 3.2 the pair `w(u) := (θ[u]_1², σ[u]_1²)`, read in `ℂ_p`, satisfies
`w(2u) = D(w(u))` for the pair of binary quartic forms
`D(a, b) = ((a² − b²)², ab·(4a² + a₁²ab + 4b²))`. Because `a₁` is integral and `a₁⁴ − 64` is a unit (2.3), the two
forms have no common zero over the residue field of `𝒪`, so `‖D(w)‖ = ‖w‖⁴` for the maximum norm. For a torsion
point `u` there are `i ≠ j` with `2^ju ≡ 2^iu` modulo `Λ`, and `‖w‖` is unchanged by translation by `Λ`; so
`‖w(u)‖^{4^j} = ‖w(u)‖^{4^i}`, and `‖w(u)‖ = 1` since `w(u) ≠ 0`. For `G`, the relation
`G² + a₁σ²θG = σ⁶ + σ²θ⁴` (1.3 (d)) at torsion values is a monic equation with integral coefficients.

Let `C` be a CM lattice, `p` a prime and `ι_p` an embedding.
(a) For every torsion point `u`: `max(‖ι_p(σ[u]_1)‖, ‖ι_p(θ[u]_1)‖) = 1`.
(b) `σ` and `θ` have integral torsion values in degree `1`, and `G` in degree `3`; the monomial of `(a, b, c)` has
integral torsion values in degree `a + 2b + 3c`.

*Needs:* 1.3 (d), 1.4 (d), 2.2, 2.3, 3.2.

*Relation to the library.* ThetaChainsOnDefiniteUnitaryGroups §3.1c (b) states that the value of a translate of the
reduced theta function at `0` is a unit for torsion points outside the formal group, at the primes `p ≠ d`; (a) is at
every prime and for every torsion point, as a statement about the pair.

[ShortProof], `Lib/CM/Integrality/TorsionValues.lean` (`New.CMLattice.squarePair`,
`New.CMLattice.squarePair_two_mul`, `New.CMLattice.norm_squarePair`, `New.CMLattice.max_norm_torsionValue`,
`New.CMLattice.hasIntegralValues_sigma`, `New.CMLattice.hasIntegralValues_theta`,
`New.CMLattice.hasIntegralValues_translatedYThetaCube`, `New.CMLattice.hasIntegralValues_monomialSection`),
`Lib/CM/Integrality/Doubling.lean` (`New.doublingForms`, `New.norm_doublingForms`)

### 3.4 Sections with integral torsion values

*Origin:* adapted from the integral expansions of theta functions of CM elliptic curves (Bannai and Kobayashi
(2010), after Norman and Mazur–Tate, at ordinary primes `p ≥ 5`): here at every prime, for `d` a prime
`≡ 7 (mod 8)`, as a converse of 3.3 (b).

*Method of the formal proof:* write the section as `θ^m·(P₀(x) + yP₁(x))` (1.5 (d)) and interpolate at the points
`t_i := t/2^i`, `i ≥ 1`: the torsion values `θ[t_i]_1` are units (the pair `w(t_i)` does not reduce to `w(t) = (0, 1)`),
the numbers `x(t_i)` are integral with `x(t_i) − x(t_j)` a unit for `i ≠ j`, and `x′(t_i)` is a unit, so the values at
the points `±t_i` determine the coefficients of `P₀` and `P₁` integrally, by Lagrange interpolation. (c) follows
with `x ∈ 𝒪[[y]]` (3.1).

Let `C` be a CM lattice, `p` a prime, `ι_p` an embedding, and `F` a section of degree `m` with integral torsion
values in degree `m`.
(a) `F` is a combination of the monomials of degree `m` with `c ≤ 1`, with `p`-integral coefficients. Equivalently, the
polynomials `P₀`, `P₁` of 1.5 (d) have `p`-integral coefficients.
(b) If `F` is even, there is a polynomial `R` over `ℂ` with `p`-integral coefficients and `2·deg R ≤ m` such that
`F = Σ_{i ≤ m/2} R_i·θ^{m−2i}(σ²)^i` everywhere; so `F = θ^m·R(x)` off `t + Λ` and as Taylor series.
(c) The Taylor series of `F`, read in `ℂ_p`, is `θ^m·U` for some `U ∈ 𝒪[[y]]`.

*Needs:* 1.5, 3.1, 3.2, 3.3.

*Relation to the library.* NonordinaryCMSpecialValues §4.2 compares integral theta functions with integral sections of
a line bundle on a curve with good reduction at one place; LocalGainOfThetaChains §4.9a (Θ2) states the integrality of
`exp(φ)·U_sθ₀` at an inert prime for torsion points of order prime to `p`. (a) to (c) have no restriction on the prime
or on the orders.

[ShortProof], `Lib/CM/Integrality/IntegralSections.lean` (`New.CMLattice.halvingPoint`,
`New.CMLattice.norm_torsionValue_theta_halvingPoint`, `New.CMLattice.norm_coeff_le_one_of_hasIntegralValues`,
`New.CMLattice.mem_span_monomialSection`, `New.CMLattice.IsIntegralEvenExpansion`,
`New.CMLattice.exists_polynomial_of_even`, `New.CMLattice.exists_taylorVia_eq_theta_pow_mul`)

### 3.5 Isogenies and translates on Taylor series

*Origin:* adapted from the fact that an isogeny of elliptic curves with good reduction acts on the formal groups by
an integral power series (Silverman (1986), Chapters IV and VII): here for CM lattices in the parameter `y`, with the
statement for `θ` and its translates.

*Method of the formal proof:* (a) is 3.4 (c) for the section `F′(az)` (2.2 (c)), whose torsion values are integral by
3.2 (d). (b): `θ′(az)` is (a) for `F′ = θ′`, and `y′(az) = G′(az)/θ′(az)³` is a quotient of two elements of
`θ^{3N}·𝒪[[y]]`, the denominator with a unit cofactor. (c): `y′(az) = ι_p(a)·y + ⋯` lies in `𝒪[[y]]`, whose elements
have integral coefficient of `z` (3.1 (a)). (d) is (a) for the section of 2.2 (d).

Let `C`, `C′` be CM lattices, `p` a prime and `ι_p` an embedding; Taylor series are read in `ℂ_p`.
(a) If `z ↦ az` is an isogeny of degree `N` from `C` to `C′` and `F′` is a section of degree `n` of `C′` with integral
torsion values in degree `n`, then `F′(az) = θ^{Nn}·U` for some `U ∈ 𝒪[[y]]`.
(b) If `z ↦ az` is an isogeny of degree `N` from `C` to `C′`, then `y′(az) ∈ 𝒪[[y]]` and `θ′(az) = θ^N·U` for some
`U ∈ 𝒪[[y]]` (here `y′`, `θ′` are the functions of `C′`, not derivatives).
(c) If `aΛ ⊂ Λ′`, then `a` is `p`-integral.
(d) If `δ ≠ 0`, `z ↦ δ̄z` is an isogeny of degree `N` from `C` to itself and `δv ∈ Λ`, then
`(T^1_vθ)(δ̄z) = θ(z)^N·U` for some `U ∈ 𝒪[[y]]`.
(e) For `α ∈ 𝒪_K` with `αᾱ = ν`: `y(αz) ∈ 𝒪[[y]]` and `θ(αz) = θ(z)^ν·U` with `U ∈ 𝒪[[y]]`, `U(0) = 1`.

*Needs:* 2.2, 3.1, 3.2, 3.3, 3.4.

*Relation to the library.* LocalGainOfThetaChains §4.9a (Θ3) is the norm relation of (e) for units `α` of `𝒪_{K,p}` at
an inert `p ≥ 5`, in the Lubin–Tate parameter.

[ShortProof], `Lib/CM/Integrality/IsogenyIntegrality.lean` (`New.CMLattice.exists_rescale_eq_theta_pow_mul`,
`New.CMLattice.exists_rescale_theta_eq_theta_pow_mul`, `New.CMLattice.rescale_translatedY_mem_integralSeriesRing`,
`New.CMLattice.norm_le_one_of_mapsTo_lattice`, `New.CMLattice.exists_rescale_twistedTranslate_eq_theta_pow_mul`),
`Lib/CM/FormalGroup/InseparableDegree.lean` (`New.CMLattice.rescale_translatedY_mem_of_mem_quadInt`,
`New.CMLattice.exists_rescale_theta_eq_pow_mul_of_mem_quadInt`)

## Layer 4: The formal group and the formal parameter

In this layer `C` is a CM lattice for a prime `d ≡ 7 (mod 8)`, `p` any prime and `ι_p` any embedding, and series are
read in `ℂ_p`. The series `g = −log θ` is not integral, but its defect under multiplication by `α ∈ 𝒪_K` is (4.1);
the group law is integral in `y` (4.2); two lemmas on power series (4.3) and a bound for the height of the formal
group (4.4) give a parameter `T` of the formal group with `T(ζz) = ζT(z)` for `ζ^{q_p−1} = 1` (4.5), which after a
scaling is congruent to `Σ_j z^{q_p^j}` (4.6).

### 4.1 The logarithm of `θ` in `𝒪[[y]]`

*Origin:* particular to this proof in this form: `θ(αz)/θ(z)^{αᾱ} ∈ 𝒪[[y]]` for `α ∈ 𝒪_K`, extended by continuity to
the `p`-adic limits of the pairs `(α, αᾱ)`, and the integrality of `√−d·g″(0)`. The integrality of the second
logarithmic derivative of a theta function with complex multiplication, by comparing quasi-periods, is classical.

*Method of the formal proof:* (a) is 3.5 (e) written with `g`. (b) holds because `𝒪[[y]]` is closed (3.1 (a)) and
`(δ, s) ↦ y(δz)`, `exp(s·g − g(δz))` are continuous coefficientwise. (c): by approximation of `ζ` by integers of
`K`, whose conjugates are congruent to their `p`-th powers at an inert prime. (d): the
coefficient of `z²` of the series in (a) is `α(ᾱ − α)·g″(0)/2`, and an element of `𝒪[[y]]`, `y = z + O(z²)`, with
vanishing coefficient of `z` has integral coefficient of `z²`; take `α = β_K`, for which `α(ᾱ − α) = −β_K√−d`, and
`α = β̄_K`, and use `β_K + β̄_K = 1`.

Let `C` be a CM lattice and `g = −log θ` (1.4), read in `ℂ_p`.
(a) For `α ∈ 𝒪_K`: `exp(αᾱ·g(z) − g(αz)) = θ(αz)/θ(z)^{αᾱ} ∈ 𝒪[[y]]`.
(b) Let `𝒩_p ⊂ ℂ_p × ℂ_p` be the closure of the set of pairs `(ι_p(α), ι_p(αᾱ))`, `α ∈ 𝒪_K`. For `(δ, s) ∈ 𝒩_p`:
`y(δz) ∈ 𝒪[[y]]` and `exp(s·g(z) − g(δz)) ∈ 𝒪[[y]]`.
(c) If `ζ ∈ ℂ_p` has `‖ζ‖ = 1` and `ζ^{q_p} = ζ` (`q_p` of 4.4), then `(ζ, ζ^{p+1}) ∈ 𝒩_p`.
(d) `ι_p(α(ᾱ − α))·g″(0)/2 ∈ 𝒪` for every `α ∈ 𝒪_K`, and `ι_p(√−d)·g″(0) ∈ 𝒪`.

**Check.** In (d) the factor `√−d` is needed at `p = d`: for `d = 7`, by the Check of
ThetaChainsOnDefiniteUnitaryGroups §3.1c (where the lattice is scaled to discriminant `1`, which changes `g″(0)` by a
root of unity, the discriminant here being `−1`), `g″(0) = −θ″(0)` is `2/√−7` up to a root of unity: of valuation
`−1/2` at `7`, and integral at `2` although neither `s₂` nor `a₁²/12` is.

*Needs:* 1.4, 3.1, 3.5; MatricesOverValuationRingsAndElementaryInputs §6.1 (b) (`exp(S + S′) = exp(S)·exp(S′)`).

*Relation to the library.* ThetaChainsOnDefiniteUnitaryGroups §3.1c (a) states `s₂ + b₂/12 ∈ 𝒪` at the primes `p ≠ d`
other than `3` (and at `3` when it splits) and `√−d·s₂ ∈ 𝒪` at `p = d`, for a Weierstrass model of unit discriminant;
(d) is the form for every CM lattice in the normalisation of 1.2, with one statement at all primes.

[ShortProof], `Lib/CM/Integrality/LogTheta.lean` (`New.CMLattice.expSubst_sub_rescale_mem_of_mem_quadInt`,
`New.CMLattice.rescale_translatedY_mem_of_mem_normPairClosure`, `New.CMLattice.expSubst_sub_rescale_mem`,
`New.CMLattice.mul_coeff_two_negLogTheta_mem_valRingCp`,
`New.CMLattice.norm_sqrt_mul_coeff_two_negLogTheta_le_one`), `Lib/General/NumberTheory/PadicLimitsValuation.lean`
(`New.normPairClosure`, `New.mem_normPairClosure_of_pow_eq`)

### 4.2 Several variables and the group law

*Origin:* adapted from the integrality of the formal group law of a Weierstrass curve (Silverman (1986), Chapter IV
§§1, 2): here for the cubic of a CM lattice in the parameter `y` at the point `(0, 0)`.

*Method of the formal proof:* Euler's addition formula expresses `y(z₀ + z₁)` rationally in `x(z_i)`, `y(z_i)` with a
denominator that is a unit of `𝒪[[y(z₀), y(z₁)]]`; the identity of power series is checked by differentiating in
`z₀ − z₁` and comparing at `z₁ = 0`.

Let `C` be a CM lattice. For a finite family of linear forms `μ_i(z) = Σ_x μ_{i,x}z_x` over `ℂ_p` in finitely many
variables, `𝒪[[y(μz)]]` is the ring of the series `F(y(μ_1z), …, y(μ_kz))` with `F` an integral power series in `k`
variables.
(a) `𝒪[[y(μz)]]` is a subring of the power series in the `z_x`, closed under multiplication by elements of `𝒪`; an
element whose constant term has norm `1` is a unit of it; and `U(μ_iz) ∈ 𝒪[[y(μz)]]` for `U ∈ 𝒪[[y]]`.
(b) *The group law is integral:* `y(z₀ + z₁) ∈ 𝒪[[y(z₀), y(z₁)]]`.

*Needs:* 1.3 (c), 3.1; Mathlib (`MvPowerSeries.subst`).

*Relation to the library.* EllipticCurves Layer 1 has the formal group law of a Weierstrass curve at its origin in
the parameter `−x/y`; (b) is at the point `(0, 0)` of order two in the parameter `y`, for series in `z`.

[ShortProof], `Lib/CM/Integrality/LogTheta.lean` (`New.CMLattice.multiSeriesRing`,
`New.CMLattice.mem_multiSeriesRing_iff`, `New.CMLattice.smul_mem_multiSeriesRing`,
`New.CMLattice.exists_mul_eq_one_of_mem_multiSeriesRing`, `New.CMLattice.subst_mem_multiSeriesRing`,
`New.eulerAddition`, `New.CMLattice.translatedY_add_mem_multiSeriesRing`)

### 4.3 Two lemmas on power series

*Origin:* elementary; (b) is the extraction of roots of order prime to `p` in a ring of integral series.

*Method of the formal proof:* (a) is orthogonality of the characters of `ℤ/m`. For (b), the series `b` with
`b(0) = 1` and `b^m = 1 + z` is integral because `m` is a unit of `𝒪`, and `exp(S) = b(exp(S)^m − 1)`.

(a) Let `k` be a field, `m ≥ 1`, `ζ ∈ k` a primitive `m`-th root of unity and `F ∈ k[[z]]`. The part of `F` in the
degrees `≡ r (mod m)` is `(1/m)·Σ_{i<m} ζ^{−ir}·F(ζ^iz)`. If `S` has no constant term and only degrees `≡ 1 (mod m)`,
then taking the part in the degrees `≡ r (mod m)` commutes with `F ↦ F(S)`.
(b) Let `S₀ = z + O(z²)` over `ℂ_p`, `m` prime to `p`, and `S` a series over `ℂ_p` without constant term. If
`exp(S)^m ∈ 𝒪[[S₀]]`, then `exp(S) ∈ 𝒪[[S₀]]`.

**Check.** In (a) the primitive root is needed: over `ℚ` with `m = 3` the part of `F` in the degrees `≡ 0 (mod 3)` is
not a mean of the series `F(ηz)`, `η³ = 1`, `η ∈ ℚ`. In (b), `m` prime to `p` is needed: `exp(z)^p = exp(pz)` is
integral in `z` for `p` odd, and `exp(z)` is not.

*Needs:* 1.4 (o), 3.1 (a); MatricesOverValuationRingsAndElementaryInputs §6.1; Mathlib (`IsPrimitiveRoot`).

[ShortProof], `Lib/CM/FormalGroup/IntegralParameter.lean` (`New.congruencePart`, `New.congruencePart_eq_sum`,
`New.congruencePart_subst`), `Lib/General/Algebra/SeriesBounds.lean` (`New.IsSeriesGenerator.expSubst_mem_of_pow_mem`);
[ShortProof] states (a) over `ℂ_p`

### 4.4 The numbers at a prime and the height of the formal group

*Origin:* the numbers are definitions and conventions. The bound is adapted from Deuring's criterion (the
inseparable degree of the reduction of an isogeny is at most its degree; Deuring (1941); Bluher (1998), 3.2 and 6.1):
here for the endomorphisms `α ∈ 𝒪_K` of a CM lattice, read off the expansion of `σ(αz)²`.

*Method of the formal proof:* `σ(αz)²` is an even section of degree `2ν` with integral torsion values, so by 3.4 (b)
it is `θ^{2ν}·R(x)` with `R` integral of degree at most `ν`; `R` has a unit coefficient, because the torsion value of
`σ²` at `t` is a unit and is attained at a point `t/α`; so `x(αz) = R(x)·(θ(z)^ν/θ(αz))²`, a unit of `𝒪[[y]]` times an
integral polynomial in `x = y² + ⋯` with a unit coefficient in a degree at most `ν`, has reduced order at most `2ν`,
while it is `2·o(α)`. For (d) at a split prime, take `α` with `αᾱ = p^h` and `ᾱ` a unit at `p` (a generator of the
`h`-th power of the prime of `K` induced by `ι_p`): `o(p)^h = o(α)·o(ᾱ) ≤ p^h`.

For a prime `p` put `π_p := √−d` if `p = d` and `π_p := p` otherwise; `q_p := p²` if `p` is inert in `K` and
`q_p := p` otherwise; and `ρ_p := v(ι_p(π_p))/(q_p − 1)`. For `F ∈ 𝒪[[y]]`, written `F = Φ(y)` with `Φ` integral, the
*reduced order* of `F` is the order of the reduction of `Φ` modulo the maximal ideal of `𝒪`; for `α ∈ 𝒪_K`,
`o(α)` is the reduced order of `y(αz)` (3.5 (e)).
(a) `π_p ∈ 𝒪_K`; `v(ι_p(π_p))` is `1/2` if `p = d` and `1` otherwise; `π_pπ̄_p = q_p` if `p` does not split in `K`;
`ρ_p` is `1/(p − 1)`, `1/(p² − 1)`, `1/(2p − 2)` for `p` split, inert, `p = d`; and `p` is prime to `q_p − 1`.
(b) `o(αβ) = o(α)·o(β)` for `α, β ∈ 𝒪_K`, and `o(α) = 1` if `α` is a unit at `p`.
(c) `o(α) ≤ αᾱ` for `0 ≠ α ∈ 𝒪_K`. More precisely `σ(αz)² = θ(z)^{2ν}·R(x)`, `ν = αᾱ`, for a polynomial `R` with
`p`-integral coefficients one of which, in a degree at most `ν`, is a unit at `p`.
(d) `o(π_p) ≤ q_p` for every prime `p`.

*Needs:* 2.2 (d), 3.1, 3.3, 3.4 (b), 3.5 (e); Mathlib (`legendreSym`).

*Relation to the library.* DivisibilityOfThetaDerivatives §2.1 writes the same numbers `π_p`, `q_p`, `ρ_p` and adds
`γ_p` and the sets of exponents, which are its own. NonordinaryCMSpecialValues §§3.4, 3.5 and
LubinTateFormalModulesAndQuasiCanonicalLifts §§4.3, 4.4 identify the formal group at an inert prime with a Lubin–Tate
module, for `p` prime to the class number in the first; (d) is only the bound for the height, at every prime and
with no such restriction.

[ShortProof], `Lib/General/NumberTheory/ImaginaryQuadraticField.lean` (`New.chiK`, `New.primeNorm`),
`Lib/CM/FormalGroup/PrimeNotation.lean` (`New.piPrime`, `New.piPrimeValuation`, `New.varpiValuation`,
`New.varpiValuation_of_split`, `New.varpiValuation_of_inert`, `New.varpiValuation_self`,
`New.coprime_primeNorm_sub_one`, `New.piPrime_mem_quadInt`, `New.piPrime_mul_conj`, `New.norm_piPrime`,
`New.exists_mul_conj_eq_pow`), `Lib/CM/FormalGroup/InseparableDegree.lean` (`New.CMLattice.reducedOrder`,
`New.CMLattice.insepDegree`, `New.CMLattice.insepDegree_mul`, `New.CMLattice.insepDegree_eq_one`,
`New.CMLattice.exists_rescale_sigma_sq_eq`, `New.CMLattice.insepDegree_le`,
`New.CMLattice.insepDegree_piPrime_le`)

### 4.5 The formal parameter

*Origin:* adapted from the theory of formal complex multiplication (Lubin and Tate (1965): multiplication by `π_p`
on the formal group of a curve with complex multiplication is an endomorphism with linear term `π_p` and reduction of
height given by `q_p`): here, a parameter on which the roots of unity of order `q_p − 1` act linearly, in the
normalisation of this roadmap and at every prime, including the split ones and `p = d`.

*Method of the formal proof:* by 4.3 (a), `T` is the mean of the series `ζ^{−1}y(ζz)` over `ζ^{q_p−1} = 1`, which
lie in `𝒪[[y]]` by 4.1 (b), (c); the mean is integral because `q_p − 1` is prime to `p`; so `T ∈ 𝒪[[y]]` and
`T = z + ⋯`, and 3.1 (a) gives (a). For (c), `T(π_pz) ∈ 𝒪[[y]] = 𝒪[[T]]` (3.5 (e)), and by 4.3 (a) it has only
degrees `≡ 1 (mod q_p − 1)` in `T`; the coefficient of `T^{q_p}` is a unit because otherwise the reduced order of
`y(π_pz)` would exceed `q_p`, against 4.4 (d) (the coefficient of `T` is `π_p`, not a unit).

Let `C` be a CM lattice and `p` a prime. The *formal parameter* `T` is the part of the series `y` in the degrees
`≡ 1 (mod q_p − 1)`.
(a) `T = z + O(z^{q_p})` and `𝒪[[T]] = 𝒪[[y]]`.
(b) Every element of `𝒪[[y]]` has integral coefficients in the degrees below `q_p`.
(c) `T(ι_p(π_p)z) = Φ(T)` for an integral series `Φ = π_pz + b₁z^{q_p} + Σ_{i≥2} b_iz^{1+i(q_p−1)}` with `b₁` a
unit of `𝒪`.

**Check.** For `p = 2` (which splits, `q_2 = 2`) the condition on the degrees is empty and `T = y`: (b) says only
that the constant term and the coefficient of `z` are integral.

*Needs:* 3.1, 3.5 (e), 4.1, 4.3 (a), 4.4.

[ShortProof], `Lib/CM/FormalGroup/FormalParameter.lean` (`New.CMLattice.rescale_translatedY_mem_of_pow_eq_one`,
`New.CMLattice.formalParam`, `New.CMLattice.isSeriesGenerator_formalParam`,
`New.CMLattice.mem_integralSeriesRing_iff_exists_subst_formalParam`, `New.CMLattice.norm_coeff_le_one_of_lt`,
`New.CMLattice.isUnit_coeff_primeNorm_of_rescale_formalParam_eq`,
`New.CMLattice.exists_rescale_piPrime_formalParam_eq`)

### 4.6 The scaled formal parameter

*Origin:* adapted from the functional equation of a Lubin–Tate series (Lubin and Tate (1965)): here, the scaling
`z ↦ ϖz` that brings the formal parameter to the form `Y − Y^{q_p} ≡ z`.

*Method of the formal proof:* with `Φ` of 4.5 (c), take `ϖ` with `ϖ^{q_p−1} = −π_p/b₁`. Then `Y := T(ϖz)/ϖ` satisfies
`Y(π_pz)/π_p = Y − Y^{q_p} + π_p·E(Y)` with `E` integral of order at least two; a series `Y = z + ⋯` with such a
functional equation is integral, by induction on the degree, and `Y − Y^{q_p} ≡ z` modulo `π_p`; in characteristic
`p`, `Y − Y^{q} = z` gives `Y = Σ_j z^{q^j}`. (b) follows since an element of `𝒪[[y]] = 𝒪[[T]]` at `ϖ₀z`,
`‖ϖ₀‖ = p^{−ρ_p}`, is an integral series in `ϖ₀Y`.

Let `C` be a CM lattice and `p` a prime.
(a) There are `ϖ ∈ ℂ_p` with `v(ϖ) = ρ_p` and an integral series `Y` with `T(ϖz) = ϖ·Y`, such that
`Y − Y^{q_p} ≡ z (mod π_p)` and `Y ≡ Σ_{j≥0} z^{q_p^j} (mod π_p)` (congruences of integral series, coefficient by
coefficient).
(b) If `F ∈ 𝒪[[y]]` and `ϖ ∈ ℂ_p` has `v(ϖ) ≥ ρ_p` (`ϖ = 0` included), then `F(ϖz)` is integral.

**Check.** (a) gives the valuation of the coefficient of `z^{q_p^j}` in `T`: it is `−(q_p^j − 1)·ρ_p`, so `T` and `y`
are not integral series in `z`, and the radius `p^{−ρ_p}` in (b) cannot be enlarged.

*Needs:* 4.4, 4.5.

*Relation to the library.* LubinTateFormalModulesAndQuasiCanonicalLifts §4.3 gives, at an inert prime and over
`W(𝔽_{p²})`, the logarithm `Σ_j (sp)^{−j}X^{q^j}`; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 has the numbers
`ρ_LT = 1/(p² − 1)`, `γ_LT = p/(p² − 1)` of that case. (a) is the congruence form used by the family, at every prime.

[ShortProof], `Lib/CM/FormalGroup/IntegralParameter.lean` (`New.exists_seriesToCp_eq_of_rescale_eq`,
`New.dvd_coeff_sub_of_C_dvd_sub_pow_sub_X`), `Lib/CM/FormalGroup/FormalParameter.lean`
(`New.CMLattice.exists_scaled_formalParam`, `New.CMLattice.rescale_mem_range_seriesToCp`)

## Layer 5: Conjugate lattices

In this layer `d` is a prime `≡ 7 (mod 8)` and `σ` denotes an automorphism of `ℂ` over `K`. The conjugate of a CM
lattice is the CM lattice with the conjugate `a₁` (5.1); it comes from the uniformisation theorem, not from a
reciprocity law. Sections are transported to the conjugate lattice, which gives the action of `σ` on the translates
of `θ` by one finite adele (5.2). Kronecker's limit formula, summed over the classes and over the conjugates, gives the
areas of the conjugate lattices up to the conjugates of one unit (5.3).

### 5.1 The conjugate of a CM lattice

*Origin:* adapted from the classical theory of the conjugates of an elliptic curve with complex multiplication
(Shimura (1971), Chapter 5; Silverman (1994), Chapter II §2): here for CM lattices, with the Taylor series of `θ`.

*Method of the formal proof:* the lattice `Λ′` with invariants `σ(g₂)`, `σ(g₃)` exists by the uniformisation theorem;
it has a point `t′` with `℘′(t′) = σ(℘(t))`, of order two, and the Taylor series of `x′`, `y′` are the conjugates of
those of `x`, `y`, because the coefficients of the latter are polynomials in `a₁` by the differential equations of
1.3 (c). For a section `F` of `C` of degree `m` one constructs a section of `C′` with Taylor series
`(θ′/σ(θ))^m·σ(F)` (first for the monomials); transporting the sections `F(az)` for `a = β_K`, `β̄_K` shows that `Λ′` is
stable under `𝒪_K` and that `t′` is not killed by `β_K`, `β̄_K`, and comparing `θ′(β_Kz)` with the transport of
`θ(β_Kz)` gives a functional equation for the series `θ′/σ(θ)` under `z ↦ β_Kz` which, since `|β_K| > 1`, forces it
to be `1`.

(a) For a CM lattice `C` and `σ` there is a CM lattice `C′` with `a₁(C′) = σ(a₁(C))`; its lattice and the class of
its point `t′` are determined by `σ(a₁(C))²` (1.2 (b)). One such CM lattice is chosen and written `σ(C)`, the
*conjugate* of `C`.
(b) Let `C`, `D` be CM lattices with `a₁(D) = σ(a₁(C))`. The Taylor series of `x_D`, `y_D`, `θ_D` and of every monomial
of `D` are the conjugates under `σ` of those of `C`.
(c) Let `C`, `D`, `C′`, `D′` be CM lattices with `a₁(C′) = σ(a₁(C))`, `a₁(D′) = σ(a₁(D))`. If `aΛ_C ⊂ Λ_D`, then
`σ(a)Λ_{C′} ⊂ Λ_{D′}`. If `Λ_D = u𝔞·Λ_C` for `u ∈ ℂ^×` and a nonzero fractional ideal `𝔞` of `K`, then
`Λ_{D′} = σ(u)𝔞·Λ_{C′}`.

**Check.** For `d = 7` (2.3, Check) `a₁⁴ = 63`: the four values of `a₁` give the lattices `c·Λ`, `c⁴ = 1`, and
`σ(a₁) = ±a₁` or `±i·a₁` according to the action of `σ` on `ℚ(a₁)`; so `σ(C)` can differ from `C` although the class
number is `1`.

*Needs:* 1.2, 1.3, 1.5, 2.1, 2.2; Tau Ceti (`PeriodPair.exists_g₂_g₃_eq`, the uniformisation theorem;
`PeriodPair.exists_weierstrassP_eq`).

*Relation to the library.* GluedTargetAndDivisionInequality §8.24e defines the conjugate lattice `Λ^ρ` by the
invariants `ρ(g₂)`, `ρ(g₃)` in the same way, for a lattice of discriminant `1`.

[ShortProof], `Lib/CM/Sigma/Basic.lean` (`New.exists_lattice_of_g₂_g₃`,
`PeriodPair.exists_weierstrassP_eq_of_cubic`), `Lib/CM/ConjugateCurve.lean`
(`New.thetaQuotient`, `New.map_taylorAtZero_translatedX_and_translatedY`, `New.taylorAtZero_monomialSection`,
`New.exists_conjugate_section`, `New.exists_conj_isogeny_sections`, `New.conj_isogeny_mul_mem_lattice`,
`New.CMLattice.exists_galConjugate_of_g₂_g₃`, `New.CMLattice.galConjugate`, `New.CMLattice.galConjugate_a₁`,
`New.CMLattice.thetaQuotient_eq_one`, `New.CMLattice.taylorAtZero_theta_eq_taylorVia`,
`New.CMLattice.taylorAtZero_monomialSection_eq_taylorVia`), `Lib/CM/ChowlaSelberg.lean`
(`New.CMLattice.scaledIdeal_map_mul_galConjugate_le`, `New.CMLattice.latticeModule_galConjugate_eq_mul`)

### 5.2 Complex multiplication for theta functions

*Origin:* adapted from the main theorem of complex multiplication for elliptic curves (Shimura (1971), Theorem 5.4;
Milne (2020), 9.17), without the reciprocity law: the finite adele is not identified with the Artin map and is not
shown to be a unit. The statement for the Taylor series of the translates of `θ` is particular to this proof.

*Method of the formal proof:* for a finite set `S ⊂ K` choose `n ≠ 0` with `nS ⊂ 𝒪_K`; transporting sections from
`σ(C)` to `C` by `σ^{−1}` (5.1) gives a period `v_S` of `σ(C)` such that the transport of `(T^1_{sv_S}θ_{σ(C)})(nz)`
vanishes at the zeros of `(T^1_{sΩ₀}θ_C)(nz)`, hence is a multiple of it (1.5 (e)), with factor `1` by comparing
values; so `σ` maps the series of `T^1_{sΩ₀}θ_C` to that of `T^1_{sv_S}θ_{σ(C)}` for `s ∈ S`. The numbers `v_S/Ω` lie
in a compact set of finite adeles and have a cluster point `β` along the finite sets `S`; the translate by `x′Ω`
depends only on `x′` modulo a lattice. The shape `Ω𝔠²/N(𝔠)` of the conjugate lattice is 2.1 (c).

Let `C` be a CM lattice with lattice `Ω₀𝒪_K`, `Ω₀ ∈ ℂ^×`, and `σ` an automorphism of `ℂ` over `K`. There are
`Ω ∈ ℂ^×`, a nonzero ideal `𝔠` of `𝒪_K` and a finite adele `β` of `K` such that:
(a) the lattice of `σ(C)` is `Ω·𝔠²/N(𝔠)`, that is `{Ω·a/N(𝔠) : a ∈ 𝔠²}`;
(b) its area is `|Ω|²·√d/2`;
(c) `eΩ` lies in the lattice of `σ(C)` for some integer `e ≥ 1`;
(d) for every `x ∈ K` there is a neighbourhood `U` of `βx` in the finite adeles of `K` such that for every `x′ ∈ K`
whose image lies in `U`, the conjugate under `σ` of the Taylor series of `T^1_{xΩ₀}θ_C` is the Taylor series of
`T^1_{x′Ω}θ_{σ(C)}`.

**Check.** For `x = 0`, (d) with `x′ = 0` is 5.1 (b) for `θ`; and (d) for the other `x′` near `0` says that
`T^1_lθ_{σ(C)} = θ_{σ(C)}` for `l = x′Ω` in a sublattice of the lattice of `σ(C)`, in accordance with 2.2 (b), `n(l)`
being even on `2Λ`.
(a) and (b) agree by 2.1 (a): the area of `Ω𝔠²/N(𝔠)` is `|Ω|²·N(𝔠)^{−2}·N(𝔠²)·√d/2`.

*Needs:* 1.5 (e), 2.1, 2.2 (b), 5.1; Mathlib (the finite adele ring of a number field, compactness of its ring of
integers).

*Relation to the library.* ComplexMultiplicationAndExplicitReciprocity §2.2 is the main theorem with the reciprocity
law, for abelian varieties with complex multiplication and their torsion points; it does not state the action on
the Taylor series of translated theta functions, which is the form the family uses.

[ShortProof], `Lib/CM/ConjugateCurve.lean` (`New.CMLattice.exists_taylorVia_twistedTranslate_theta`,
`New.CMLattice.twistedTranslate_theta_eq_of_isIntegral`), `Lib/CM/ChowlaSelberg.lean`
(`New.CMLattice.exists_finAdele_taylorVia_twistedTranslate_theta`, `New.CMLattice.IsComplexMultiplicationData`,
`New.CMLattice.complex_multiplication_theta`)

### 5.3 The Chowla–Selberg formula with a unit

*Origin:* adapted from the formula of Lerch and of Chowla and Selberg (1967) for the mean over the ideal classes of
`log(area·|Δ|^{1/6})`: here, with 2.3 and the integrality of isogenies, as a statement about every conjugate lattice
separately, up to the conjugates of one number that is a unit at every prime.

*Method of the formal proof:* choose ideals `𝔠_𝒞`, one in each class `𝒞`, with product `(1)` (the product of all
the classes is trivial, the class number being odd), CM lattices `D_𝒞` with lattices `μ_𝒞·𝔠_𝒞·Λ_C`, and let `u` be a
root of order `12h` (`h` the
class number) of `∏_𝒞 μ_𝒞^{12}·(a₁(D_𝒞)⁴ − 64)`. It is a unit at every prime: the discriminants are units (2.3), and
`∏ μ_𝒞` is, because the `μ_𝒞𝔠_𝒞` and their inverses multiply CM lattices into CM lattices (3.5 (c)) and the ideals
have product `(1)`. By 5.1 (c) the conjugates `σ(D_𝒞)` have the lattices `σ(μ_𝒞)·𝔠_𝒞·Λ_{σ(C)}`, one in each class, so
the class mean of `log(area·|a₁⁴ − 64|^{1/6})` over them is `log(A(σ(C))·|σ(u)|²)`; and the class mean is given by
Kronecker's limit formula summed over the classes, with `ζ_K = ζ·L(·, χ_K)`.

Let `C` be a CM lattice for a prime `d ≡ 7 (mod 8)`. There is `u ∈ ℂ` such that `‖ι_p(u)‖ = 1` for every prime `p`
and every `ι_p`, and for every automorphism `σ` of `ℂ` over `K`:
`A(σ(C))·|σ(u)|² = π·exp(γ − Re (L′/L)(1, χ_K))·2π/√d`,
where `A(σ(C))` is the area of the conjugate lattice and `γ` is Euler's constant.

**Checks.** The right side is `π·Ω_K` with `log Ω_K = γ + log(2π/√d) − (L′/L)(1, χ_K)`, the class mean of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (a): for a lattice with `g₂³ − 27g₃² = a₁⁴ − 64` the
logarithmic period of that section is `log(A/π) + (1/6)·log|a₁⁴ − 64|`, and `|u|^{12h}` is the product of the
`|μ_𝒞|^{12}·|a₁(D_𝒞)⁴ − 64|`. For `d = 7`: `h = 1`, `a₁⁴ − 64 = −1`, one can take `u` with `u^{12} = −1`, and the
statement is `A(C) = π·Ω_K` for every CM lattice for `7`, in accordance with the class mean (one class, discriminant
of absolute value `1`). For `h > 1` the conjugates `σ(C)` lie in several ideal classes and their areas are not
all equal in general; the factor `|σ(u)|²` accounts for this.

*Needs:* 2.1, 2.3, 3.5 (c), 5.1; ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (a) (the
Chowla–Selberg formula in class-mean form; Tau Ceti `TauCeti.NumberField.chowlaSelberg_classMean`, from Kronecker's
first limit formula `UpperHalfPlane.tendsto_epsteinZeta_sub`); Tau Ceti (the modular discriminant of a lattice as
`g₂³ − 27g₃²`: `PeriodPair.weierstrassCurve_Δ`, `UpperHalfPlane.weierstrassCurve_Δ_periodPair`).

*Relation to the library.* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (c) is the mean over the
embeddings of a number field of `log(area/π)` for a lattice of discriminant `1`; the statement here is not a mean:
it holds for each `σ`, with `u` in place of the normalisation of the discriminant. GluedTargetAndDivisionInequality
§8.24e (b) bounds means over the conjugate lattices.

[ShortProof], `Lib/CM/KroneckerLimit.lean` (`New.kronecker_limit`), `Lib/CM/ChowlaSelberg.lean`
(`New.QuadField.eulerProd_one_eq_zeta_mul`, `New.hasSum_ideal_classes`, `New.CMLattice.norm_prod_le_one`,
`New.CMLattice.prod_norm_eq_one`, `New.CMLattice.sum_kronecker_terms`,
`New.QuadField.exists_mk_eq_and_prod_eq_one`, `New.CMLattice.prod_area_mul_norm_disc_galConjugate`,
`New.CMLattice.chowla_selberg`), `Lib/General/NumberTheory/ImaginaryQuadraticField.lean`
(`New.chowlaSelbergConst`)

## Downstream consumers

DivisibilityOfThetaDerivatives is the consumer; each of its sections below names a result of this roadmap on its
*Needs:* line as "ShortGRH background".

- §2.1 (CM lattices, their functions): 1.1 (the sigma function), 1.2 (CM lattices), 1.3 (a) to (c) (`θ` even,
  `θ(0) = 1`, `σ² = xθ²`, the two equations of the cubic), 1.4 (a), (b) (`θ′(0) = 0`, `g″ = g″(0) + x`), 4.2 (the rings
  `𝒪[[y(μz)]]`), 4.4 (the numbers `π_p`, `q_p`, `ρ_p`), 4.5 (a) (`𝒪[[T]] = 𝒪[[y]]`).
- §2.2 (the Frobenius congruence): 2.2 (c) (pull-back of sections), 3.2 (d) (integral values under pull-back), 3.4 (b)
  (an even section with integral torsion values is `θ^m·R(x)`, `R` integral, `2·deg R ≤ m`), 3.1 (b) (`x ∈ 𝒪[[y]]`),
  4.5 (b) (integrality below the degree `q_p`).
- §2.3 (the exponent on one curve): 4.6 (a), (b) (the scaled parameter; integrality after `z ↦ ϖz`), 4.3 (b) (roots of
  order prime to `p`), 4.3 (a) (the part of a series in a class of degrees).
- §2.5 (resolutions): 3.1 (c) (`𝒪[[y]]` is stable under `d/dz`).
- §4.2 (the scale of Taylor series): 5.3 (the Chowla–Selberg formula with a unit), 5.1 (a) (the conjugate of a CM
  lattice); its (d), that CM lattices with the same `a₁` have the same area, follows from 1.2 (b).
- §4.5 (products of sections): 1.5 (a) (the monomials are sections of degree `a + 2b + 3c`), 3.3 (b) (their torsion
  values are integral), 3.2 (d) (translates).
- §4.6 (the integral vacuum): 2.4 (c) (the bound for `|(T^1_uθ)(0)|`), 5.2 (complex multiplication for theta
  functions).
- §4.7 (conjugates of the jets of translates): 5.2.
- §4.9 (standard data as products): 3.5 (d) (`(T^1_vθ)(δ̄z) = θ^N·U`).
- §4.10 (integrality of jets): 3.1 (b), (c), 4.1 (d) (`√−d·g″(0)` integral), 3.5 (c) (the multiplier of an isogeny
  is integral).
- §5.2 (one curve): 4.2 (b) (the group law), 4.6 (a), 4.5 (a).

## Scope and ownership

### Owned here

- the sigma function `σ = σ_W·exp(−s₂z²/2)` of a lattice as a theta function for `(H, ε)`, the dimension of the
  spaces of theta functions for `(mH, χ^m)` on a lattice in `ℂ`, and its addition and duplication formulas (1.1);
- normalised pointed lattices and CM lattices for a prime `d ≡ 7 (mod 8)`, their functions `θ`, `x`, `y`, `G`, `g`,
  the cubic `y² + a₁xy = x³ + x`, sections and monomials (Layer 1);
- CM lattices as multiples of ideals, the behaviour of sections under isogenies, the unit discriminant, the
  finiteness of the lattices and the uniform bound for `θ` (Layer 2);
- the ring `𝒪[[y]]`, torsion values and the integrality principle for sections, and the integrality of isogenies and
  translates on Taylor series (Layer 3);
- the relations between the exponential and the logarithm of a power series (1.4 (o));
- the integrality statements for `−log θ`, the group law in `y`, the numbers `π_p`, `q_p`, `ρ_p`, the reduced order
  and the bound for the height, the formal parameter and its scaling, and the two lemmas on power series of 4.3
  (Layer 4);
- the conjugate of a CM lattice, complex multiplication for theta functions without the reciprocity law, and the
  Chowla–Selberg formula with a unit (Layer 5).

### Not owned here

- the Weierstrass functions `℘`, `ζ_W`, `σ_W` of a lattice, the quasi-periods, Legendre's relation, the addition
  theorem, the recovery of a lattice from `g₂`, `g₃` and the uniformisation theorem: Mathlib and Tau Ceti
  (ModularCurvesPartII §1.4a for `σ_W`);
- Kronecker's first limit formula and the Chowla–Selberg formula in class-mean form:
  ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (a), in Tau Ceti;
- the functional equation of the exponential of a power series without constant term and the divisibility of
  `exp(S) − 1`: MatricesOverValuationRingsAndElementaryInputs §§6.1, 6.2;
- the numbers `γ_p` and the sets `I_p°`, `I_p`, the Frobenius congruence for `θ`, the exponent of `θ` at the scale
  `ϖ`, couplings and normal forms, the rings `𝒪[[y(μz)]]` under scaling and partial derivatives, and everything on
  the Weil representation, tight frames and jets: DivisibilityOfThetaDerivatives;
- the main theorem of complex multiplication with the reciprocity law:
  ComplexMultiplicationAndExplicitReciprocity §2.2;
- the theta functions of ThetaChainsOnDefiniteUnitaryGroups §3.1c and LocalGainOfThetaChains §4.9a, in the
  normalisation by a Weierstrass model of unit discriminant.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Mathlib: `PeriodPair`, `PeriodPair.lattice`, `PeriodPair.weierstrassP`, `PeriodPair.derivWeierstrassP`,
`PeriodPair.g₂`, `PeriodPair.g₃`, `PeriodPair.derivWeierstrassP_sq` (`℘′² = 4℘³ − g₂℘ − g₃`); `PowerSeries.subst`,
`PowerSeries.rescale`, `PowerSeries.exp`, `PowerSeries.logOf`, `MvPowerSeries.subst`; `ClassGroup`,
`FractionalIdeal`; `ℂ_[p]` (`PadicComplex`). Tau Ceti: `PeriodPair.weierstrassSigma` and its quasi-periodicity
(`TauCeti/Analysis/SpecialFunctions/Elliptic/Weierstrass/Sigma.lean`), `PeriodPair.weierstrassZeta`,
`PeriodPair.quasiPeriod` (`…/Weierstrass/Zeta.lean`), `PeriodPair.quasiPeriod_legendre`
(`…/Weierstrass/Legendre.lean`), `PeriodPair.weierstrassP_add`, `PeriodPair.deriv_derivWeierstrassP`,
`PeriodPair.weierstrassP_eq_weierstrassP_iff` (`…/Elliptic/AdditionTheorem.lean`),
`PeriodPair.lattice_eq_iff_g₂_eq_and_g₃_eq`, `PeriodPair.exists_g₂_g₃_eq` (`…/Elliptic/LatticeClassification.lean`),
`PeriodPair.exists_weierstrassP_eq` (`…/Elliptic/Uniformization.lean`);
`TauCeti.NumberField.chowlaSelberg_classMean` and
`TauCeti.NumberField.absNorm_mul_sqrt_abs_discr_of_image_eq`
(`TauCeti/NumberTheory/NumberField/Quadratic/ChowlaSelberg.lean`), `UpperHalfPlane.tendsto_epsteinZeta_sub`
(`TauCeti/NumberTheory/ModularForms/DedekindEta/LimitFormula.lean`).

### From other roadmaps

ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (a) (the mean over the ideal classes of
`log(area/π) + (1/6)·log|Δ|` is `γ + log(2π/√D) − (L′/L)(1, χ_K)`; used in 5.3 for `D = d`);
ModularCurvesPartII §1.4a (the Weierstrass sigma function with its quasi-periods and Legendre's relation; used in
1.1).

### From MatricesOverValuationRingsAndElementaryInputs

§6.1 (for power series `S`, `S′` without constant term over a `ℚ`-algebra: `exp(S)` has constant term `1`, and
`exp(S + S′) = exp(S)·exp(S′)`; used in 1.4, 4.1 and 4.3 (b)).

## References

- [ShortProof] The shorter Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet
  L-functions: the folder `grh` of github.com/lsernau/grh-lean at commit `72fead1`; paths are relative to its directory
  `src/`. It is the reference of every target whose origin is particular to this proof.
- K. Bannai, S. Kobayashi, *Algebraic theta functions and the p-adic interpolation of Eisenstein–Kronecker numbers*,
  Duke Math. J. 153 (2010), 229–295: integral expansions of theta functions of CM elliptic curves at ordinary primes
  (3.4).
- B. J. Birch, *Weber's class invariants*, Mathematika 16 (1969), 283–294: 2.3.
- A. W. Bluher, *Formal groups, elliptic curves, and some theorems of Couveignes*, Algorithmic Number Theory
  (ANTS-III), Lecture Notes in Computer Science 1423, Springer (1998), 482–501: 4.4.
- S. Chowla, A. Selberg, *On Epstein's zeta-function*, J. reine angew. Math. 227 (1967), 86–110: 5.3.
- D. A. Cox, *Primes of the Form x² + ny²*, Wiley (1989), §§3 and 6: genus theory (2.1).
- M. Deuring, *Die Typen der Multiplikatorenringe elliptischer Funktionenkörper*, Abh. Math. Sem. Hansischen Univ. 14
  (1941), 197–272: 4.4.
- D. S. Kubert, S. Lang, *Modular Units*, Springer (1981): Siegel functions and their values at torsion points
  (2.3, 3.3).
- J. Lubin, J. Tate, *Formal complex multiplication in local fields*, Ann. of Math. 81 (1965), 380–387: 4.5, 4.6.
- J. S. Milne, *Complex Multiplication*, course notes (2020), 9.17: 5.2.
- D. Mumford, *Abelian Varieties*, Oxford University Press (1970), Chapter I: theta functions on complex tori and
  their behaviour under isogenies (1.1, 2.2).
- G. Shimura, *Introduction to the arithmetic theory of automorphic functions*, Princeton University Press (1971),
  Chapter 5, in particular Theorem 5.4: 5.1, 5.2.
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, Springer (1986), Chapters IV, VI and VII: formal groups and
  the Weierstrass functions (1.3, 1.4, 1.5, 3.1, 3.5, 4.2).
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, Springer (1994), Chapter I §5 and
  Chapter II: the sigma function and complex multiplication (1.1, 2.1, 5.1).
- A. Weil, *Elliptic Functions according to Eisenstein and Kronecker*, Springer (1976): 1.1, 1.3.

The sources other than Mumford are those named in the heads of the files of [ShortProof] that this roadmap covers;
its `REFERENCES.md` says which citations were compared with their sources.
