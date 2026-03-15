#import "template.typ": cheatsheet, example, key

#show: cheatsheet.with(
  title: "FMM - Mathematical Methods for Physics",
  lang: "en",
  columns: 3,
)

== 1. Fundamental PDEs
- *Laplace Eq:* $nabla^2 u = 0$ (Steady state / Equilibrium)
- *Heat Eq:* $(dif u) / (dif t) = k nabla^2 u$ (Diffusion). Decay: $e^(-k lambda t)$.
- *Wave Eq:* $(dif^2 u) / (dif t^2) = c^2 nabla^2 u$ (Oscillation). Sols: $cos(omega t), sin(omega t)$.
- *Helmholtz Eq:* $nabla^2 psi + k^2 psi = 0$. From Wave Eq: $u(bold(r), t) = psi(bold(r)) e^(-i omega t)$.
- *Poisson Eq:* $nabla^2 u = f(bold(r))$ (Inhomogeneous Laplace)

== 2. Separation of Variables (SOV)
*Context:* Linear homogeneous PDE + homogeneous BCs.
1. Assume $u(bold(r), t) = X(bold(r))T(t)$. Yields $N$ ODEs and $N-1$ constants.
2. Substitute & Separate: $((dif T) / (dif t)) / (k T) = (nabla^2 X) / (X) = -lambda$.
3. Solve Spatial BVP: $nabla^2 X + lambda X = 0$ with given BCs.
4. Solve Temporal ODE: $(dif T) / (dif t) + lambda k T = 0 arrow.double T(t) = C e^(-lambda k t)$.
5. Sum Modes: $u(bold(r), t) = sum c_n X_n (bold(r)) T_n (t)$.
6. Apply IC: $u(bold(r), 0) = f(bold(r))$ using Fourier orthogonality.

== 3. Non-Homogeneous Problems
- *Splitting Trick:* If multiple non-homo BCs, split $u = u_1 + u_2 + dots$ where each $u_i$ has only ONE non-homo BC. Sum results.
- *Time-Independent BCs:* $u(x,t) = v(x,t) + u_E (x)$, where $u_E$ is the equilibrium solution ($(dif u_E) / (dif t) = 0$).
- *Time-Dependent BCs:* $u(x,t) = v(x,t) + r(x,t)$, where $r(x,t)$ is a simple reference function (e.g., $A + (x) / (L) (B-A)$) matching the BCs.
- *Inhomogeneous PDE ($L[u] = Q$):* Use *eigenfunction expansion*:
  $u(x,t) = sum a_n (t) phi.alt_n (x)$. Sub into PDE to get ODEs for $a_n (t)$.

== 4. Fourier Series & Orthogonality
#key[$c_n = (chevron.l f | phi.alt_n chevron.r) / (chevron.l phi.alt_n | phi.alt_n chevron.r) = (integral_V f phi.alt_n sigma dif V) / (integral_V phi.alt_n^2 sigma dif V)$]
- *Double Series ($x in [0,L], y in [0,H]$):*
  $A_("n,m") = (integral integral f phi.alt_n psi_m sigma dif x dif y) / (integral integral phi.alt_n^2 psi_m^2 sigma dif x dif y)$
- *The Trick:* To isolate $c_m$ in $f = sum c_n phi.alt_n$:
  1. Inner prod with $phi.alt_m$: $chevron.l f | phi.alt_m chevron.r = chevron.l sum c_n phi.alt_n | phi.alt_m chevron.r$
  2. Use linearity: $chevron.l f | phi.alt_m chevron.r = sum c_n chevron.l phi.alt_n | phi.alt_m chevron.r$
  3. Orthogonality: Only $c_m chevron.l phi.alt_m | phi.alt_m chevron.r$ survives.

== 5. Sturm-Liouville (SL) Theory
*L-Operator:* $L[u] = nabla dot (p nabla u) - q u = -lambda sigma u$.
- *Regular 1D Form:* $-(dif) / (dif x) (p (dif phi.alt) / (dif x)) + q phi.alt = lambda sigma phi.alt$.
- *Rayleigh Quotient:*
  #key[$lambda = (-integral_S p phi.alt nabla phi.alt dot bold(n) dif S + integral_V [p |nabla phi.alt|^2 + q phi.alt^2] dif V) / (integral_V phi.alt^2 sigma dif V)$]

#let color_green = rgb("#2e7d32")
#let color_stability = rgb("#d32f2f")

== 6. Green's Functions (Constructing $G$)
*Definition:* $L[G(bold(r), bold(r)_0)] = delta(bold(r) - bold(r)_0)$ with homogeneous BCs.
- *Direct Method (1D):*
  $G(x, x_0) = cases(C u_1(x) u_2(x_0) & x < x_0, C u_1(x_0) u_2(x) & x > x_0)$
  #key(accent: color_green)[$C = (-1) / (p(x_0) W(u_1, u_2)(x_0))$] where $W = u_1 u_2' - u_1' u_2$.
- *Eigenfunction Expansion:*
  $G(bold(r), bold(r)_0) = sum_n (phi.alt_n (bold(r)) phi.alt_n (bold(r)_0)) / (lambda_n N_n)$
- *Homogeneous Case ($u(S)=0$):*
  #key(
    accent: color_green,
  )[$u(bold(r)) = integral_V G(bold(r), bold(r)_0) f(bold(r)_0) dif V_0$]
- *Inhomogeneous BCs ($u(a)=alpha, u(b)=beta$):*
  #key(accent: color_green)[$u = integral G f + [-p alpha (dif G) / (dif x_0)]_(x_0=a) + [p beta (dif G) / (dif x_0)]_(x_0=b)$].

