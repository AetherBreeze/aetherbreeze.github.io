---
id: 20
title: "From Particles To Fields (2)"
subtitle: ""
date: "2023.07.17"
tags: "qft"
---

# The Mattress Approximation

Last time, we started writing down the energy of a field $`F(x, t)`$. We did this using the assumption that every point of the field in space $`F(x_1, t)`$ behaves like a particle $`f_{x_1}(t)`$. This allowed us to write the kinetic energy of each point of the field. Now, we will use a beautiful series of tricks to write the potential (or "positional" energy)

## What Is Positional Energy?

Let's start with the most basic question: what is positional energy?

In terms of particles $`f(t)`$, positional energy is exactly what it says on the tin. It's the energy a particle has due to its position. Specifically, it's the energy a particle has due to its position and its interaction with other particles $`g(t)`$. Thus if we consider $`f(t)`$ to be the position of a particle at time $`t`$, we can write its positional energy due to its interaction with some other particle $`g(t)`$ as some function of their two positions:

```math
E_P = P(f(t), g(t))
```

where $`P`$ is some unknown function of the two positions.

We can easily generalize this to multiple particles. If there are many other particles $`g_1(t), g_2(t),.. g_N(t)`$, the positional energy of $`f(t)`$ is the sum of its interactions with all of them:

```math
E_P = \sum_{a=1}^{N} P(f(t), g_a(t))
```

This is our starting position. We will now apply a few slick mathematical tricks to get a powerful approximation of this energy.

## Translation Independence

We will start with a symmetry. The symmetry goes like this: say we translate everything in the universe over a little. It stands to reason (and, more importantly, to experiment) that nothing would change. Thus the true values of the particles' positions must not have any physical significance. Rather, only the *difference* between two particle's positions can matter.

The consequences of this are simple. Instead of writing the positional energy due to the interaction of two particles as a function of both positions, $`P(f(t), g(t))`$, we instead write it as a function of the difference of their positions:

```math
E_P = \sum_{a=1}^{N} P_a(f(t) - g_a(t))
```

We will revisit this symmetry later when we generalize to fields. The math won't change, but the context will shift slightly.

## The Minimum Principle

Having used translation independence, we will now shift to a totally different argument. This argument is based on two simple assumptions.

The first assumption is that the positional energy function $`P(f(t) - g(t))`$ is *continuous*. This means that we can expand it as a Taylor series:

```math
E_P = \sum_{a=1}^{N} P_a(0) + P_a'(0) (f(t) - g_a(t)) + P_a''(0) \frac{(f(t) - g_a(t))^2}{2} +..
```

Note that, much like the position, only the differences between the energies at two points matter. Thus we can ignore the first constant term, $`P(0)`$, without changing the physics:

```math
E_P = \sum_{a=1}^{N} P_a'(0) (f(t) - g_a(t)) + P_a''(0) \frac{(f(t) - g_a(t))^2}{2} +..
```

We will now use an even more powerful assumption. Unlike the last one, this will be an *approximation*. It is not totally correct, but it is close enough for most of physics to be based on it in some way.

The assumption goes like this. In general, particles in nature tend rest at states of least energy. That is, in almost all cases (on small scales), the energy of a particle will be close to its minimum. *And if the particle is at a minimum of its energy, that means the derivative of its energy should be zero.*

In fact, we can go even further. If the particle is at rest, that means its kinetic energy is zero. **Thus if a particle is at rest, the derivative of its positional energy should be zero.**

It's important to note that this assumption is never *fully* true. A system where all the particles are at rest is a very uninteresting system. However, in general, it is rare for particles (especially in the continuum limit) to stray *too* far from their energy minima. Thus for most cases, we can describe the physics well enough by assuming the positional energy is close to a minimum. Thus the first term of the Taylor series can be ignored:

```math
E_P = \sum_{a=1}^{N} P_a''(0) \frac{(f(t) - g_a(t))^2}{2} +..
```

For simplicity, we can rewrite this first coefficient as a simple constant that varies per particle:

```math
E_P = \sum_{a=1}^{N} P_a \frac{(f(t) - g_a(t))^2}{2} +..
```

## The Small-Distance Assumption

Now assume that the distance $`f(t) - g_a(t)`$ is relatively small. This is true in two important cases. The first is the continuum limit, where we will take this distance to zero. We will see the second in a moment. In either case, if this difference is small, then all higher-order terms of the Taylor series will be even smaller. Thus we can make a second approximation and react a relatively simple expression for the positional energy:

```math
E_P = \sum_{a=1}^{N} P_a \frac{(f(t) - g_a(t))^2}{2}
```

## Wait, It's All Springs?

Keen physics enjoyers -- by which I mean anyone who managed not to fall asleep in AP physics -- may remember this equation. A few more might remember its simpler form, where only one particle is in play:

```math
E_P = p \frac{(f(t) - g_a(t))^2}{2}
```

If we simplify even further by assuming that the other particle we're interacting with is at the origin, this equation takes a form that most physics enthusiasts should recognize:

```math
E_P = p \frac{f(t)^2}{2}
```

That's right -- **in the short-distance, near-equilibrium approximation, the positional energy of any system looks like a spring!**

## Next Steps

Today, we used a series of symmetries and approximations to show that in the short-distance, near-equilibrium approximation, positional energies between two particles looks like a spring. Next time, we will apply this and one more symmetry in the continuum limit to derive the *mattress-bed model* -- the fundamental starting point of quantum field theory.
