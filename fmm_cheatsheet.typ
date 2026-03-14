#import "template.typ": cheatsheet

#show: cheatsheet.with(
  title: "FMM - Mathematical Methods for Physics",
  lang: "en",
  columns: 4,
)
#set page(numbering: none)

#let section_rule = line(length: 100%, stroke: 0.5pt + gray.lighten(50%))

== 1. Fundamental PDEs
#section_rule
- *Laplace Eq:* $nabla^2 u = 0$ (Steady state / Equilibrium)
- *Heat Eq:* $(dif u) / (dif t) = k nabla^2 u$ (Diffusion). Decay: $e^(-k lambda t)$.
- *Wave Eq:* $(dif^2 u) / (dif t^2) = c^2 nabla^2 u$ (Oscillation). Sols: $cos(omega t), sin(omega t)$.
- *Helmholtz Eq:* $nabla^2 psi + k^2 psi = 0$. From Wave Eq: $u(bold(r), t) = psi(bold(r)) e^(-i omega t)$.
- *Poisson Eq:* $nabla^2 u = f(bold(r))$ (Inhomogeneous Laplace)

== 2. Separation of Variables (SOV)
#section_rule
*Context:* Linear homogeneous PDE + homogeneous BCs.
1. Assume $u(bold(r), t) = X(bold(r))T(t)$. Yields $N$ ODEs and $N-1$ constants.
2. Substitute & Separate: $((dif T) / (dif t)) / (k T) = (nabla^2 X) / (X) = -lambda$.
3. Solve Spatial BVP: $nabla^2 X + lambda X = 0$ with given BCs.
4. Solve Temporal ODE: $(dif T) / (dif t) + lambda k T = 0 arrow.double T(t) = C e^(-lambda k t)$.
5. Sum Modes: $u(bold(r), t) = sum c_n X_n (bold(r)) T_n (t)$.
6. Apply IC: $u(bold(r), 0) = f(bold(r))$ using Fourier orthogonality.

== 3. Non-Homogeneous Problems
#section_rule
- *Splitting Trick:* If multiple non-homo BCs, split $u = u_1 + u_2 + dots$ where each $u_i$ has only ONE non-homo BC. Sum results.
- *Time-Independent BCs:* $u(x,t) = v(x,t) + u_E (x)$, where $u_E$ is the equilibrium solution ($(dif u_E) / (dif t) = 0$).
- *Time-Dependent BCs:* $u(x,t) = v(x,t) + r(x,t)$, where $r(x,t)$ is a simple reference function (e.g., $A + (x) / (L) (B-A)$) matching the BCs.
- *Inhomogeneous PDE ($L[u] = Q$):* Use *eigenfunction expansion*:
  $u(x,t) = sum a_n (t) phi.alt_n (x)$. Sub into PDE to get ODEs for $a_n (t)$.

== 4. Fourier Series & Orthogonality
#section_rule
$f(x) approx sum c_n phi.alt_n (x) arrow.double c_n = (chevron.l f | phi.alt_n chevron.r) / (chevron.l phi.alt_n | phi.alt_n chevron.r) = (integral_V f phi.alt_n sigma dif V) / (integral_V phi.alt_n^2 sigma dif V)$
- *Double Series ($x in [0,L], y in [0,H]$):*
  $f(x,y) approx sum_("n,m") A_("n,m") phi.alt_n psi_m arrow.double A_("n,m") = (chevron.l f | phi.alt_n psi_m chevron.r) / (chevron.l phi.alt_n psi_m | phi.alt_n psi_m chevron.r) = (integral integral f phi.alt_n psi_m sigma dif x dif y) / (integral integral phi.alt_n^2 psi_m^2 sigma dif x dif y)$
- *The Trick (Ensuring $n=m$):* To isolate $c_m$ in $f = sum c_n phi.alt_n$:
  1. Take inner product with $phi.alt_m$: $chevron.l f | phi.alt_m chevron.r = chevron.l sum c_n phi.alt_n | phi.alt_m chevron.r$
  2. Use linearity: $chevron.l f | phi.alt_m chevron.r = sum c_n chevron.l phi.alt_n | phi.alt_m chevron.r$
  3. Orthogonality: $chevron.l phi.alt_n | phi.alt_m chevron.r = 0$ for $n eq.not m arrow$ only $c_m chevron.l phi.alt_m | phi.alt_m chevron.r$ survives.