== 7. Standard ODE Solutions
#set text(size: 4.5pt)
#table(
  columns: (0.4fr, 1.4fr, 1.4fr, 0.8fr),
  inset: 3pt,
  fill: (x, y) => if y == 0 { rgb("#e3f2fd") },
  [*Geom*], [*Equation Form*], [*General Solutions*], [*Regularity*],
  [Rect. $x$],
  [$(dif^2 phi.alt) / (dif x^2) + lambda phi.alt = 0$],
  [$lambda > 0: A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$\ $lambda = 0: A x + B$\ $lambda < 0: A cosh + B sinh$],
  [$lambda = ((n pi) / (L))^2$ (Dir.)],

  [Cyl. $r$],
  [$r^2 f'' + r f' + (lambda r^2 - m^2)f = 0$],
  [$lambda > 0: A J_m + B Y_m$\ $lambda = 0: A r^m + B r^(-m)$ ($m=0: ln r$)\ $lambda < 0: A I_m + B K_m$],
  [If $0 in V$: no $Y_m, K_m, ln, r^(-m)$],

  [Sph. $rho$],
  [$(rho^2 f')' + (lambda rho^2 - n(n+1))f = 0$],
  [$lambda > 0: A j_n + B y_n$\ $lambda = 0: A rho^n + B rho^(-(n+1))$],
  [If $0 in V$: no $y_n, rho^(-(n+1))$],

  [Sph. $theta$],
  [$((1-x^2)g')' + (n(n+1) - m^2/(1-x^2))g = 0$],
  [$x = cos theta$\ $g = A P_n^m (x) + B Q_n^m (x)$],
  [If $0, pi in V$: discard $Q_n^m$],
)
#set text(size: 5pt)

== 8. Practical Tips & Tricks
- *Regularity:* If $|u(0)| < infinity$, discard singular solutions ($Y_m, K_m, Q_n^m, ln r, r^(-n)$).
- *Late Time:* Only the mode with the *smallest* $lambda > 0$ survives.
- *Equilibrium:* Set $(dif u) / (dif t) = 0$ (Heat) or $(dif^2 u) / (dif t^2) = 0$ (Wave) $arrow$ solve $nabla^2 u = f$.
- *Fredholm:* $L[u]=f$ has sol iff $integral f phi.alt_h sigma = 0$ for zero-modes $phi.alt_h$.

== 9. Shortcuts & Solving Steps
- *Coord. Change:* $x^2 phi.alt'' + x phi.alt' + lambda phi.alt = 0 arrow phi.alt'' (z) + lambda phi.alt(z) = 0$ ($x = e^z$).
- *Eigenvalues ($lambda$):* Check $lambda=0$ (Neumann). Check $lambda<0$ (Robin $h < 0$).
- *Logic for Basis:* $u(0)=0 arrow sin$; $u'(0)=0 arrow cos$. $u(L)=0 arrow sin(sqrt(lambda)(L-x))$.
- *Fourier-Bessel ($J_m$):* $A_k = ((2) / (a^2 J_(m+1)^2 (z_(m,k)))) integral_0^a f(r) J_m(z_(m,k) r/a) r dif r$.
- *Orthogonality:* $integral_0^L sin^2((n pi x) / (L)) = L/2$. $integral_0^pi sin^2(n x) = pi/2$.

== 10. Quick Eigenvalue Table
#set text(size: 4.5pt)
#table(
  columns: (1fr, 1.2fr, 1.5fr),
  inset: 3pt,
  fill: (x, y) => if y == 0 { rgb("#e3f2fd") },
  [*BCs ($x=0, L$)*],
  [*Eigenvalues ($lambda_n$)*],
  [*Eigenfunctions ($phi.alt_n$)*],

  [Dirichlet (0, 0)], [$((n pi) / (L))^2$], [$sin((n pi x) / (L))$],
  [Neumann (0, 0)], [$((n pi) / (L))^2$], [$cos((n pi x) / (L))$],
  [Mixed (Dir, Neu)],
  [$(((n + 1/2) pi) / (L))^2$],
  [$sin(((n + 1/2) pi x) / (L))$],

  [Mixed (Neu, Dir)],
  [$(((n + 1/2) pi) / (L))^2$],
  [$cos(((n + 1/2) pi x) / (L))$],

  [Periodic], [$((2 n pi) / (L))^2$], [$1, cos, sin$],
)
#set text(size: 5pt)

== 11. Coordinate Systems ($nabla^2 u$)
- *Cylindrical ($r, theta, z$):*
  #key[$nabla^2 u = ((1) / (r)) (dif) / (dif r) (r (dif u) / (dif r)) + ((1) / (r^2)) (dif^2 u) / (dif theta^2) + (dif^2 u) / (dif z^2)$]
- *Spherical ($rho, theta, phi.alt$):*
  #key[$nabla^2 u = ((1) / (rho^2)) (dif) / (dif rho) (rho^2 (dif u) / (dif rho)) + ((1) / (rho^2 sin theta)) (dif) / (dif theta) (sin theta (dif u) / (dif theta)) + ((1) / (rho^2 sin^2 theta)) (dif^2 u) / (dif phi.alt^2)$]
  - *Radial only:* $nabla^2 u = (((dif^2) / (dif rho^2)) (rho u)) / (rho)$

== 12. Special Function Identities
- *Bessel:* $(x^n J_n)' = x^n J_(n-1)$ and $(x^(-n) J_n)' = -x^(-n) J_(n+1)$
- *Legendre:* $P_0=1, P_1=x, P_2 = 1/2 (3x^2-1)$. $integral_(-1)^1 P_n^2 = 2/(2n+1)$.

== 13. Mathematical Toolkit
- *Trig:* $sin A cos B = 1/2 [sin(A+B) + sin(A-B)]$
  - $sin^2 x = (1 - cos 2x) / 2$, $cos^2 x = (1 + cos 2x) / 2$
- *Common Integrals:*
  - $integral_0^L x sin((n pi x) / (L)) dif x = ((-1)^(n+1) L^2) / (n pi)$
  - $integral_0^L x cos((n pi x) / (L)) dif x = (L^2) / (n^2 pi^2) ((-1)^n - 1)$

== 14. Numerical "Must-Haves"
- *Bessel Zeros ($J_m(z)=0$):*
  - $J_0: 2.405, 5.520, 8.654$; $J_1: 3.832, 7.016, 10.173$
- *Values:* $J_0(0)=1, J_n(0)=0$ for $n>0$.

== 15. Strategy: Inhomogeneous PDEs
*Goal:* Solve $L[u] = f(bold(r), t)$ with BC $u(S) = g(S)$.
1. *Homogenize BCs:* Find $w(bold(r))$ matching BCs. Let $v = u - w$.
2. *New PDE:* $L[v] = f - L[w]$ with *homogeneous* BCs.
3. *Expand:* $v = sum a_n(t) phi.alt_n (bold(r))$ using spatial eigenfunctions.
4. *ODE:* Sub sum into PDE $arrow$ get $(dif a_n) / (dif t) + k lambda_n a_n = f_n(t)$. Solve via Int. Factor $e^(k lambda_n t)$.
- *Explicit Steady Sol ($L[u] + alpha u = f$):*
  #key(accent: rgb("#1a73e8"))[$u(x) = sum_n (f_n phi.alt_n (x)) / (alpha - lambda_n)$] (Works for $bold(r)$ in multi-D too) \
  where $f_n = (chevron.l f | phi.alt_n chevron.r) / (chevron.l phi.alt_n | phi.alt_n chevron.r)$.

== 16. Common Mistakes
- *The Weight:* Don't forget $sigma(x)$ in inner products $chevron.l f | phi.alt_n chevron.r = integral f phi.alt_n sigma dif x$.
- *Green's BCs:* $G$ *must* satisfy homogeneous BCs even if the original $u$ is inhomogeneous.
- *Normalization:* Don't forget the denominator $integral phi.alt_n^2 sigma$ in Fourier coefficients.
- *Jacobians:* Don't forget the $r$ in $r dif r dif theta$ or $rho^2 sin theta$ in spherical integration.
- *Zero Modes:* Don't forget the $n=0$ case (constant solution) for Neumann BCs.
- *Singularity:* Discarding $Y_m, K_m, r^(-n)$ only if the origin $r=0$ is *actually in* the domain.
- *Phase Shift:* $u(L)=0$ for $(dif^2 X) / (dif x^2) + lambda X = 0$ is $X_n = sin(sqrt(lambda)(L-x))$.

== Worked Examples

=== Fourier & SL Theory
#example(
  "Fourier Series & Fredholm",
  [
    (a) Cosine series for $f(x)=x^2$ on $[0,1]$ \
    (b) Sine series continuity \
    (c) Fredholm Alt for $(dif^2 u) / (dif x^2) + 4u = cos x, u'(0)=u'(pi)=0$
  ],
  [
    *(a)*
    1. Even extension on $[-1,1]$ with $L=1$. $a_0 = (1) / (1) integral_0^1 x^2 dif x = [ (x^3) / (3) ]_0^1 = (1) / (3)$.
    2. $a_n = (2) / (1) integral_0^1 x^2 cos(n pi x) dif x$. Integrate by parts twice:
      $a_n = 2 [ (x^2 sin(n pi x)) / (n pi) ]_0^1 - 4 integral_0^1 (x sin(n pi x)) / (n pi) dif x = 0 - (4) / (n pi) [ -(x cos(n pi x)) / (n pi) + (sin(n pi x)) / (n^2 pi^2) ]_0^1$.
    3. Evaluate: $a_n = (4 cos(n pi)) / (n^2 pi^2) = (4 (-1)^n) / (n^2 pi^2)$.

    *(b)*
    1. Sine series $f(x) approx sum b_n sin((n pi x) / (L))$ uses an *odd* periodic extension.
    2. For the series to be continuous, the odd extension must not have jumps at $x=0$ or $x=L$.

    *(c)*
    1. Find homogeneous zero-mode $phi.alt_h$: $(dif^2 phi.alt) / (dif x^2) + 4 phi.alt = 0 arrow phi.alt_h = A cos(2x) + B sin(2x)$.
    2. BCs: $phi.alt_h'(0) = 2B = 0 arrow B=0$. $phi.alt_h'(pi) = -2A sin(2 pi) = 0 arrow$ True for all $A$.
    3. Zero-mode found: $phi.alt_h = cos(2x)$.
    4. Fredholm test: Solution exists if driving force $f = cos x$ is orthogonal to $phi.alt_h$:
      $chevron.l cos x | cos(2x) chevron.r = integral_0^pi cos x cos(2x) dif x = integral_0^pi (1) / (2) (cos(3x) + cos(x)) dif x = 0$.
  ],
  [
    *(a)* $f(x) = (1) / (3) + sum_(n=1)^(infinity) ((4 (-1)^n) / (n^2 pi^2)) cos(n pi x)$. \
    *(b)* Continuous iff $f(x)$ is continuous and $f(0) = f(L) = 0$. \
    *(c)* Since integral is $0$, a solution exists (but is not unique).
  ],
)

