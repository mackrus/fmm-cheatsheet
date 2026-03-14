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
- *Heat Eq:* $partial_t u = k nabla^2 u$ (Diffusion). Decay: $e^(-k lambda t)$.
- *Wave Eq:* $partial_t^2 u = c^2 nabla^2 u$ (Oscillation). Sols: $cos(omega t), sin(omega t)$.
- *Helmholtz Eq:* $nabla^2 psi + k^2 psi = 0$. From Wave Eq: $u(bold(r), t) = psi(bold(r)) e^(-i omega t)$.
- *Poisson Eq:* $nabla^2 u = f(bold(r))$ (Inhomogeneous Laplace)

== 2. Separation of Variables (SOV)
#section_rule
*Context:* Linear homogeneous PDE + homogeneous BCs.
1. Assume $u(bold(r), t) = X(bold(r))T(t)$. Yields $N$ ODEs and $N-1$ constants.
2. Substitute & Separate: $T' / (k T) = (nabla^2 X) / X = -lambda$.
3. Solve Spatial BVP: $nabla^2 X + lambda X = 0$ with given BCs.
4. Solve Temporal ODE: $T' + lambda k T = 0 arrow.double T(t) = C e^(-lambda k t)$.
5. Sum Modes: $u(bold(r), t) = sum c_n X_n (bold(r)) T_n (t)$.
6. Apply IC: $u(bold(r), 0) = f(bold(r))$ using Fourier orthogonality.

== 3. Non-Homogeneous Problems
#section_rule
- *Splitting Trick:* If multiple non-homo BCs, split $u = u_1 + u_2 + dots$ where each $u_i$ has only ONE non-homo BC. Sum results.
- *Time-Independent BCs:* $u(x,t) = v(x,t) + u_E (x)$, where $u_E$ is the equilibrium solution ($partial_t u_E = 0$).
- *Time-Dependent BCs:* $u(x,t) = v(x,t) + r(x,t)$, where $r(x,t)$ is a simple reference function (e.g., $A + x/L(B-A)$) matching the BCs.
- *Inhomogeneous PDE ($L[u] = Q$):* Use *eigenfunction expansion*:
  $u(x,t) = sum a_n (t) phi.alt_n (x)$. Sub into PDE to get ODEs for $a_n (t)$.

== 4. Fourier Series & Orthogonality
#section_rule
$f(x) approx sum c_n phi.alt_n (x) arrow.double c_n = (integral_V f phi.alt_n sigma dif V) / (integral_V phi.alt_n^2 sigma dif V)$
- *Double Series ($x in [0,L], y in [0,H]$):*
  $f(x,y) approx sum_(n,m) A_(n m) phi.alt_n (x) psi_m (y)$
  $A_(n m) = (integral integral f phi.alt_n psi_m sigma dif x dif y) / (integral integral phi.alt_n^2 psi_m^2 sigma dif x dif y)$

== 5. Sturm-Liouville (SL) Theory
#section_rule
*General Form:* $nabla dot (p nabla phi.alt) - q phi.alt + lambda sigma phi.alt = 0$
- *Regular 1D:* $-(p phi.alt')' + q phi.alt = lambda sigma phi.alt$. $p, q, sigma$ real/cont., $p, sigma > 0$.
- *Rayleigh Quotient (Multi-D):*
  $lambda = (-integral_S p phi.alt nabla phi.alt dot bold(n) dif S + integral_V [p |nabla phi.alt|^2 + q phi.alt^2] dif V) / (integral_V phi.alt^2 sigma dif V)$
  - 1D ($x in [a,b]$): $lambda = ([-p phi.alt phi.alt']_a^b + integral_a^b [p (phi.alt')^2 + q phi.alt^2] dif x) / (integral_a^b phi.alt^2 sigma dif x)$

