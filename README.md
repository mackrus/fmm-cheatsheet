# FMM Cheatsheet - Mathematical Methods for Physics

A high-density, professional-grade cheat sheet for the course **FMM - Mathematical Methods for Physics**, authored in [Typst](https://typst.app/). Designed specifically for university exams where information density and rapid navigation are critical.

## 🚀 Key Features

- **3-Column Optimized Layout**: Balanced for high-density mathematical formulas while maintaining readability.
- **Color-Coded Navigation**:
  - **Navy Blue (Level 1)**: Major thematic sections.
  - **Deep Blue (Level 2)**: Theoretical sub-topics.
  - **Light Blue (Level 3)**: Worked example categories.
- **Visual Anchors**:
  - `#key[...]`: Critical formulas (Laplacian, Rayleigh quotients, etc.) are highlighted in yellow boxes.
  - `#example(...)`: 29 step-by-step worked examples, each boxed with a blue accent and a highlighted final result.
- **Automated Deployment**: Automatically compiles to PDF and deploys to GitHub Pages on every push.

## 📚 Core Topics Covered

1.  **Fundamental PDEs**: Laplace, Heat, Wave, Helmholtz, and Poisson equations.
2.  **Separation of Variables (SOV)**: Step-by-step logic for homogeneous BVPs.
3.  **Non-Homogeneous Problems**: Splitting tricks, reference functions, and eigenfunction expansions.
4.  **Sturm-Liouville (SL) Theory**: Self-adjoint operators and Rayleigh quotients.
5.  **Green's Functions**: Direct method and eigenfunction construction.
6.  **Standard ODE Solutions**: Reference table for Rectangular, Cylindrical, and Spherical geometries.
7.  **Special Functions**: Bessel zeros, Legendre polynomials, and Trig identities.
8.  **29 Worked Examples**: Categorized by problem type for rapid look-up.

## 🛠 Usage & Compilation

Ensure you have the [Typst CLI](https://github.com/typst/typst) installed.

### Compile to PDF
```bash
typst compile fmm_cheatsheet.typ
```

### Watch for Changes
```bash
typst watch fmm_cheatsheet.typ
```

## 📐 Mathematical Conventions

To ensure consistency and prevent compilation errors, the project adheres to strict Typst math hygiene:
- **Derivatives**: Uses the `dif` operator (e.g., `(dif u) / (dif x)`).
- **Fractions**: Formatted as `(numerator) / (denominator)` with explicit parentheses.
- **Subscripts**: Multi-letter labels are always quoted (e.g., `_("bulk")`, `_("eq")`).
- **Vectors**: Bold notation `bold(r)` instead of arrows.

## 📄 License

This project is intended for personal and educational use.