== 5. Sturm-Liouville (SL) Theory & Operators
#section_rule
*L-Operator:* $L[u] = nabla dot (p nabla u) - q u = -lambda sigma u$.
- $L$ is *Self-Adjoint* if $integral_V (u L[v] - v L[u]) dif V = 0$.
- *Regular 1D Form:* $-(dif) / (dif x) (p (dif phi.alt) / (dif x)) + q phi.alt = lambda sigma phi.alt$. $p, q, sigma$ real/cont., $p, sigma > 0$.
- *Rayleigh Quotient (Multi-D):*
  #v(2pt)
  $
    lambda = (-integral_S p phi.alt nabla phi.alt dot bold(n) dif S + integral_V [p |nabla phi.alt|^2 + q phi.alt^2] dif V) / (integral_V phi.alt^2 sigma dif V)
  $
  #v(2pt)
- *1D Case ($x in [a,b]$):*
  #v(2pt)
  $
    lambda = ([-p phi.alt (dif phi.alt) / (dif x)]_a^b + integral_a^b [p ((dif phi.alt) / (dif x))^2 + q phi.alt^2] dif x) / (integral_a^b phi.alt^2 sigma dif x)
  $
  #v(2pt)

== 6. Green's Functions (Constructing $G$)
#section_rule
*Definition:* $L[G(bold(r), bold(r)_0)] = delta(bold(r) - bold(r)_0)$ with homogeneous BCs.
- *Direct Method (1D):*
  1. *Homogeneous:* Solve $L[phi.alt] = 0$.
  2. *BCs:* $u_1$ satisfies Left BC, $u_2$ satisfies Right BC.
  3. *Form:* $G(x, x_0) = cases(C u_1(x) u_2(x_0) & x < x_0, C u_1(x_0) u_2(x) & x > x_0)$
  4. *Jump:* $C = (-1) / (p(x_0) W(u_1, u_2)(x_0))$, where $W = u_1 (dif u_2) / (dif x) - (dif u_1) / (dif x) u_2$.
- *Eigenfunction Expansion:*
  $G(bold(r), bold(r)_0) = sum_n (phi.alt_n (bold(r)) phi.alt_n (bold(r)_0)) / (lambda_n N_n)$, where $N_n = integral phi.alt_n^2 sigma dif V$.
- *Inhomogeneous BCs:* If $u(a)=alpha, u(b)=beta$:
  $u = integral G f + [-p alpha (dif G) / (dif x_0)]_(x_0=a) + [p beta (dif G) / (dif x_0)]_(x_0=b)$.

== 7. Standard ODE Solutions
#section_rule
#set text(size: 4.5pt)
#table(
  columns: (0.5fr, 1fr, 1.5fr, 0.8fr),
  inset: 2pt,
  fill: (x, y) => if y == 0 { gray.lighten(80%) },
  [*Geom*], [*Equation Form*], [*General Solutions*], [*Regularity*],
  [Rect. $x$],
  [$(dif^2 phi.alt) / (dif x^2) + lambda phi.alt = 0$],
  [$lambda > 0: A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$\ $lambda = 0: A x + B$\ $lambda < 0: A cosh + B sinh$],
  [$lambda = ((n pi) / (L))^2$ (Dir.)],

  [Cyl. $r$],
  [$r^2 (dif^2 f) / (dif r^2) + r (dif f) / (dif r) + (lambda r^2 - m^2)f = 0$],
  [$lambda > 0: A J_m + B Y_m$\ $lambda = 0: A r^m + B r^(-m)$ ($m=0: ln r$)\ $lambda < 0: A I_m + B K_m$],
  [If $0 in V$: no $Y_m, K_m, ln, r^(-m)$],

  [Sph. $rho$],
  [$(dif) / (dif rho) (rho^2 (dif f) / (dif rho)) + (lambda rho^2 - n(n+1))f = 0$],
  [$lambda > 0: A j_n + B y_n$\ $lambda = 0: A rho^n + B rho^(-(n+1))$],
  [If $0 in V$: no $y_n, rho^(-(n+1))$],

  [Sph. $theta$],
  [$(dif) / (dif x) ((1-x^2) (dif g) / (dif x)) + (lambda - dots)g = 0$],
  [$lambda = n(n+1)$\ $g = A P_n^m (cos theta) + B Q_n^m (cos theta)$],
  [If $0, pi in V$: discard $Q_n^m$],
)
#set text(size: 5pt)

