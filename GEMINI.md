# FMM Cheatsheet Project Overview

This directory contains a comprehensive, high-density cheat sheet for the course **FMM - Mathematical Methods for Physics**. The content is authored in [Typst](https://typst.app/), a modern markup-based typesetting system.

## Project Structure

- `main.typ`: The main source file containing all mathematical formulas, theory, and worked examples.
- `template.typ`: A reusable Typst template that defines the dense 4-column layout, font sizes, and header styles used in the cheat sheet.
- `references/`: Directory containing source materials, exam papers, and review documents.
- `.github/workflows/deploy.yml`: A GitHub Actions workflow that automatically compiles the Typst source into a PDF and deploys it to GitHub Pages as a static site.

## Key Content Areas

The cheat sheet covers the following core topics:
1.  **Fundamental PDEs**: Laplace, Heat, Wave, Helmholtz, and Poisson equations.
2.  **Separation of Variables (SOV)**: Step-by-step logic for solving homogeneous problems.
3.  **Non-Homogeneous Problems**: Splitting tricks, reference functions, and eigenfunction expansions.
4.  **Fourier Series & Orthogonality**: Inner product notation and the "Orthogonality Trick" for finding coefficients.
5.  **Sturm-Liouville (SL) Theory**: Self-adjoint operators, Rayleigh quotients, and eigenvalue properties.
6.  **Green's Functions**: Construction methods (Direct/Eigenfunction) and handling inhomogeneous BCs.
7.  **Standard ODE Solutions**: Reference tables for Rectangular, Cylindrical, and Spherical geometries (Bessel, Legendre, etc.).
8.  **Worked Examples**: 13 "idiot-proof" step-by-step solutions to common exam-style problems.

## Mathematical Conventions & Syntax

The project adheres to strict Typst mathematical syntax to ensure consistency and readability:
- **Fractions**: Always formatted as `(numerator) / (denominator)` with explicit parentheses.
- **Derivatives**: Use the `dif` operator (e.g., `(dif u) / (dif x)`) for both ordinary and partial derivatives.
- **Inner Products**: Formatted using `chevron.l f | g chevron.r`.
- **Subscripts**: Multi-letter labels (e.g., `_("avg")`, `_("bulk")`) are quoted to prevent compilation errors.
- **Arrows**: Native Typst arrows like `arrow.double` (for implies) and `arrow` (for to) are used instead of LaTeX commands.

## Compilation & Usage

To compile the cheat sheet locally, ensure you have the Typst CLI or Tinymist installed:

```bash
# Compile to PDF (Typst)
typst compile main.typ

# Compile to PDF (Tinymist)
tinymist compile main.typ

# Watch for changes
typst watch main.typ
```

## Development Environment

The project is optimized for use with the **Tinymist** LSP (available for VS Code, Neovim, etc.), which provides:
- Real-time PDF preview.
- Symbol and reference completion.
- Mathematical syntax highlighting.
- Linting for Typst-specific syntax rules.

The output is optimized for a 4-column flipped (landscape) page with minimal margins, designed to maximize information density for exam use.
