---
id: 28
title: "From Particles To Fields (10)"
subtitle: ""
date: "2023.07.25"
tags: "qft"
---

# Interperting the Free Propagator (1)

Last time, we patched a mathematical bug with the free propagator that was causing the integral to diverge. Now we will talk a little about how this powerful object can be interpreted.

## Focusing on Particles

Recall our "fixed" expression for the free propagator:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + i \epsilon} d^4 p
```

We originally planned to use this to calculate transition probabilities between field states. However, in order to study it in the abstract, it will help to look at the simplest place it shows up.

This simplest place is quite easy to pick out. Recall that the propagator arose from trying to solve the path integral

```math
\int e^{i \int L d^4 x} dy(t)
```

for the perturbed vacuum field Lagrangian

```math
L = (\partial F(y(t)))^2 - m^2 F(y(t)) + J(y(t)) F(y(t))
```

This process allows us to integrate over field states. However, it also allows us to integrate over particle paths. In fact, the path integral as we just wrote it gives the transition probability density for a particle to travel between the endpoints of $`y(t)`$ in a field $`F`$. **Thus in its simplest case, the propagator is a tool to study the probability for a particle to move between two points in a field.**

## Next Steps

I wanted to go into the full contour integration here, but time constraints prevent me from doing so. Tomorrow, we will make sure to save enough time to tackle this complicated topic.