== 8. Practical Tips & Tricks
#section_rule
- *Regularity:* If $|u(0)| < infinity$, discard singular solutions ($Y_m, K_m, Q_n^m, ln r, r^(-n)$).
- *Late Time:* Only the mode with the *smallest* $lambda > 0$ survives.
- *Equilibrium:* Set $(dif u) / (dif t) = 0$ (Heat) or $(dif^2 u) / (dif t^2) = 0$ (Wave) $arrow$ solve $nabla^2 u = f$.
- *Fredholm:* $L[u]=f$ has sol iff $integral f phi.alt_h sigma = 0$ for zero-modes $phi.alt_h$.

== 9. Shortcuts & Universal Solving Steps
#section_rule
- *Coord. Change:* (Cauchy-Euler) $x^2 (dif^2 phi.alt) / (dif x^2) + x (dif phi.alt) / (dif x) + lambda phi.alt = 0 arrow (dif) / (dif x) (x (dif phi.alt) / (dif x)) + (lambda) / (x) phi.alt = 0$. Sub $x = e^z arrow (dif^2 phi.alt) / (dif z^2) + lambda phi.alt(z) = 0$.
- *Eigenvalues ($lambda$):* Check $lambda=0$ (e.g. Neumann BCs). Check $lambda<0$ (e.g. $((dif u) / (dif x))(L)=+h u(L)$).
- *Bessel Zeros:* $z_(m,k) approx (k + (m) / (2) - (1) / (4)) pi$. Small $x: J_m(x) approx (((x) / (2))^m) / (m!)$.
- *Logic for Basis:* $u(0)=0 arrow sin/sinh$; $((dif u) / (dif x))(0)=0 arrow cos/cosh$. $u(L)=0 arrow sin(sqrt(lambda)(L-x))$.
- *Fourier-Bessel ($J_m$):* $f(r) approx sum A_k J_m(z_(m,k) r/a) arrow A_k = ((2) / (a^2 J_(m+1)^2 (z_(m,k)))) integral_0^a f(r) J_m(z_(m,k) (r) / (a)) r dif r$.
- *Orthogonality:* $integral_0^L sin^2((n pi x) / (L)) = (L) / (2)$. $integral_0^pi sin^2(n x) = (pi) / (2)$. $integral_0^pi cos^2(n x) = (pi) / (2)$ (if $n=0$: $pi$).
- *Sanity Checks:* 1. Units. 2. Symmetry. 3. BC Match. 4. Equilibrium.

== 10. Quick Eigenvalue Table ($(dif^2 phi.alt) / (dif x^2) + lambda phi.alt = 0$)
#section_rule
#table(
  columns: (1fr, 1.2fr, 1.5fr),
  inset: 2pt,
  [*BCs ($x=0, L$)*],
  [*Eigenvalues ($lambda_n$)*],
  [*Eigenfunctions ($phi.alt_n$)*],

  [Dirichlet (0, 0)],
  [$((n pi) / (L))^2$],
  [$sin((n pi x) / (L)) quad (n=1,2,...)$],

  [Neumann (0, 0)],
  [$((n pi) / (L))^2$],
  [$cos((n pi x) / (L)) quad (n=0,1,...)$],

  [Mixed (Dir, Neu)],
  [$(((n + (1) / (2)) pi) / (L))^2$],
  [$sin(((n + (1) / (2)) pi x) / (L))$],

  [Mixed (Neu, Dir)],
  [$(((n + (1) / (2)) pi) / (L))^2$],
  [$cos(((n + (1) / (2)) pi x) / (L))$],

  [Periodic],
  [$((2 n pi) / (L))^2$],
  [$1, cos((2 n pi x) / (L)), sin((2 n pi x) / (L))$],
)