#example(
  "Fourier Sine Series of a Step",
  [
    Find the sine series for $f(x) = A$ on $(0, L/2)$ and $0$ on $(L/2, L)$. Which coefficients vanish?
  ],
  [
    1. Formula: $b_n = (2) / (L) integral_0^L f(x) sin((n pi x) / (L)) dif x = (2A) / (L) integral_0^(L/2) sin((n pi x) / (L)) dif x$.
    2. Integrate: $b_n = (2A) / (L) [ -(L) / (n pi) cos((n pi x) / (L)) ]_0^(L/2) = (2A) / (n pi) (1 - cos((n pi) / (2)))$.
    3. Evaluate modes: $cos((n pi) / (2))$ is $0$ for odd $n$, $-1$ for $n=2, 6, 10$, and $1$ for $n=4, 8, 12$.
    4. Vanishing condition: $b_n = 0$ when $cos((n pi) / (2)) = 1 arrow.double n = 4k$ for integer $k$.
  ],
  [
    $b_n = (2A) / (n pi) (1 - cos((n pi) / (2)))$. Modes $n=4, 8, 12, dots$ vanish. The first two non-zero terms are $n=1, 2$.
  ],
)

#example(
  "Cauchy-Euler SL Problem",
  [
    Analyze $x^2 (dif^2 phi.alt) / (dif x^2) + x (dif phi.alt) / (dif x) + lambda phi.alt = 0$ on $[1, b]$ with $phi.alt(1)=phi.alt(b)=0$.
  ],
  [
    1. SL Form: Divide by $x arrow.double (dif) / (dif x) (x (dif phi.alt) / (dif x)) + (lambda) / (x) phi.alt = 0$. Regular on $[1,b]$ since $p=x>0, sigma=1/x>0$.
    2. Eigenvalues sign: $q=0$ and Dirichlet BCs guarantee $lambda > 0$ strictly.
    3. Transform: Sub $x = e^z arrow.double (dif^2 phi.alt) / (dif z^2) + lambda phi.alt = 0$ for $z in [0, ln b]$.
    4. Solve: $phi.alt(z) = c_1 cos(sqrt(lambda) z) + c_2 sin(sqrt(lambda) z)$.
    5. BCs: $x=1 arrow z=0 arrow c_1=0$. $x=b arrow z=ln b arrow sqrt(lambda) ln b = n pi$.
  ],
  [
    $lambda_n = ((n pi) / (ln b))^2$ and $phi.alt_n(x) = sin((n pi ln x) / (ln b))$.
  ],
)

