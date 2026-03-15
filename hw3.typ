#import "template.typ": homework
#show: homework.with(
  course: "Mathematical methods for physics",
  title: "Homework 3",
)

#let T = $(partial^2 u) / (partial t^2)$
#let F1 = $(partial^2 u) / (partial r^2)$
#let F2 = $1/r (partial u) / (partial r)$
#let F3 = $1/r^2 (partial^2 u) / (partial theta^2)$
#let F4 = $(partial^2 u) / (partial z^2)$

= Problem 1:

We want to solve the three-dimensional wave equation for the displacement $u(r, theta, z, t)$ within a cylindrical volume. The volume is defined by the radius $0 < r < a$ and the height $0 < z < H$. The wave equation in cylindrical coordinates is given by:

$ #T = c^2 ( #F1 + #F2 + #F3 + #F4 ) $ <eq:pde>

where $c$ is the wave propagation speed.

== Boundary and Initial Conditions

To find a unique solution, we must satisfy the constraints of the system:

=== BCs
- *$r$*: The cylinder's outer wall is fixed, $u(a, theta, z, t) = 0$.
- *$theta$*: The function of $theta$ is periodic: $u(r, theta, z, t) = u(r, theta + 2 pi, z, t)$.
- *$z$*: The top and bottom of the cylinder are also fixed: $u(r, theta, 0, t) = u(r, theta, H, t) = 0$.

=== ICs
- *$u(dots, t)$*: At $t=0$, the initial value is $u(r, theta, z, 0) = r(a-r) cos(theta) sin((pi z)/ H)$.
- *$(partial u)/(partial t)(dots, t)$*: The initial velocity is zero, $(partial u) / (partial t)(r, theta, z, 0) = 0$.

== Separation of Variables

Because the *BCs* are homogenous and there are no sources, we can use separation of variables:
$ u(r, theta, z, t) = phi.alt(r, theta, z)h(t) = f(r)g(theta)k(z)h(t) $

