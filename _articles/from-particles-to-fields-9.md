---
id: 27
title: "From Particles To Fields (9)"
subtitle: ""
date: "2023.07.24"
tags: "qft"
---

# Fixing The Free Propagator

Last time, we used momentum tricks to get an expression for the free propagator -- the inverse of the mass-shifted derivative. Today, we will patch up one minor mathematical flaw in the expression.

## Dodging Infinities

Recall the expression for the free propagator, derived from momentum tricks based on the spike function:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2} d^4 p
```

We are accustomed to ignoring the actual mechancis of evaluating integrals by now. However, even by the lax standards of physics, there is a pretty clear problem here: at $`p = \pm m`$, this integrand goes to infinity. There is no easy way to discretize our approximate our way around this. This integral flat-out diverges, and we need to fix it.

The bad news is that there's no way to "truly" fix it without destroying what the propagator is. The good news is that we can get arbitrarily close to fixing it, then take the limit later.

## The Ever-Useful Epsilon

The trick is simple. Let's make our visualization easier by assuming for a second that we only have one momentum dimension. Then our problem can be simplified to [this excellent picture on Wikipedia].

When the line of momentum passes the points $`\pm m`$, we have issues. The solution is to essentially 'duck and weave' around the singularities by tracing tiny circles around them (any shape would do, but a circle makes the integration easiest.) Of course, since we're dealing in only one momentum dimension, "tracing circles" requires going to the complex realm.

There are three ways to trace such circles. The first, referring to the Wikipedia illustration, is to go *over* both singularities (i.e. towards positive $`i`$). This is how that looks in math:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + (m + i \epsilon)^2} d^4 p
```

The second choice is to go *under* both singularities:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + (m - i \epsilon)^2} d^4 p
```

In both cases, we will eventually take the limit $`\epsilon \to 0`$ to get back to the "true" propagator.

However, there is no real reason to choose one direction over the other. The most balanced option is to go over one singularity and under the other. In this case, we simply take both circles:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + (m + i \epsilon)^2 - (m + i \epsilon)^2} d^4 p
```

Expanding the squares, throwing away terms of order $`\epsilon^2`$, and assuming that $`\epsilon`$ is so small that any constant times $`\epsilon`$ is still $`\epsilon`$, we get the standard "corrected" form of the propagator:

```math
D^{-1}(y - x) \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + i \epsilon} d^4 p
```

## Next Steps

Today, we were supposed to wrap up our discussion of the free propagator. However, since I worked for 17 hours today, we will wait until tomorrow to evaluate these new contour integrals and make some closing remarks on the meaning of this new object.