#example(
  "Fourier Series of $e^x$",
  [
    Determine the Fourier series of $f(x)=e^x$ on $[-L, L]$.
  ],
  [
    1. Mean value: $a_0 = (1) / (2L) integral_(-L)^L e^x dif x = (e^L - e^(-L)) / (2L)$.
    2. Integration by parts trick: To find $a_n$ and $b_n$, integrate by parts twice; this yields a cyclic equation that you can solve algebraically.
    3. Cosine coeffs: Evaluating the boundary terms gives $a_n = ((-1)^n (e^L - e^(-L))) / (L (1 + ((n pi) / (L))^2))$.
    4. Sine coeffs: The cyclic integration reveals a direct relation, $b_n = -((n pi) / (L)) a_n$.
  ],
  [
    Series is $e^x = a_0 + sum (a_n cos((n pi x)/(L)) + b_n sin((n pi x)/(L)))$.
  ],
)

#example(
  "Legendre Polynomials & Orthogonality",
  [
    Compute the first 5 Legendre polynomials via Rodrigues' formula and verify $P_2, P_4$ are orthogonal.
  ],
  [
    1. Formula: $P_n = (1) / (2^n n!) (dif^n) / (dif x^n) ( (x^2 - 1)^n )$.
    2. Evaluate: $P_0 = 1, P_1 = x, P_2 = (1) / (2) (3x^2 - 1), P_3 = (1) / (2) (5x^3 - 3x), P_4 = (1) / (8) (35x^4 - 30x^2 + 3)$.
    3. Orthogonality: The weight is $sigma = 1$. Compute $integral_(-1)^1 P_2(x) P_4(x) dif x$.
  ],
  [
    The integral evaluates to $[ (15x^7) / (16) - (25x^5) / (16) + (13x^3) / (16) - (3x) / (16) ]_(-1)^1 = 0$.
  ],
)

=== Heat Equation Problems
#example(
  "2D Heat Rectangle",
  [
    Solve $(dif u) / (dif t) = k nabla^2 u$ on $[0,L] times [0,H]$ with $((dif u) / (dif x))(0)=((dif u) / (dif x))(L)=0$ and $u(x,0,t)=u(x,H,t)=0$.
  ],
  [
    1. SOV $u(x,y,t) = X(x)Y(y)T(t) arrow.double ((dif T) / (dif t)) / (k T) = ((dif^2 X) / (dif x^2)) / (X) + ((dif^2 Y) / (dif y^2)) / (Y) = -lambda$.
    2. Spatial $X$: $(dif^2 X) / (dif x^2) + lambda_x X = 0 arrow.double X(x) = A cos(sqrt(lambda_x) x) + B sin(sqrt(lambda_x) x)$.
    3. BCs: $X'(0) = sqrt(lambda_x) B = 0 arrow.double B=0$. $X'(L) = -A sqrt(lambda_x) sin(sqrt(lambda_x) L) = 0 arrow.double sqrt(lambda_x) = (n pi) / (L)$.
    4. Spatial $Y$: $(dif^2 Y) / (dif y^2) + lambda_y Y = 0 arrow.double Y(y) = C cos(sqrt(lambda_y) y) + D sin(sqrt(lambda_y) y)$.
    5. BCs: $Y(0) = C = 0$. $Y(H) = D sin(sqrt(lambda_y) H) = 0 arrow.double sqrt(lambda_y) = (m pi) / (H)$.
    6. Temporal: $(dif T) / (dif t) = -k (lambda_x + lambda_y) T arrow.double T(t) = E e^(-k lambda_("n,m") t)$.
  ],
  [
    $u_("n,m") = cos((n pi x) / (L)) sin((m pi y) / (H)) e^(-k lambda_("n,m") t)$ where $lambda_("n,m") = ((n pi) / (L))^2 + ((m pi) / (H))^2$.
  ],
)

#example(
  "Inhomog. Heat & Avg Temp",
  [
    Solve $(dif u) / (dif t) = kappa (dif^2 u) / (dif x^2) + Q(x,t)$ with $u(0,t)=T_1, u(L,t)=T_2$.
  ],
  [
    1. Shift: $w(x) = T_1 + (x) / (L) (T_2 - T_1)$. Let $v = u - w$.
    2. New PDE: $(dif v) / (dif t) = kappa (dif^2 v) / (dif x^2) + Q(x,t)$ with $v(0)=v(L)=0$.
    3. Expand $v = sum a_n (t) sin((n pi x) / (L))$. Sub into PDE arrow.double $sum [a'_n + kappa lambda_n a_n] sin phi.alt_n = Q$.
    4. ODE: $(dif a_n) / (dif t) + kappa lambda_n a_n = q_n(t)$, solve via Integrating Factor $e^(kappa lambda_n t)$.
    5. Avg Temp: $T_("avg") (t) = (1) / (L) integral_0^L u(x,t) dif x$.
  ],
  [
    $u(x,t) = w(x) + sum a_n (t) sin((n pi x) / (L))$.
  ],
)