== 11. Coordinate Systems ($nabla^2 u$)
#section_rule
- *Cylindrical ($r, theta, z$):*
  $nabla^2 u = ((1) / (r)) (dif) / (dif r) (r (dif u) / (dif r)) + ((1) / (r^2)) (dif^2 u) / (dif theta^2) + (dif^2 u) / (dif z^2)$
- *Spherical ($rho, theta, phi.alt$):* ($theta$=polar, $phi.alt$=azimuthal)
  $nabla^2 u = ((1) / (rho^2)) (dif) / (dif rho) (rho^2 (dif u) / (dif rho)) + ((1) / (rho^2 sin theta)) (dif) / (dif theta) (sin theta (dif u) / (dif theta)) + ((1) / (rho^2 sin^2 theta)) (dif^2 u) / (dif phi.alt^2)$
  - *Radial only:* $nabla^2 u = (((dif^2) / (dif rho^2)) (rho u)) / (rho)$

== 12. Special Function Identities
#section_rule
- *Bessel:* $(dif) / (dif x) (x^n J_n(x)) = x^n J_(n-1)(x)$ and $(dif) / (dif x) (x^(-n) J_n(x)) = -x^(-n) J_(n+1)(x)$
  - $integral x J_0(x) dif x = x J_1(x)$
- *Legendre:* $P_n(1)=1, P_n(-1)=(-1)^n, P_0=1, P_1=x, P_2 = (1) / (2) (3x^2-1)$
  - *Orthogonality:* $integral_(-1)^1 P_n (x) P_m (x) dif x = (2) / (2n+1) delta_("n,m")$

== 13. Mathematical Toolkit
#section_rule
- *Trig:* $sin A cos B = (1) / (2) [sin(A+B) + sin(A-B)]$
  - $sin^2 x = (1 - cos 2x) / (2)$, $cos^2 x = (1 + cos 2x) / (2)$
- *Common Integrals:*
  - $integral_0^L x sin((n pi x) / (L)) dif x = ((-1)^(n+1) L^2) / (n pi)$
  - $integral_0^L x cos((n pi x) / (L)) dif x = (L^2) / (n^2 pi^2) ((-1)^n - 1)$
  - $integral x^2 sin x dif x = 2x sin x - (x^2-2) cos x$

== 14. Numerical "Must-Haves"
#section_rule
- *Bessel Zeros ($J_m(z_(m,k))=0$):*
  - $J_0: z approx 2.405, 5.520, 8.654$
  - $J_1: z approx 3.832, 7.016, 10.173$
- *Values:* $J_0(0)=1, J_n(0)=0$ for $n>0$.
- *Stirling:* $n! approx sqrt(2 pi n) ((n) / (e))^n$.

== 15. Strategy: Inhomogeneous PDEs
#section_rule
*Goal:* Solve $L[u] = f(bold(r), t)$ with BC $u(S) = g(S)$.
1. *Homogenize BCs:* Find a simple $w(bold(r))$ that satisfies the BCs. Let $v = u - w$.
2. *New PDE:* $v$ satisfies $L[v] = f - L[w]$ with *homogeneous* BCs.
3. *Expand:* Let $v = sum a_n(t) phi.alt_n (bold(r))$, where $phi.alt_n$ are eigenfunctions of the *spatial* part.
4. *ODE:* Plug into PDE arrow.double $(dif a_n) / (dif t) + k lambda_n a_n(t) = f_n(t)$ (for Heat). Solve via Integrating Factor.

#pagebreak()

== Worked Examples (Step-by-Step)
#section_rule

=== Example 1: Fourier Series & Fredholm
*Question:* (a) Find the Fourier cosine series for $f(x)=x^2$ on $[0,1]$. (b) Determine the condition for sine series continuity. (c) Use Fredholm Alternative to check if $(dif^2 u) / (dif x^2) + 4u = cos x$ with $u'(0)=u'(pi)=0$ has a solution.

