---
id: 18
title: "From Particles To Fields (1)"
subtitle: ""
date: "2023.07.15"
tags: "qft"
---

# From Particles To Fields

Last time, we wrapped up our definition of the path integral by introducing a way to calculate the transition probability between any two states. We claimed that this would be the foundation on which we built quantum field theory. Today, we will start to follow through on that promise.

## Discrete to Continuous

We will start with a step back. We want to move from a model of particles to a model of fields. This leads us to a seemingly trivial, but actually very helpful, question: what *is* a field?

The answer is pretty simple. A field, for our purposes, is just a function that takes values at each point in spacetime:

```math
\text{field } := F(t, x, y, z)
```

Now let's compare this to our definition of a particle. A particle, in the most abstract sense, is just a function which takes some value at each point in time. That value might be the particle's position, its charge, or some combination of properties, but in the general case, we can write a particle as simply

```math
\text{particle } := f(t)
```

What if there are two particles? Well, then we would have two functions:

```math
f_1(t), f_2(t)
```

What about $`n`$ particles?

```math
f_1(t), f_2(t),.. f_n(t)
```

If you remember how we jumped from discrete to continuous quantum mechanics, you might see where this is going. What if we consider a *continuous* number of particles, where there's one particle for every real number $`x \in \R`$, and the $`x_1`$th particle is given by

```math
f_{x_1}(t) := F(x_1, t)
```

This is essentially what we'll be doing. Since we know how each invidual particle behaves, we'll be able to generalize to a description of the field quite quickly.

## Energy of a Field

Now that we've defined our concept of a field, we should set about studying its most fundamental property: its energy. This will be quite beautiful.

We will define the energy of a field $`F(x, t)`$ at a point $`x_1`$ very simply: it is just the energy of the "particle" at $`x_1`$:

```math
\text{energy}(F(x_1, t)) = \text{energy}(f_{x_1}(t))
```

We are very familiar with the energy of a particle. It's split into two parts: kinetic and potential. The kinetic energy of a particle is very straightforward to generalize:

```math
\text{kinetic energy}(f_{x_1}(t)) ?= \frac{m \dot{f}_{x_1}(t)^2}{2}
```

The only trick here is that, since we're dealing with a continuous field, we'll have a **mass density** $`d_m(x)`$ instead of an individual mass for each particle:

```math
\text{kinetic energy}(f_{x_1}(t)) = \frac{d_m(x_1) \dot{f}_{x_1}(t)^2}{2}
```

That's it for the kinetic energy. Aside from the mass density, it's fairly straightforward. The potential energy is where the beauty really appears.

Since I'm still recovering from work-related sleep deprivation, we'll investigate that beauty tomorrow.