#example(
  "Heat Eq in Disk (Radial)",
  [
    Solve $(dif u) / (dif t) = kappa nabla^2 u$ on $r <= a$ with $u(a,t)=0, u(r,0)=f(r)$.
  ],
  [
    1. Radial: $r^2 (dif^2 R) / (dif r^2) + r (dif R) / (dif r) + lambda r^2 R = 0 arrow.double R(r) = A J_0(sqrt(lambda) r) + B Y_0(sqrt(lambda) r)$.
    2. Regularity: $R(0)$ finite arrow.double $B=0$. BC: $R(a) = J_0(sqrt(lambda) a) = 0 arrow.double sqrt(lambda) = (z_("0,k")) / (a)$.
    3. Expansion: $u(r,t) = sum A_k J_0((z_("0,k") r) / (a)) e^(-kappa lambda_k t)$.
    4. IC Match: $u(r,0) = sum A_k J_0((z_("0,k") r) / (a)) = f(r)$.
    5. Coeffs: Multiply by weight $r J_0$ and integrate to isolate $A_k$: \ $A_k = (chevron.l f | J_0 chevron.r) / (chevron.l J_0 | J_0 chevron.r) = (integral_0^a f(r) J_0((z_("0,k") r) / (a)) r dif r) / (integral_0^a J_0^2((z_("0,k") r) / (a)) r dif r)$.
  ],
  [
    $u(r,t) = sum A_k J_0((z_("0,k") r) / (a)) e^(-kappa ((z_("0,k")) / (a))^2 t)$.
  ],
)

#example(
  "Mixed Heat Rod",
  [
    Solve Heat Eq with $u(0,t)=0$ (fixed) and $((dif u) / (dif x))(L,t)=0$ (insulated).
  ],
  [
    1. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
    2. BC $X(0) = A = 0$. BC $X'(L) = B sqrt(lambda) cos(sqrt(lambda) L) = 0$.
    3. Solve: $sqrt(lambda) L = (n + (1) / (2)) pi arrow.double lambda_n = (((n + (1) / (2)) pi) / (L))^2$.
    4. Temporal: $T(t) = C e^(-kappa lambda_n t)$.
  ],
  [
    $u_n = sin(((n + (1) / (2)) pi x) / (L)) e^(-kappa lambda_n t)$.
  ],
)

#example(
  "1D Heat Equation Basics",
  [
    Solve $(dif u) / (dif t) = kappa (dif^2 u) / (dif x^2)$ on $0 < x < L$ with $u(0,t)=u(L,t)=0$ and $u(x,0) = A sin((3 pi x) / (L))$. What does $(dif^2 u) / (dif x^2)$ measure physically, and what are the steady-state solutions?
  ],
  [
    1. Interpretation: $(dif^2 u) / (dif x^2)$ measures the spatial curvature. Heat changes fastest where curvature is highest.
    2. Steady-state: Set $(dif u) / (dif t) = 0 arrow.double (dif^2 u) / (dif x^2) = 0 arrow.double u(x) = c_1 x + c_2$. With zero BCs, $u(x)=0$.
    3. SOV: $u(x,t) = X(x)T(t) arrow.double X_n(x) = sin((n pi x) / (L))$ and $T_n(t) = e^(-kappa ((n pi) / (L))^2 t)$.
    4. Apply IC: $u(x,0) = A sin((3 pi x) / (L))$ matches exactly the $n=3$ mode bc the basis is orthogonal.
  ],
  [
    $u(x,t) = A sin((3 pi x) / (L)) e^(-kappa ((3 pi) / (L))^2 t)$. Profile decays exponentially to zero as $t arrow infinity$.
  ],
)

#example(
  "Non-Equilibrium (Rod with Source)",
  [
    Find equilibrium for $partial_t u = kappa partial_x^2 u + q$ on $0 < x < L$ with homogeneous Neumann BCs.
  ],
  [
    1. Sanity check: The rod is insulated but has a constant heat source. The average temperature must grow indefinitely, meaning no true equilibrium can exist unless $q=0$.
    2. Math proof: Force $partial_t u = 0 arrow.double kappa partial_x^2 u + q = 0$.
    3. Integrate: $u_("eq")(x) = -(q) / (2 kappa) x^2 + alpha x + beta$.
    4. Apply BCs: $u_("eq")'(0) = alpha = 0$ and $u_("eq")'(L) = -(q L) / (kappa) + alpha = 0$.
    5. Contradiction: This strictly requires $q=0$, matching the obvious physical reality.
  ],
  [
    No equilibrium exists for $q > 0$.
  ],
)

#example(
  "Heat Eq Equilibrium & Consistency",
  [
    Find equilibrium for $(dif u) / (dif t) = k (dif^2 u) / (dif x^2) + Q(x)$ given BCs $(dif u) / (dif x) (0)=alpha, (dif u) / (dif x) (L)=beta$.
  ],
  [
    1. Check: Equilibrium exists iff net flux $-(beta - alpha)$ balances source $integral_0^L Q(x) dif x$.
    2. Math: Set $(dif u) / (dif t) = 0 arrow.double (dif^2 u_("eq")) / (dif x^2) = - (Q(x)) / (k)$.
    3. Integrate: For $Q=k, u(0)=A, u(L)=B$, $u_("eq") = -(x^2) / (2) + a x + b$.
  ],
  [
    $u_("eq") (x) = -(x^2) / (2) + ((B-A) / (L) + (L) / (2)) x + A$.
  ],
)

#example(
  "Time-Dependent BCs",
  [
    Reduce $(dif u) / (dif t) = k (dif^2 u) / (dif x^2) + Q(x,t)$ with $(dif u) / (dif x) (t,0)=A(t), (dif u) / (dif x) (t,L)=B(t)$ to homogeneous BCs.
  ],
  [
    1. Ref: $r(x,t) = A(t) x + (B(t)-A(t)) (x^2) / (2L)$ satisfies the non-homogeneous BCs.
    2. Shift: Let $v = u - r$. Then $(dif v) / (dif x) (t,0) = (dif v) / (dif x) (t,L) = 0$.
    3. New PDE: $(dif v) / (dif t) = k (dif^2 v) / (dif x^2) + hat(Q)(x,t)$ where $hat(Q) = Q - (dif r) / (dif t) + k (dif^2 r) / (dif x^2)$.
  ],
  [
    $v$ solves the PDE with homogeneous Neumann BCs and a modified source.
  ],
)