*Steps:*
1. (a) Cosine series means even extension, $L=1$. $a_0 = (1) / (L) integral_0^L f(x) dif x = (1) / (1) integral_0^1 x^2 dif x = [ (x^3) / (3) ]_0^1 = (1) / (3)$.
2. $a_n = (2) / (L) integral_0^L f(x) cos((n pi x) / (L)) dif x = 2 integral_0^1 x^2 cos(n pi x) dif x$. Integrate by parts twice:
  $a_n = 2 [ (x^2 sin(n pi x)) / (n pi) ]_0^1 - 4 integral_0^1 (x sin(n pi x)) / (n pi) dif x = 0 - (4) / (n pi) [ -(x cos(n pi x)) / (n pi) + (sin(n pi x)) / (n^2 pi^2) ]_0^1$.
3. Evaluate: $a_n = (4 cos(n pi)) / (n^2 pi^2) = (4 (-1)^n) / (n^2 pi^2)$.
4. (b) Sine series uses odd extension. For continuity, we need $f$ continuous on $[0,L]$ and $f(0) = f(L) = 0$ to avoid jumps at the extension boundaries.
5. (c) Homogeneous: $(dif^2 phi.alt) / (dif x^2) + 4 phi.alt = 0 arrow.double phi.alt(x) = A cos(2x) + B sin(2x)$.
6. BCs: $phi.alt'(0) = 2B = 0 arrow.double B=0$. $phi.alt'(pi) = -2A sin(2 pi) = 0 arrow.double A$ is free. Zero-mode $phi.alt_h = cos(2x)$.
7. Fredholm: Solution exists if $chevron.l cos x | cos(2x) chevron.r = integral_0^pi cos x cos(2x) dif x = 0$.
8. Integral: $integral_0^pi (1) / (2) (cos(3x) + cos x) dif x = [ (1) / (2) ((sin(3x)) / (3) + sin x) ]_0^pi = 0$.

*Result:* (a) $f(x) = (1) / (3) + sum_(n=1)^(infinity) ((4 (-1)^n) / (n^2 pi^2)) cos(n pi x)$. (b) Continuous iff $f(0)=f(L)=0$. (c) Solution exists.

=== Example 2: 2D Heat Rectangle
*Question:* Solve $(dif u) / (dif t) = k nabla^2 u$ on $[0,L] times [0,H]$ with $((dif u) / (dif x))(0)=((dif u) / (dif x))(L)=0$ and $u(x,0,t)=u(x,H,t)=0$.

*Steps:*
1. SOV $u(x,y,t) = X(x)Y(y)T(t) arrow.double ((dif T) / (dif t)) / (k T) = ((dif^2 X) / (dif x^2)) / (X) + ((dif^2 Y) / (dif y^2)) / (Y) = -lambda$.
2. Spatial $X$: $(dif^2 X) / (dif x^2) + lambda_x X = 0 arrow.double X(x) = A cos(sqrt(lambda_x) x) + B sin(sqrt(lambda_x) x)$.
3. BCs: $X'(0) = sqrt(lambda_x) B = 0 arrow.double B=0$. $X'(L) = -A sqrt(lambda_x) sin(sqrt(lambda_x) L) = 0 arrow.double sqrt(lambda_x) = (n pi) / (L)$.
4. Spatial $Y$: $(dif^2 Y) / (dif y^2) + lambda_y Y = 0 arrow.double Y(y) = C cos(sqrt(lambda_y) y) + D sin(sqrt(lambda_y) y)$.
5. BCs: $Y(0) = C = 0$. $Y(H) = D sin(sqrt(lambda_y) H) = 0 arrow.double sqrt(lambda_y) = (m pi) / (H)$.
6. Temporal: $(dif T) / (dif t) = -k (lambda_x + lambda_y) T arrow.double T(t) = E e^(-k lambda_("n,m") t)$.

*Result:* $u_("n,m") = cos((n pi x) / (L)) sin((m pi y) / (H)) e^(-k lambda_("n,m") t)$ where $lambda_("n,m") = ((n pi) / (L))^2 + ((m pi) / (H))^2$.

=== Example 3: Cauchy-Euler Sturm-Liouville
*Question:* Solve $x^2 (dif^2 phi.alt) / (dif x^2) + x (dif phi.alt) / (dif x) + lambda phi.alt = 0$ on $[1, b]$ with $phi.alt(1)=phi.alt(b)=0$.