== 6. Green's Functions (Constructing $G$)
#section_rule
*Definition:* $L[G(bold(r), bold(r)_0)] = delta(bold(r) - bold(r)_0)$ with homogeneous BCs.
- *Direct Method (1D):*
  1. *Homogeneous:* Solve $L[phi.alt] = 0$.
  2. *BCs:* $u_1$ satisfies Left BC, $u_2$ satisfies Right BC.
  3. *Form:* $G(x, x_0) = cases(C u_1(x) u_2(x_0) & x < x_0, C u_1(x_0) u_2(x) & x > x_0)$
  4. *Jump:* $C = -1 / (p(x_0) W(u_1, u_2)(x_0))$, where $W = u_1 u_2' - u_1' u_2$.
- *Eigenfunction Expansion:*
  $G(bold(r), bold(r)_0) = sum_n (phi.alt_n (bold(r)) phi.alt_n (bold(r)_0)) / (lambda_n N_n)$, where $N_n = integral phi.alt_n^2 sigma dif V$.
- *Inhomogeneous BCs:* If $u(a)=alpha, u(b)=beta$:
  $u = integral G f + [-p alpha partial_(x_0) G]_(x_0=a) + [p beta partial_(x_0) G]_(x_0=b)$.

== 7. Standard ODE Solutions
#section_rule
#set text(size: 4.5pt)
#table(
  columns: (0.5fr, 1fr, 1.5fr, 0.8fr),
  inset: 2pt,
  fill: (x, y) => if y == 0 { gray.lighten(80%) },
  [*Geom*], [*Equation Form*], [*General Solutions*], [*Regularity*],
  [Rect. $x$],
  [$phi.alt'' + lambda phi.alt = 0$],
  [$lambda > 0: A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$\ $lambda = 0: A x + B$\ $lambda < 0: A cosh + B sinh$],
  [$lambda = (n pi / L)^2$ (Dir.)],

  [Cyl. $r$],
  [$r^2 f'' + r f' + (lambda r^2 - m^2)f = 0$],
  [$lambda > 0: A J_m + B Y_m$\ $lambda = 0: A r^m + B r^(-m)$ ($m=0: ln r$)\ $lambda < 0: A I_m + B K_m$],
  [If $0 in V$: no $Y_m, K_m, ln, r^(-m)$],

  [Sph. $rho$],
  [$(rho^2 f')' + (lambda rho^2 - n(n+1))f = 0$],
  [$lambda > 0: A j_n + B y_n$\ $lambda = 0: A rho^n + B rho^(-(n+1))$],
  [If $0 in V$: no $y_n, rho^(-(n+1))$],

  [Sph. $theta$],
  [$((1-x^2)g')' + (lambda - dots)g = 0$],
  [$lambda = n(n+1)$\ $g = A P_n^m (cos theta) + B Q_n^m (cos theta)$],
  [If $0, pi in V$: discard $Q_n^m$],
)
#set text(size: 5pt)

== 8. Practical Tips & Tricks
#section_rule
- *Regularity:* If $|u(0)| < infinity$, discard singular solutions ($Y_m, K_m, Q_n^m, ln r, r^(-n)$).
- *Late Time:* Only the mode with the *smallest* $lambda > 0$ survives.
- *Equilibrium:* Set $partial_t u = 0$ (Heat) or $partial_t^2 u = 0$ (Wave) $arrow$ solve $nabla^2 u = f$.
- *Fredholm:* $L[u]=f$ has sol iff $integral f phi.alt_h sigma = 0$ for zero-modes $phi.alt_h$.

== 9. Shortcuts & Universal Solving Steps
#section_rule
- *Coord. Change:* (Cauchy-Euler) $x^2 phi.alt'' + x phi.alt' + lambda phi.alt = 0 arrow (x phi.alt')' + (lambda/x) phi.alt = 0$. Sub $x = e^z arrow phi.alt''(z) + lambda phi.alt(z) = 0$.
- *Eigenvalues ($lambda$):* Check $lambda=0$ (e.g. Neumann BCs). Check $lambda<0$ (e.g. $u'(L)=+h u(L)$).
- *Bessel Zeros:* $z_{m,k} approx (k + m/2 - 1/4) pi$. Small $x: J_m(x) approx (x/2)^m / m!$.
- *Logic for Basis:* $u(0)=0 arrow sin/sinh$; $u'(0)=0 arrow cos/cosh$. $u(L)=0 arrow sin(sqrt(lambda)(L-x))$.
- *Fourier-Bessel ($J_m$):* $f(r) approx sum A_k J_m(z_{m,k} r/a) arrow A_k = (2/ (a^2 J_{m+1}^2 (z_{m,k}))) integral_0^a f(r) J_m(z_{m,k} r/a) r dif r$.
- *Orthogonality:* $integral_0^L sin^2(n pi x / L) = L/2$. $integral_0^pi sin^2(n x) = pi/2$. $integral_0^pi cos^2(n x) = pi/2$ (if $n=0$: $pi$).
- *Sanity Checks:* 1. Units. 2. Symmetry. 3. BC Match. 4. Equilibrium.

#pagebreak()

== Worked Examples (Step-by-Step)
#section_rule

=== Example 1: Conceptual & Shorties
*(a) Cosine series $x^2$:* Find series for $f(x)=x^2$ on $[0, 1]$. Extend evenly to $[-1, 1]$, then periodically. Result: continuous parabola segments.
*(b) Sine series continuity:* Continuous iff $f$ is continuous AND $f(0)=f(L)=0$.
*(c) Fredholm Alt:* $u'' + 4u = cos x, u'(0)=u'(pi)=0$. Zero-mode $phi.alt_h = cos(2x)$. Check $integral_0^pi cos x cos(2x) dif x = 0$. Since zero, sol exists (but not unique).

=== Example 2: 2D Heat Rectangle
$partial_t u = k nabla^2 u$ on $[0,L] times [0,H]$. BCs: $u_x(0)=u_x(L)=0$ (insul); $u(x,0)=u(x,H)=0$ (zero).
1. *SOV:* $u = X(x)Y(y)T(t)$. $X_n = cos(n pi x / L), Y_m = sin(m pi y / H)$.
2. *Eigenvalues:* $lambda_(n,m) = (n pi / L)^2 + (m pi / H)^2$.
3. *Coeffs:* $a_{n,m} = 4/(L H) integral_0^H integral_0^L f(x,y) cos(n pi x / L) sin(m pi y / H) dif x dif y$.
4. *Dominant:* $n=0, m=1 arrow lambda = (pi / H)^2$. $u approx a_{0,1} e^(-k (pi/H)^2 t) sin(pi y / H)$.

=== Example 3: Cauchy-Euler SL
$x^2 phi.alt'' + x phi.alt' + lambda phi.alt = 0, phi.alt(1)=phi.alt(b)=0$.
1. *Form:* Multiply by $1/x arrow (x phi.alt')' + (lambda/x) phi.alt = 0$. $p=x, sigma=1/x$.
2. *Rayleigh:* $lambda = (integral_1^b x(phi.alt')^2) / (integral_1^b phi.alt^2 / x) > 0$.
3. *Solve:* $x=e^z arrow phi.alt = sin(n pi z / ln b) = sin(n pi ln x / ln b)$. $lambda_n = (n pi / ln b)^2$.

=== Example 4: Damped Wave (Friction)
$rho partial_t^2 u = T_0 partial_x^2 u + beta partial_t u$ ($beta < 0$).
1. *SOV:* $T'' - (beta/rho)T' + (lambda T_0 / rho)T = 0$.
2. *Roots:* $r = 1/2 (c plus.minus sqrt(c^2 - 4 lambda T_0 / rho))$ where $c = beta/rho < 0$.
3. *Cases:* Small $lambda arrow$ Overdamped (Pure decay). Large $lambda arrow$ Underdamped (Oscillatory decay).

=== Example 5: Quarter Disk Membrane
$partial_t^2 u = c^2 nabla^2 u$ on $0 < theta < pi / 2, 0 < r < b$. $u=0$ on all boundaries.
1. *Theta:* $Theta_m = sin(2 m theta), mu_m = (2 m)^2$.
2. *Radial:* $R(r) = J_{2m}(sqrt(lambda) r)$. BC $R(b)=0 arrow sqrt(lambda) = z_{2m,k}/b$.
3. *Freqs:* $omega_{m,k} = c z_{2m,k}/b$.

=== Example 6: Poisson & Green (Rectangle)
$nabla^2 u = f(x,y)$, $u(x,L)=g(x)$, others zero.
1. *Bulk:* $u_b = sum sum A_{n,m} phi.alt_{n,m}(x,y)$ where $A_{n,m} = f_{n,m} / (-lambda_{n,m})$.
2. *Boundary:* $u_s$ via SOV ($sinh$ in $y$, $sin$ in $x$). $u_s = sum B_n sin(n pi x / L) sinh(n pi y / L) / sinh(n pi L)$.

=== Example 7: Inhomog. Heat & Avg Temp
$partial_t u = kappa partial_x^2 u + Q(x,t)$.
1. *Ref:* $r(x) = u_0 + (u_L - u_0) x/L$ to fix non-homo BCs.
2. *Expansion:* $v = u - r = sum a_n(t) sin(n pi x / L)$. ODE: $a_n' + kappa lambda_n a_n = q_n(t)$.
3. *Avg Temp:* $d / (d t) integral_0^1 u dif x = kappa [u_x]_0^1 + integral_0^1 Q dif x$.

=== Example 8: Thick Spherical Shell
$nabla^2 u = 0$ on $a <= r <= b$. $u(a)=0, u(b)=1$.
1. *SOV:* Only $n=0$ survives due to symmetry. $u = A + B/r$.
2. *Match:* $A + B/a = 0, A + B/b = 1 arrow B = (1/b - 1/a)^(-1) = (a b)/(a-b)$.
3. *Trick:* $u(r) = (r^n - a^{2n+1}r^{-n-1})$ grouping for $u(a)=0$.
4. *Result:* $u(r) = (1 - a/r) / (1 - a/b)$.

=== Example 9: Wave Eq Resonance
$u_{t t} = c^2 u_{x x}, u(L,t)=sin(omega t)$.
1. *Ref:* $r = (x/L) sin(omega t)$. $v = u-r$ has source $omega^2 (x/L) sin(omega t)$.
2. *Resonance:* If $omega = n pi c / L$, then $a_n(t)$ grows as $t sin(omega t)$.

=== Example 10: Stability & Robin BC
$u_t = k u_{x x}, u_x(L) = -h u(L)$.
1. *SOV:* $tan(sqrt(lambda) L) = -sqrt(lambda)/h$.
2. *Instability:* If $h < -1/L$, then $lambda < 0$ exists ($tanh$ intersection) $arrow$ $u arrow infinity$.

=== Example 11: Mixed BCs (1D Wave)
$u_{t t} = c^2 u_{x x}, u(0)-u_x(0)=0, u_x(L)=0$.
1. *Eigenvalues:* $tan(sqrt(lambda) L) = 1/sqrt(lambda)$.
2. *Large $lambda$:* $tan z approx 0 arrow sqrt(lambda) L approx n pi$.

=== Example 12: Heat Eq in Disk
$u_t = k nabla^2 u, u(a)=0$.
1. *SOV:* $u = sum sum A_{m,k} J_m(z_{m,k} r/a) e^(-k lambda t) cos(m theta)$.
2. *Dominant:* $J_0$ mode with $z_{0,1} approx 2.4048$.

=== Example 13: Mixed Heat Rod
$u_t = kappa u_{x x}, u(0)=0, u_x(1)=0$.
1. *SOV:* $X = sin(sqrt(lambda) x)$. $u_x(1) = cos(sqrt(lambda)) = 0 arrow sqrt(lambda) = (n+1/2) pi$.
2. *Late Time:* $u approx A_0 sin(pi x / 2) e^(-kappa pi^2 / 4 t)$.