=== Wave Equation Problems
#example(
  "Damped Wave (Friction)",
  [
    Solve $rho (dif^2 u) / (dif t^2) = T_0 (dif^2 u) / (dif x^2) + beta (dif u) / (dif t)$ with $u(0,t)=u(L,t)=0$.
  ],
  [
    1. SOV $u = X(x)T(t) arrow.double ((dif^2 X) / (dif x^2)) / (X) = (rho (dif^2 T) / (dif t^2) - beta (dif T) / (dif t)) / (T_0 T) = -lambda$.
    2. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
    3. BCs: $X(0) = A = 0$. $X(L) = B sin(sqrt(lambda) L) = 0 arrow.double sqrt(lambda) = (n pi) / (L)$.
    4. Temporal: $rho (dif^2 T) / (dif t^2) - beta (dif T) / (dif t) + T_0 lambda_n T = 0$.
    5. Char Eq: $rho r^2 - beta r + T_0 lambda_n = 0 arrow.double r = (beta plus.minus sqrt(beta^2 - 4 rho T_0 lambda_n)) / (2 rho)$.
  ],
  [
    $u_n(x,t) = sin((n pi x) / (L)) e^((beta t) / (2 rho)) (dots)$. Motion is underdamped if $beta^2 < 4 rho T_0 lambda_n$.
  ],
)

#example(
  "Wave Eq Resonance",
  [
    Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2)$ with $u(0,t)=0, u(L,t)=sin(omega t)$.
  ],
  [
    1. Reference: $w(x,t) = (x) / (L) sin(omega t)$. Let $v = u - w$.
    2. New PDE: $(dif^2 v) / (dif t^2) - c^2 (dif^2 v) / (dif x^2) = -(dif^2 w) / (dif t^2) = (x / L) omega^2 sin(omega t)$.
    3. Expand $v = sum a_n(t) sin((n pi x) / (L)) arrow.double a_n'' + omega_n^2 a_n = q_n sin(omega t)$.
    4. Particular: $a_n (t) = (q_n) / (omega_n^2 - omega^2) sin(omega t)$.
    5. Resonance: If $omega arrow omega_n = (n pi c) / (L)$, then $a_n (t) prop t cos(omega_n t)$.
  ],
  [
    $u$ grows linearly if driving $omega$ matches an eigenfrequency $omega_n$.
  ],
)

#example(
  "Mixed BCs (1D Wave)",
  [
    Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2)$ with $u(0) - ((dif u) / (dif x))(0) = 0, ((dif u) / (dif x))(L) = 0$.
  ],
  [
    1. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
    2. BC at $x=0$: $X(0) - X'(0) = A - sqrt(lambda) B = 0 arrow.double A = sqrt(lambda) B$.
    3. BC at $x=L$: $X'(L) = -A sqrt(lambda) sin(sqrt(lambda) L) + B sqrt(lambda) cos(sqrt(lambda) L) = 0$.
    4. Substitute $A$: $sqrt(lambda) B [ -sqrt(lambda) sin(sqrt(lambda) L) + cos(sqrt(lambda) L) ] = 0$.
  ],
  [
    Eigenvalues satisfy $tan(sqrt(lambda) L) = (1) / (sqrt(lambda))$.
  ],
)

#example(
  "Quarter Disk Membrane",
  [
    Find frequencies for $(dif^2 u) / (dif t^2) = c^2 nabla^2 u$ on $0 < theta < (pi) / (2), 0 < r < b$ with $u=0$ on all boundaries.
  ],
  [
    1. SOV $u = R(r)Theta(theta)T(t) arrow.double ((dif^2 Theta) / (dif theta^2)) / (Theta) = -mu$.
    2. Angular: $(dif^2 Theta) / (dif theta^2) + mu Theta = 0 arrow.double Theta(theta) = A cos(sqrt(mu) theta) + B sin(sqrt(mu) theta)$.
    3. BCs: $Theta(0) = A = 0$. $Theta((pi) / (2)) = B sin(sqrt(mu) (pi) / (2)) = 0 arrow.double sqrt(mu) = 2m$.
    4. Radial: $r^2 (dif^2 R) / (dif r^2) + r (dif R) / (dif r) + (lambda r^2 - (2m)^2) R = 0$.
    5. General Sol: $R(r) = C J_(2m)(sqrt(lambda) r) + D Y_(2m)(sqrt(lambda) r)$.
    6. Regularity: $R(0)$ finite arrow.double $D = 0$.
    7. BC: $R(b) = C J_(2m)(sqrt(lambda) b) = 0 arrow.double sqrt(lambda) = (z_("2m,k")) / (b)$.
  ],
  [
    $omega_("m,k") = (c z_("2m,k")) / (b)$. Fundamental mode is $m=1, k=1$.
  ],
)

#example(
  "1D Wave with Step Velocity",
  [
    Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2)$ with $u(0,t)=u(L,t)=0$, $u(x,0)=0$, and $u_t(x,0) = V$ for $x in (0, L/2)$, else $0$.
  ],
  [
    1. SOV: $u = phi.alt(x)h(t)$. Spatial yields $phi.alt_n(x) = sin((n pi x) / (L))$ with $lambda_n = ((n pi) / (L))^2$.
    2. Temporal: $h_n(t) = A_n cos((n pi c t) / (L)) + B_n sin((n pi c t) / (L))$. $u(x,0)=0 arrow.double A_n = 0$.
    3. Apply IC: $(dif u) / (dif t) (x,0) = sum B_n ((n pi c) / (L)) sin((n pi x) / (L)) = g(x)$.
    4. Coeffs: $B_n ((n pi c) / (L)) = (2) / (L) integral_0^(L/2) V sin((n pi x) / (L)) dif x = (2V) / (n pi) (1 - cos((n pi) / (2))$.
    5. Zero modes: $B_n = 0$ when $cos((n pi)/(2)) = 1 arrow.double n = 4k$.
  ],
  [
    $u(x,t) = sum_(n=1)^infinity (2V L) / (n^2 pi^2 c) (1 - cos((n pi) / (2))) sin((n pi x) / (L)) sin((n pi c t) / (L))$. Modes where $n$ is a multiple of $4$ are not excited.
  ],
)