*Steps:*
1. SL-Form: $(dif) / (dif x) (x (dif phi.alt) / (dif x)) + (lambda) / (x) phi.alt = 0 arrow.double p=x, sigma=(1) / (x)$.
2. Transform $x = e^z arrow.double z = ln x$. ODE becomes $(dif^2 phi.alt) / (dif z^2) + lambda phi.alt = 0$.
3. General sol: $phi.alt(z) = A cos(sqrt(lambda) z) + B sin(sqrt(lambda) z)$.
4. BC at $x=1 (z=0)$: $phi.alt(0) = A(1) + B(0) = 0 arrow.double A=0$.
5. BC at $x=b (z=ln b)$: $phi.alt(ln b) = B sin(sqrt(lambda) ln b) = 0 arrow.double sqrt(lambda) ln b = n pi$.

*Result:* $phi.alt_n (x) = sin((n pi ln x) / (ln b))$ with $lambda_n = ((n pi) / (ln b))^2$.

=== Example 4: Damped Wave (Friction)
*Question:* Solve $rho (dif^2 u) / (dif t^2) = T_0 (dif^2 u) / (dif x^2) + beta (dif u) / (dif t)$ with $u(0,t)=u(L,t)=0$.

*Steps:*
1. SOV $u = X(x)T(t) arrow.double ((dif^2 X) / (dif x^2)) / (X) = (rho (dif^2 T) / (dif t^2) - beta (dif T) / (dif t)) / (T_0 T) = -lambda$.
2. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
3. BCs: $X(0) = A = 0$. $X(L) = B sin(sqrt(lambda) L) = 0 arrow.double sqrt(lambda) = (n pi) / (L)$.
4. Temporal: $rho (dif^2 T) / (dif t^2) - beta (dif T) / (dif t) + T_0 lambda_n T = 0$.
5. Char Eq: $rho r^2 - beta r + T_0 lambda_n = 0 arrow.double r = (beta plus.minus sqrt(beta^2 - 4 rho T_0 lambda_n)) / (2 rho)$.

*Result:* $u_n(x,t) = sin((n pi x) / (L)) e^((beta t) / (2 rho)) (dots)$. Motion is underdamped if $beta^2 < 4 rho T_0 lambda_n$.

=== Example 5: Quarter Disk Membrane
*Question:* Find frequencies for $(dif^2 u) / (dif t^2) = c^2 nabla^2 u$ on $0 < theta < (pi) / (2), 0 < r < b$ with $u=0$ on all boundaries.

*Steps:*
1. SOV $u = R(r)Theta(theta)T(t) arrow.double ((dif^2 Theta) / (dif theta^2)) / (Theta) = -mu$.
2. Angular: $(dif^2 Theta) / (dif theta^2) + mu Theta = 0 arrow.double Theta(theta) = A cos(sqrt(mu) theta) + B sin(sqrt(mu) theta)$.
3. BCs: $Theta(0) = A = 0$. $Theta((pi) / (2)) = B sin(sqrt(mu) (pi) / (2)) = 0 arrow.double sqrt(mu) = 2m$.
4. Radial: $r^2 (dif^2 R) / (dif r^2) + r (dif R) / (dif r) + (lambda r^2 - (2m)^2) R = 0$.
5. General Sol: $R(r) = C J_(2m)(sqrt(lambda) r) + D Y_(2m)(sqrt(lambda) r)$.
6. Regularity: $R(0)$ finite arrow.double $D = 0$.
7. BC: $R(b) = C J_(2m)(sqrt(lambda) b) = 0 arrow.double sqrt(lambda) = (z_("2m,k")) / (b)$.

*Result:* $omega_("m,k") = (c z_("2m,k")) / (b)$. Fundamental mode is $m=1, k=1$.

=== Example 6: Poisson Eq (Inhomogeneity)
*Question:* Solve $nabla^2 u = f(x,y)$ on rectangle $[0,L] times [0,H]$ with $u(x,H)=g(x)$ and other boundaries zero.

