---
id: 29
title: "From Particles To Fields (11)"
subtitle: ""
date: "2023.07.26"
tags: "qft"
---

# The Propagator and Contour Integration

We are finally ready to perform part of the integral for the free propagator. However, since we delved into the complex plane in order to avoid some singularities, we have to wrestle with a little bit of contour integration.

## Dealing with Singularities (again)

Recall our "fixed" expression for the free propagator:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + i \epsilon} d^4 p
```

We fixed this expression by adding a term $`i \epsilon`$ in the denominator. This term lets us duck and weave around the singularities that would otherwise exist at $`p = \pm m`$. However, it doesn't let us avoid singularities altogether. Instead, it moves them around in the complex plane, introducing singularities at

```math
p = \pm \sqrt{m^2 - i \epsilon}
```

This expression is slightly misleading because we're working in four momentum dimensions. Thus the quantity on the left is really the *relativitstic magnitude* of the four-momentum. To remove this confusion, we often choose to split the momentum into its time component, $`p_t^2`$, and its spatial components $`p_\lambda`^2`$. This lets us expand the integral to

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p_t^2 - p_\lambda^2 - m^2 + i \epsilon} d^4 p
```

It's easier to analyze these singularities when they're caused by just one variable. Thus we will introduce the new variable $`\omega`$ defined as

```math
\omega = \sqrt{p_\lambda^2 + m^2}
```

which puts the above integral in the nicer form

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p_t^2 - \omega^2 + i \epsilon} d^4 p
```

The singularities now occur as nice values of the time momentum $`p_t`$:

```math
p_t = \pm \sqrt{\omega^2 - i \epsilon}
```

Whenever we see an epsilon inside a square root, we should always think about reducing it. As $`\epsilon \to 0`$, this square root becomes dominated by the linear term:

```math
p_t \to \pm (\omega^2 - i \epsilon)
```

Thus the singularities we will actually consider are at $`\omega^2 - i \epsilon`$ and $`-\omega^2 + i \epsilon`$.

We will finally delve into contour integration and reinforce this somewhat strange variable change in the upcoming section.