#example(
  "3D Wave on Circular Slab",
  [
    Solve $(dif^2 u) / (dif t^2) = c^2 nabla^2 u$ on $r < a, 0 < z < H$ with zero BCs. IC: $u = r(a-r) cos theta sin((pi z) / (H))$, $u_t = 0$.
  ],
  [
    1. SOV $u = R(r)Theta(theta)Z(z)T(t)$. IC dependencies force $Z(z) = sin((pi z) / (H))$ and $Theta(theta) = cos theta$ ($m=1$).
    2. Radial: $R_k(r) = J_1(sqrt(mu_k) r)$ where $sqrt(mu_k) = (z_(1,k)) / (a)$ to satisfy $u(a)=0$.
    3. Temporal: $(dif^2 T) / (dif t^2) = -c^2 (mu_k + ((pi) / (H))^2) T$. $u_t=0 arrow.double T_k(t) = cos(omega_k t)$ with $omega_k = c sqrt(((z_(1,k))/(a))^2 + ((pi)/(H))^2)$.
    4. Expand: $u(r,theta,z,t) = cos theta sin((pi z) / (H)) sum A_k J_1((z_(1,k) r) / (a)) cos(omega_k t)$.
    5. IC match: $sum A_k J_1 = r(a-r) arrow.double A_k = (2) / (a^2 J_2^2(z_(1,k))) integral_0^a r(a-r) J_1((z_(1,k) r) / (a)) r dif r$.
  ],
  [
    Exact 3D series solution defined by $A_k$ expansion, integrating over the initial radial profile.
  ],
)

#example(
  "Annular Sector Membrane",
  [
    Find vibration frequencies for the wave eq on $a < r < b$ and $0 < theta < pi/2$ with $u=0$ on all boundaries.
  ],
  [
    1. SOV: $u = f(r)g(theta)h(t)$. Angular Dirichlet BCs ($g(0)=g(pi/2)=0$) yield $g(theta) = sin(2m theta)$, so the separation constant is $mu = 4m^2$.
    2. Radial ODE: The radial equation becomes $r^2 f'' + r f' + (lambda r^2 - 4m^2)f = 0$.
    3. Basis choice: Because $r=0$ is strictly excluded from the domain ($a>0$), you cannot discard the singular Bessel function. The basis must be $f(r) = a_(2m) J_(2m)(sqrt(lambda) r) + b_(2m) Y_(2m)(sqrt(lambda) r)$.
    4. Apply BCs: Setting $f(a)=f(b)=0$ creates a homogeneous linear system for the coefficients $a_(2m)$ and $b_(2m)$.
    5. Determinant condition: For non-trivial solutions, set the determinant to zero.
  ],
  [
    Frequencies are $omega = (c sqrt(lambda))/(2 pi)$, where roots $lambda$ solve $J_(2m)(sqrt(lambda) a) Y_(2m)(sqrt(lambda) b) = Y_(2m)(sqrt(lambda) a) J_(2m)(sqrt(lambda) b)$.
  ],
)

#example(
  "Driven Wave & Resonance",
  [
    Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2) + g(x) cos(omega t)$ with fixed endpoints.
  ],
  [
    1. Expand: $u = sum A_i (t) phi.alt_i (x)$. PDE becomes $(dif^2 A_i) / (dif t^2) + c^2 lambda_i A_i = gamma_i cos(omega t)$.
    2. Solve: $A_i (t) = (gamma_i) / (c^2 lambda_i - omega^2) cos(omega t) + dots$
  ],
  [
    Resonance occurs when driving $omega = c sqrt(lambda_i) = (n pi c) / (L)$.
  ],
)

=== Laplace, Poisson & Green's
#example(
  "Poisson Eq (Inhomogeneity)",
  [
    Solve $nabla^2 u = f(x,y)$ on rectangle $[0,L] times [0,H]$ with $u(x,H)=g(x)$ and other boundaries zero.
  ],
  [
    1. Split $u = u_("bulk") + u_("bound")$. $nabla^2 u_("bulk") = f$ (zero BCs) and $nabla^2 u_("bound") = 0$ ($u_("bound")(x,H)=g(x)$).
    2. Bulk: Expand $u_("bulk") = sum_("n,m") A_("n,m") sin((n pi x) / (L)) sin((m pi y) / (H))$.
    3. Sub into PDE: $sum A_("n,m") (-lambda_("n,m")) sin phi.alt_n sin psi_m = f(x,y)$.
    4. $A_("n,m") = (-1) / (lambda_("n,m")) (chevron.l f | sin phi.alt_n sin psi_m chevron.r) / (chevron.l sin phi.alt_n sin psi_m | sin phi.alt_n sin psi_m chevron.r)$.
    5. Bound PDE: $nabla^2 u_("bound") = 0$. $Y$-ODE yields $cosh, sinh$. $u(x,0)=0 arrow$ keep $sinh$.
    6. Bound Form: $u_("bound") = sum B_n sin((n pi x) / (L)) sinh((n pi y) / (L))$.
    7. BC Match: $u_("bound")(x,H) = sum [B_n sinh((n pi H) / (L))] sin((n pi x) / (L)) = g(x) arrow.double B_n = (g_n) / (sinh((n pi H) / (L)))$.
  ],
  [
    $u = u_("bulk") + u_("bound")$.
  ],
)

#example(
  "Thick Spherical Shell",
  [
    Solve $nabla^2 u = 0$ for $a <= rho <= b$ with $u(a)=0, u(b)=V_0$.
  ],
  [
    1. Radial Laplace: $(dif) / (dif rho) (rho^2 (dif u) / (dif rho)) = 0$.
    2. Integrate: $rho^2 (dif u) / (dif rho) = C_1 arrow.double (dif u) / (dif rho) = (C_1) / (rho^2)$.
    3. Integrate again: $u(rho) = -(C_1) / (rho) + C_2$.
    4. BC at $rho=a$: $-(C_1) / (a) + C_2 = 0 arrow.double C_2 = (C_1) / (a)$.
    5. BC at $rho=b$: $-(C_1) / (b) + (C_1) / (a) = V_0 arrow.double C_1 ((b-a) / (a b)) = V_0$.
    6. Solve for constants: $C_1 = (V_0 a b) / (b-a)$ and $C_2 = (V_0 b) / (b-a)$.
  ],
  [
    $u(rho) = (V_0 b) / (b-a) (1 - (a) / (rho))$.
  ],
)