*Steps:*
1. Split $u = u_("bulk") + u_("bound")$. $nabla^2 u_("bulk") = f$ (zero BCs) and $nabla^2 u_("bound") = 0$ ($u_("bound")(x,H)=g(x)$).
2. Bulk: Expand $u_("bulk") = sum_("n,m") A_("n,m") sin((n pi x) / (L)) sin((m pi y) / (H))$.
3. Sub into PDE: $sum A_("n,m") (-lambda_("n,m")) sin phi_n sin psi_m = f(x,y)$.
4. $A_("n,m") = (-1) / (lambda_("n,m")) (chevron.l f | sin phi_n sin psi_m chevron.r) / (chevron.l sin phi_n sin psi_m | sin phi_n sin psi_m chevron.r)$.
5. Bound: $u_("bound") = sum B_n sin((n pi x) / (L)) sinh((n pi y) / (L))$.
6. BC: $u_("bound")(x,H) = sum B_n sin((n pi x) / (L)) sinh((n pi H) / (L)) = g(x) arrow.double B_n = (g_n) / (sinh((n pi H) / (L)))$.

*Result:* $u = u_("bulk") + u_("bound")$.

=== Example 7: Inhomog. Heat & Avg Temp
*Question:* Solve $(dif u) / (dif t) = kappa (dif^2 u) / (dif x^2) + Q(x,t)$ with $u(0,t)=T_1, u(L,t)=T_2$.

*Steps:*
1. Shift: $w(x) = T_1 + (x) / (L) (T_2 - T_1)$. Let $v = u - w$.
2. New PDE: $(dif v) / (dif t) = kappa (dif^2 v) / (dif x^2) + Q(x,t)$ with $v(0)=v(L)=0$.
3. Expand $v = sum a_n (t) sin((n pi x) / (L))$. Sub into PDE arrow.double $sum [a'_n + kappa lambda_n a_n] sin phi_n = Q$.
4. ODE: $(dif a_n) / (dif t) + kappa lambda_n a_n = q_n(t)$, solve via Integrating Factor $e^(kappa lambda_n t)$.
5. Avg Temp: $T_("avg") (t) = (1) / (L) integral_0^L u(x,t) dif x$.

*Result:* $u(x,t) = w(x) + sum a_n (t) sin((n pi x) / (L))$.

=== Example 8: Thick Spherical Shell
*Question:* Solve $nabla^2 u = 0$ for $a <= rho <= b$ with $u(a)=0, u(b)=V_0$.

*Steps:*
1. Radial Laplace: $(dif) / (dif rho) (rho^2 (dif u) / (dif rho)) = 0$.
2. Integrate: $rho^2 (dif u) / (dif rho) = C_1 arrow.double (dif u) / (dif rho) = (C_1) / (rho^2)$.
3. Integrate again: $u(rho) = -(C_1) / (rho) + C_2$.
4. BC at $rho=a$: $-(C_1) / (a) + C_2 = 0 arrow.double C_2 = (C_1) / (a)$.
5. BC at $rho=b$: $-(C_1) / (b) + (C_1) / (a) = V_0 arrow.double C_1 ((b-a) / (a b)) = V_0$.
6. Solve for constants: $C_1 = (V_0 a b) / (b-a)$ and $C_2 = (V_0 b) / (b-a)$.

*Result:* $u(rho) = (V_0 b) / (b-a) (1 - (a) / (rho))$.

=== Example 9: Wave Eq Resonance
*Question:* Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2)$ with $u(0,t)=0, u(L,t)=sin(omega t)$.

*Steps:*
1. Reference: $w(x,t) = (x) / (L) sin(omega t)$. Let $v = u - w$.
2. New PDE: $(dif^2 v) / (dif t^2) - c^2 (dif^2 v) / (dif x^2) = -(dif^2 w) / (dif t^2) = (x / L) omega^2 sin(omega t)$.
3. Expand $v = sum a_n(t) sin((n pi x) / (L)) arrow.double a_n'' + omega_n^2 a_n = q_n sin(omega t)$.
4. Particular: $a_n (t) = (q_n) / (omega_n^2 - omega^2) sin(omega t)$.
5. Resonance: If $omega arrow omega_n = (n pi c) / (L)$, then $a_n (t) prop t cos(omega_n t)$.