Substituting this into the PDE @eq:pde:
$ f g k h'' = c^2 ( f'' g k h + 1/r f' g k h + 1/r^2 f g'' k h + f g k'' h ) $

Dividing by $c^2 f g k h$ (assuming $u eq 0$):
$
  (h'') / (c^2 h) = (f'') / f + 1/r (f') / f + 1/(r^2) (g'') / g + (k'') / k = (1)/(phi.alt.alt) nabla^2 phi.alt.alt(r, theta, z) = -lambda
$


This implies that the spatial and time-dependent parts must be equal to some constant $-lambda$. To check the sign of $lambda$ we recognize that the spatial part $phi.alt.alt(r, theta, z) =
f(r)g(theta)k(z)$ satisfies the Helmholtz equation:

$ nabla^2 phi.alt.alt + lambda phi.alt.alt = 0 $

Multiplying by $phi.alt.alt$ and integrating over the volume $V$ of the cylinder gives:

$
  integral_V phi.alt.alt nabla^2 phi.alt.alt dif V + lambda integral_V phi.alt.alt^2 dif V = 0
$

Applying Green's identity to the first term:

$
  integral_V phi.alt.alt nabla^2 phi.alt.alt dif V = integral_S phi.alt.alt (nabla phi.alt.alt dot hat(n)) dif S - integral_V |nabla phi.alt.alt|^2 dif V
$

where $S$ is the surface of the cylinder and $hat(n)$ is the outward-pointing normal vector. Since we have Dirichlet boundary conditions ($phi.alt.alt = 0$ on the entire surface $S$), the surface integral
vanishes. Substituting this back:

$
  - integral_V |nabla phi.alt.alt|^2 dif V + lambda integral_V phi.alt.alt^2 dif V = 0
$

Solving for $lambda$:

$
  lambda = (integral_V |nabla phi.alt.alt|^2 dif V) / (integral_V phi.alt.alt^2 dif V)
$

Since the integrands are squared, both integrals must be positive for any non-trivial solution ($phi.alt.alt != 0$). Therefore, $lambda$ must be strictly positive ($lambda > 0$)

=== Solving for the Vertical Component $k(z)$

The term $(k'') / k$ must also be a constant since it is the only term depending solely on $z$. Let $(k'') / k = -mu$:
$ k'' + mu k = 0 $
With Dirichlet conditions $k(0) = k(H) = 0$, the only non-trivial solutions are:
$
  k(z) = sin(frac(n pi z, H)), quad mu_n = (frac(n pi, H))^2, quad n = 1, 2, 3, dots
$

=== Solving for the Angular Component $g(theta)$

Rearranging the remaining spatial terms:
$ r^2 [ (f'') / f + 1/r (f') / f + lambda - mu ] = -(g'') / g = m^2 $
The angular part must be $2 pi$-periodic, which requires $m$ to be an integer:
$
  g'' + m^2 g = 0 arrow.r g(theta) = A cos(m theta) + B sin(m theta), quad m = 0, 1, 2, dots
$

=== Solving for the Radial Component $f(r)$

The radial equation becomes:
$ r^2 f'' + r f' + ( (lambda - mu) r^2 - m^2 ) f = 0 $
This is the Bessel differential equation of order $m$ as seen in Mathematics Handbook. The general solution is:
$ f(r) = C_1 J_m(sqrt(lambda - mu) r) + C_2 Y_m(sqrt(lambda - mu) r) $
Since the displacement $u$ must be finite at the origin ($r=0$), and the Bessel function of the second kind $Y_m$ diverges at $r=0$, we must set $C_2 = 0$.
Applying the boundary condition $f(a) = 0$ gives:
$ J_m(sqrt(lambda - mu) a) = 0 arrow.r sqrt(lambda - mu) a = j_{m,s} $
where $j_{m,s}$ is the $s$-th root of the $m$-th order Bessel function. There is an infinite number of such roots. Therefore:
$ lambda_{m,n,s} = (frac(j_{m,s}, a))^2 + (frac(n pi, H))^2 $

=== Solving for the Time Component $h(t)$

The time dependent equation is $h'' + c^2 lambda h = 0$, with general solution:
$ h(t) = D_1 cos(c sqrt(lambda) t) + D_2 sin(c sqrt(lambda) t) $
Given the initial velocity $(partial u) / (partial t) = 0$, we must have $D_2 = 0$, leaving:
$ h(t) = cos(c sqrt(lambda) t) $


== Final Solution

The general solution is a triple sum over $m, n, s$. However, the initial condition is:
$ u(r, theta, z, 0) = r(a-r) cos(theta) sin(frac(pi z, H)) $
Comparing this to our components:
- The $sin((pi z) / H)$ term implies that only $n=1$ is present.
- The $cos(theta)$ term implies that only $m=1$ is present (with $B=0$).

Thus, the solution reduces to a single sum over the radial modes $s$:
$
  u(r, theta, z, t) = cos(theta) sin(frac(pi z, H)) sum_(s=1)^infinity A_s J_1(frac(j_{1,s}, a) r) cos(c sqrt(lambda_{1,1,s}) t)
$

The coefficients $A_s$ are determined by the initial condition at $t=0$:
$ r(a-r) = sum_(s=1)^infinity A_s J_1(frac(j_{1,s}, a) r) $
Using the orthogonality of Bessel functions with the weight $r$:
$
  A_s = frac(2, a^2 [J_2(j_{1,s})]^2) integral_0^a r [r(a - r)] J_1(frac(j_{1,s}, a) r) dif r
$
$
  A_s = frac(2, a^2 J_2(j_{1,s})^2) integral_0^a r^2 (a - r) J_1(frac(j_{1,s}, a) r) dif r
$


== Problem 2:
== a)

We consider the non-homogeneous differential equation for $u(x)$ on the interval $0 < x < L$:
$ (d^2 u) / (d x^2) + u = f $
subject to the Dirichlet boundary conditions:
$ u(0) = u(L) = 0 $

== Solve using Eigenfunction Expansion

We seek a solution in the Hilbert space $L^2(0, L)$. Any piecewise smooth function in this space can be expressed as a linear combination of eigenfunctions $phi.alt_n(x)$ that form an orthonormal basis.

The eigenfunctions must satisfy the condition:
$ integral_0^L |phi.alt_n(x)|^2 d x < infinity $

We expand both the solution $u(x)$ and the source term $f(x)$ in terms of these eigenfunctions:
$
  u(x) = sum_{n=1}^infinity u_n phi.alt_n(x) , quad f(x) = sum_{n=1}^infinity f_n phi.alt_n(x)
$

== Determining the Basis

To satisfy the boundary conditions $u(0)=u(L)=0$, we choose the eigenfunctions of the operator $(d^2)/(d x^2)$:
$ phi.alt_n(x) = sqrt(2/L) sin(frac(n pi x, L)), quad n = 1, 2, 3, dots $

Substituting the expansions into the original ODE:
$
  sum_{n=1}^infinity u_n [phi.alt_n''(x) + phi.alt_n(x)] = sum_{n=1}^infinity f_n phi.alt_n(x)
$

Since $phi.alt_n''(x) = -(frac(n pi, L))^2 phi.alt_n(x)$, we obtain the algebraic relation for the coefficients:
$
  u_n [1 - (frac(n pi, L))^2] = f_n arrow.r u_n = frac(f_n, 1 - (frac(n pi, L))^2)
$

where the source coefficients are given by:
$ f_n = integral_0^L f(x) phi.alt_n(x) d x $

We propose the basis functions $phi.alt_n(x) = N sin(frac(n pi x, L))$. We check the Dirichlet BCs:
- At $x = 0$: $phi.alt_n(0) = N sin(0) = 0$. (Satisfied)
- At $x = L$: $phi.alt_n(L) = N sin(frac(n pi L, L)) = N sin(n pi) = 0$ for $n = 1, 2, 3, dots$. (Satisfied)

=== Normalization

To ensure the basis is orthonormal, we require:
$ integral_0^L |phi.alt_n(x)|^2 dif x = 1 $

Substituting our function:
$ N^2 integral_0^L sin^2(frac(n pi x, L)) dif x = 1 $

Using the identity $sin^2(theta) = 1/2 (1 - cos(2 theta))$:
$ N^2 integral_0^L 1/2 [1 - cos(frac(2 n pi x, L))] dif x = 1 $
$ N^2/2 [x - frac(L, 2 n pi) sin(frac(2 n pi x, L))]_0^L = 1 $

Evaluating at the limits:
$
  N^2/2 [ (L - 0) - (0 - 0) ] = 1 arrow.r frac(N^2 L, 2) = 1 arrow.r N = sqrt(2/L)
$

Thus, the normalized eigenfunctions are:
$ phi.alt_n(x) = sqrt(2/L) sin(frac(n pi x, L)) $
=== Determining the Coefficients

We substitute the expansions $u(x) = sum u_n phi.alt_n(x)$ and $f(x) = sum f_n phi.alt_n(x)$ into the differential equation $(d^2 u)/(d x^2) + u = f$.

Using the standard orthonormal basis for Dirichlet boundary conditions on $[0, L]$:
$ phi.alt_n(x) = sqrt(2/L) sin(frac(n pi x, L)) $

The second derivative of the basis functions is:
$ phi.alt_n''(x) = - (frac(n pi, L))^2 phi.alt_n(x) $

Substituting these into the ODE yields:
$
  sum_{n=1}^infinity u_n [ - (frac(n pi, L))^2 phi.alt_n(x) + phi.alt_n(x) ] = sum_{n=1}^infinity f_n phi.alt_n(x)
$

By the uniqueness of the expansion (orthogonality of $phi.alt_n$), we equate the coefficients for each $n$:
$ u_n [ 1 - (frac(n pi, L))^2 ] = f_n $

Solving for $u_n$:
$ u_n = frac(f_n, 1 - (frac(n pi, L))^2) $

where the source coefficients $f_n$ are calculated via the inner product:
$
  f_n = chevron.l f, phi.alt_n chevron.r = integral_0^L f(x) sqrt(2/L) sin(frac(n pi x, L)) dif x
$

== Final General Solution

The complete solution is the sum of these weighted eigenfunctions:
$
  u(x) = sum_{n=1}^infinity [ frac(1, 1 - (frac(n pi, L))^2) (integral_0^L f(x) phi.alt_n(x) dif x) ] phi.alt_n(x)
$



== b) Green's Function Method

[cite_start]We solve the non-homogeneous equation $u'' + u = f$ with $u(0) = u(L) = 0$ using the Green's function $G(x, x_0)$[cite: 23]. The solution is given by:
$ u(x) = integral_0^L G(x, x_0) f(x_0) dif x_0 $

The Green's function must satisfy the following conditions:
- $G''(x, x_0) + G(x, x_0) = delta(x - x_0)$
- $G(0, x_0) = G(L, x_0) = 0$
- Continuity at $x = x_0$: $G_{"left"}(x_0, x_0) = G_{"right"}(x_0, x_0)$
- Jump condition: $G'_{"right"}(x_0, x_0) - G'_{"left"}(x_0, x_0) = 1$

For $x < x_0$, we have $G_{"left"} = A cos(x) + B sin(x)$. Applying $G(0) = 0$ gives $A = 0$, so $G_{"left"} = B sin(x)$.
For $x > x_0$, we have $G_{"right"} = C cos(x) + D sin(x)$. Applying $G(L) = 0$ implies $G_{"right"} = E sin(L - x)$.

Solving for the coefficients using the matching conditions:
$
  G(x, x_0) = cases(
    -frac(sin(x) sin(L - x_0), sin(L)) & "for" 0 <= x <= x_0,
    -frac(sin(x_0) sin(L - x), sin(L)) & "for" x_0 <= x <= L
  )
$

The integral solution is:
$
  u(x) = integral_0^x -frac(sin(x_0) sin(L - x), sin(L)) f(x_0) dif x_0 + integral_x^L -frac(sin(x) sin(L - x_0), sin(L)) f(x_0) dif x_0
$

== c) Verification with $f(x) = sin((2 pi x) / L)$

We compare the results from *a)* and *b)* for $f(x) = sin((2 pi x) / L)$.

=== Method a): Eigenfunction Expansion
The coefficients $f_n$ are given by:
$ f_n = sqrt(2/L) integral_0^L sin(frac(2 pi x, L)) sin(frac(n pi x, L)) dif x $
By orthogonality, $f_n = 0$ for all $n != 2$. For $n = 2$, $f_2 = sqrt(L/2)$.
Substituting into the solution from *a)*:
$
  u(x) = frac(f_2, 1 - (2 pi / L)^2) phi.alt_2(x) = frac(sin(frac(2 pi x, L)), 1 - (frac(2 pi, L))^2)
$

=== Method b): Green's Function
Substituting $f(x)$ into the Green's function integral and evaluating:
$
  u(x) = -frac(sin(L-x), sin(L)) integral_0^x sin(x_0) sin(frac(2 pi x_0, L)) dif x_0 - frac(sin(x), sin(L)) integral_x^L sin(L-x_0) sin(frac(2 pi x_0, L)) dif x_0
$
After integrating and applying trigonometric identities, we obtain:
$ u(x) = frac(1, 1 - (2 pi / L)^2) sin(frac(2 pi x, L)) $
Both methods yield the same result, verifying the solution.