#example(
  "BVP via Eigenfunctions & Green's",
  [
    Solve $(dif^2 u) / (dif x^2) + u = f(x)$ with $u(0)=u(L)=0$ ($L eq.not n pi$). Compare eigenfunction and Green's function methods for $f(x)=sin((2 pi x) / (L))$.
  ],
  [
    1. Eigenfunction: Let $u = sum a_n sin((n pi x) / (L))$. Sub in: $sum a_n (1 - ((n pi)/(L))^2) sin((n pi x) / (L)) = f(x)$.
    2. Coeffs: $a_n = (f_n) / (1 - ((n pi)/(L))^2)$ where $f_n = (2) / (L) integral_0^L f(x) sin((n pi x) / (L)) dif x$.
    3. Green's Function: Homogeneous solutions $u_1 = sin x, u_2 = sin(L-x)$. Wronskian $W = u_1 u_2' - u_1' u_2 = -sin L$.
    4. Form $G$: $G(x,x_0) = (sin x_< sin(L-x_>)) / (sin L)$. Sol is $u(x) = integral_0^L G(x,x_0) f(x_0) dif x_0$.
    5. Comparison: For $f(x)=sin((2 pi x)/(L))$, eigenfunction method isolates $n=2 arrow.double u(x) = (1) / (1 - ((2 pi)/(L))^2) sin((2 pi x) / (L))$.
    6. Green's integral: Integrating $G(x,x_0) sin((2 pi x_0) / (L))$ explicitly recovers the exact same pure $sin((2 pi x) / (L))$ term.
  ],
  [
    Identical solutions from both methods.
  ],
)

#example(
  "Spherical Laplace (Sphere)",
  [
    Solve $nabla^2 Phi = 0$ inside and outside a sphere of radius $R$ where $Phi(R, phi.alt, theta) = cos^2 phi.alt$.
  ],
  [
    1. Symmetry: No $theta$ dependence implies $m=0$. Angular part solved by $P_l (cos phi.alt)$.
    2. Radial: Euler eq yields $f(r) = c_1 r^l + c_2 r^(-l-1)$. Discard $r^(-l-1)$ inside, $r^l$ outside.
    3. Legendre BC: Need $cos^2 phi.alt$. Recall $P_2(x) = (3x^2 - 1)/2 arrow.double x^2 = (2 P_2 + 1)/3$.
    4. Match: $Phi(R) = c_1 R^2 P_2 + c_0 R^0 P_0 = (2) / (3) P_2 + (1) / (3) P_0$. Solve for coefficients.
  ],
  [
    $Phi_("in") = (1) / (3) P_0 + (2) / (3) ((r) / (R))^2 P_2$, $Phi_("out") = (1) / (3) ((R) / (r)) P_0 + (2) / (3) ((R) / (r))^3 P_2$.
  ],
)

#example(
  "Green's Function via Dirac Delta",
  [
    Construct $G(x,x_0)$ for $(dif^2 u) / (dif x^2) = f(x)$ with $u(0)=0$ and $(dif u) / (dif x) (L)=0$.
  ],
  [
    1. Solve: $(dif^2 G) / (dif x^2) = delta(x-x_0)$. $u_< = a x$ (at 0), $u_> = b$ (at L).
    2. Continuity at $x_0$: $u_<(x_0) = u_>(x_0) arrow.double a x_0 = b$.
    3. Jump Condition: $u_>'(x_0) - u_<'(x_0) = (1) / (p(x_0)) arrow.double 0 - a = 1/1 arrow.double a = -1$.
  ],
  [
    $G(x,x_0) = -x$ for $x < x_0$, and $-x_0$ for $x > x_0$.
  ],
)

=== Stability & Robin BCs
#example(
  "Stability & Robin BC",
  accent: color_stability,
  [
    Check stability of $(dif u) / (dif t) = kappa (dif^2 u) / (dif x^2)$ with $u(0,t)=0, ((dif u) / (dif x))(L,t) = -h u(L,t)$.
  ],
  [
    1. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
    2. BC $X(0)=A=0$. Robin BC: $sqrt(lambda) cos(sqrt(lambda) L) = -h sin(sqrt(lambda) L) arrow.double tan(sqrt(lambda) L) = (-sqrt(lambda)) / (h)$.
    3. Stability: We need $lambda > 0$ for decay. If $lambda = -gamma^2 < 0$, then $tanh(gamma L) = (-gamma) / (h)$.
    4. If $h < 0$, let $h = -|h|$. Then $tanh(gamma L) = (gamma) / (|h|)$.
    5. Instability exists if slope of $tanh(gamma L)$ at $0$ is $> (1) / (|h|) arrow.double L > (1) / (|h|)$.
  ],
  [
    Unstable if $h < (-1) / (L)$.
  ],
)

#example(
  "Robin BC Stability Boundary",
  accent: color_stability,
  [
    Solve $partial_t u = k partial_x^2 u$ with $u(0)=0$ and $u'(L) = -h u(L)$. Check roots for the specific case $h L = -1$.
  ],
  [
    1. Spatial: $phi.alt'' + lambda phi.alt = 0$ with $phi.alt(0)=0 arrow.double phi.alt(x) = c_2 sin(sqrt(lambda) x)$.
    2. Robin BC: $sqrt(lambda) cos(sqrt(lambda) L) = -h sin(sqrt(lambda) L) arrow.double tan(sqrt(lambda) L) = -(sqrt(lambda))/(h)$.
    3. Check zero-mode ($lambda = 0$): $phi.alt(x) = a x$. The boundary condition forces $a(1 + h L) = 0$. This means $lambda=0$ is a valid eigenvalue iff $h L = -1$.
    4. Late time behavior ($h L = -1$): All modes with $lambda > 0$ decay exponentially. Only the linear $lambda=0$ mode survives the infinite time limit.
  ],
  [
    If $h L = -1$, the steady-state approaches $u(x,t) arrow A_0 x$. If $h L > -1$, it decays entirely to $0$.
  ],
)