*Result:* $u$ grows linearly if driving $omega$ matches an eigenfrequency $omega_n$.

=== Example 10: Stability & Robin BC
*Question:* Check stability of $(dif u) / (dif t) = kappa (dif^2 u) / (dif x^2)$ with $u(0,t)=0, ((dif u) / (dif x))(L,t) = -h u(L,t)$.

*Steps:*
1. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
2. BC $X(0)=A=0$. Robin BC: $sqrt(lambda) cos(sqrt(lambda) L) = -h sin(sqrt(lambda) L) arrow.double tan(sqrt(lambda) L) = (-sqrt(lambda)) / (h)$.
3. Stability: We need $lambda > 0$ for decay. If $lambda = -gamma^2 < 0$, then $tanh(gamma L) = (-gamma) / (h)$.
4. If $h < 0$, let $h = -|h|$. Then $tanh(gamma L) = (gamma) / (|h|)$.
5. Instability exists if slope of $tanh(gamma L)$ at $0$ is $> (1) / (|h|) arrow.double L > (1) / (|h|)$.

*Result:* Unstable if $h < (-1) / (L)$.

=== Example 11: Mixed BCs (1D Wave)
*Question:* Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2)$ with $u(0) - ((dif u) / (dif x))(0) = 0, ((dif u) / (dif x))(L) = 0$.

*Steps:*
1. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
2. BC at $x=0$: $X(0) - X'(0) = A - sqrt(lambda) B = 0 arrow.double A = sqrt(lambda) B$.
3. BC at $x=L$: $X'(L) = -A sqrt(lambda) sin(sqrt(lambda) L) + B sqrt(lambda) cos(sqrt(lambda) L) = 0$.
4. Substitute $A$: $sqrt(lambda) B [ -sqrt(lambda) sin(sqrt(lambda) L) + cos(sqrt(lambda) L) ] = 0$.

*Result:* Eigenvalues satisfy $tan(sqrt(lambda) L) = (1) / (sqrt(lambda))$.

=== Example 12: Heat Eq in Disk (Radial)
*Question:* Solve $(dif u) / (dif t) = kappa nabla^2 u$ on $r <= a$ with $u(a,t)=0, u(r,0)=f(r)$.

*Steps:*
1. Radial: $r^2 (dif^2 R) / (dif r^2) + r (dif R) / (dif r) + lambda r^2 R = 0 arrow.double R(r) = A J_0(sqrt(lambda) r) + B Y_0(sqrt(lambda) r)$.
2. Regularity: $R(0)$ finite arrow.double $B=0$. BC: $R(a) = J_0(sqrt(lambda) a) = 0 arrow.double sqrt(lambda) = (z_("0,k")) / (a)$.
3. Expansion: $u(r,t) = sum A_k J_0((z_("0,k") r) / (a)) e^(-kappa lambda_k t)$.
4. Coeffs: $A_k = (chevron.l f | J_0 chevron.r) / (chevron.l J_0 | J_0 chevron.r) = (integral_0^a f J_0 r dif r) / (integral_0^a J_0^2 r dif r)$.


*Result:* $u(r,t) = sum A_k J_0((z_("0,k") r) / (a)) e^(-kappa ((z_("0,k")) / (a))^2 t)$.

=== Example 13: Mixed Heat Rod
*Question:* Solve Heat Eq with $u(0,t)=0$ (fixed) and $((dif u) / (dif x))(L,t)=0$ (insulated).

*Steps:*
1. Spatial: $(dif^2 X) / (dif x^2) + lambda X = 0 arrow.double X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
2. BC $X(0) = A = 0$. BC $X'(L) = B sqrt(lambda) cos(sqrt(lambda) L) = 0$.
3. Solve: $sqrt(lambda) L = (n + (1) / (2)) pi arrow.double lambda_n = (((n + (1) / (2)) pi) / (L))^2$.
4. Temporal: $T(t) = C e^(-kappa lambda_n t)$.

*Result:* $u_n = sin(((n + (1) / (2)) pi x) / (L)) e^(-kappa lambda_n t)$.

