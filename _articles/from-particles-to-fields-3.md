---
id: 21
title: "From Particles To Fields (3)"
subtitle: ""
date: "2023.07.18"
tags: "qft"
---

# The Mattress Approximation

Last time, we used some tricks and a few assumptions to derive an approximation for the positional energy of a particle. Now we will generalize that to find a good approximation for the positional energy of a field. This approximation will form the basis of quantum field theory.

## From Particles to Fields

We will start with yesterday's solution for particles. We made two assumptions about our particles: that they never go too far from an energy minimum, and that the distances between two interacting pairs of particles was small. Under these assumptions, we derived the following approximation for the positional energy of a particle $`f(t)`$ due to its interactions with $`N`$ other particles $`g_1(t), g_2(t),.. g_N(t)`$:

```math
E_P(f(t)) = \sum_{a=1}^{N} P_a \frac{(f(t) - g_a(t))^2}{2}
```

Our goal is to turn this into an expression about the positional energy of a field.

We'll start simple. Since fields (in this approach) are the limits of continuously many particles, their positional energies would be the sum over the positional energies of each constituent particle. This means we'll need to sum over $`E_P(f(t))`$ for every particle $`f(t)`$. It's convenient, then, to remove the uniqueness of the particle $`f(t)`$, and just consider $`N`$ particles $`g_1(t)... g_N(t)`$:

```math
E_P(g_a(t)) = \sum_{b=1}^{N} P_{ab} \frac{(g_a(t) - g_b(t))^2}{2}
```

The sum over these particles' positional energies is then

```math
\sum_{a=1}^{N} E_P(g_a(t)) = \sum_{a=1}^{N} \sum_{b=1}^{N} P_{ab} \frac{(g_a(t) - g_b(t))^2}{2}
```

Though it's not terribly important, note that this theory does not have self-interaction -- each particle's energy due to interactions with itself is proportional to $`g(a) - g(a)`$, and is thus zero. These things are not important now, but similar ideas will become *very* important later, so it's worth a mention.

We can now generalize this to fields in the usual way: by taking the limit of continuously many particles $`g_x(t)`$ and defining the field such that

```math
F(x, t) := g_x(t)
```

The sum over each particles' positional energy is now the positional energy of the field. The sum on the right-hand side becomes a double integral:

```math
E_P(F(x, t)) = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} P(x, y) \frac{(F(x, t) - F(y, t))^2}{2} dx dy
```

## Locality

The above integrals are not to be trifled with. Thankfully, they are not usually necessary. Another principle of physics comes to our rescue -- the principle of *locality*.

Locality, in this case, states that *points on the field only interact with their neigboring points on the field*. Note that this does *not* mean that far-away points don't influence each other -- just that they have to do so by passing their interaction through all the points in the middle.

That's the physical principle of locality. To translate it into math, we recall the typical mathematical tool we use for dealing with infinitesimally close points: the derivative. The derivative contains macroscopic (that is, not infiniestimal) information about the differences between two neighboring points on the field. Thus we remove the second integral and write the positional energy of each point solely in terms of that point's derivative:

```math
E_P(F(x, t)) = \int_{-\infty}^{\infty} \frac{P(x)}{2} \frac{\partial F(x, t)}{\partial x} dx
```

## Multiple Dimensions

Often in physics, you will find that good ideas have further good consequences. The introduction of locality, and subsequent rewriting of positional energy, is one such instance.

So far, we have been dealing strictly with one-dimensional fields (that is, one spatial dimension $`x`$ and time dimension $`t`$). It is widely postulated that the real world has three spatial dimensions. Previously, before we introduced locality, extending our definition to all these extra dimensions would've been a pain. Now it's almost trivial. All we have to do is add the derivative terms in the other dimensions:

```math
E_P(F(x, y, z, t)) = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{P(x, y, z)}{2} \left(\frac{\partial F}{\partial x} + \frac{\partial F}{\partial y} + \frac{\partial F}{\partial z}\right) dx dy dz
```

And there we have it: our definition for the positional energy of a field. Surpisingly painless!

## Wait, Why Were We Doing This?

A good question, and one that should be asked early and often. It will save you a great deal of time in a great many cases. In this case, however, we do have a good reason for wanting to write the positional energy of a field: we want to extend the path integral method from particles to fields.

Recall that we derived the *path integral method* to find the probability that a particle would move from one position $`\ket{x_1}`$ to another $`\ket{x_2}`$ in some time $`T`$. Through integral trickery, we found a way to compute this by integrating over intermediate paths:

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{x_1} = \int e^{\frac{i}{\hbar} \int_{0}^{T} L dt} dy(t)
```

where the Lagrangian $`L`$ is given by

```math
L = \text{(kinetic energy)} - \text{positional energy} = \frac{\dot{y}(t)^2}{2} - E_P(y(t)) 
```

and the path integral $`\int dy(t)`$ is defined as a limit of integrals over intermediate points, times a scaling factor mostly derived from momentum basis states:

```math
\int dy(t) = \lim_{N \to \infty} \Pi_{a=1}^{N} \left(\frac{i m \hbar N}{2 \pi t}\right)^{1/2} \int_{-\infty}^{\infty} dy_a
```

where we have chosen (for now) to ignore the fact that the leading factor super-giga-diverges as $`N`$ goes to infinity.

We then generalized the path integral method to the *weighted path integral*, which lets us calculate transition probabilities between any two states $`\ket{S_1}`$ and $`\ket{S_2}`$ after some time $`T`$. This came from taking the standard expression

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1}
```

and inserting $`1`$ in the form of integrals over start and end poisitions $`x_1, x_2`$:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{S_2} \ket{x_2} \bra{x_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{x_1} \bra{x_1} \ket{S_2} dx_1 dx_2
```

This is easier because the energy operator $`\hat{E}`$, and thus the time evolution operator, is usually written in terms of position and momentum operators. We can then move the "weight factor" $`\bra{S_2} \ket{x_2} \bra{x_1} \ket{S_1}`$ out to the front, since they're just real numbers:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{S_2} \ket{x_2} \bra{x_1} \ket{S_2} \bra{x_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{x_1}  dx_1 dx_2
```

The contained term is now just the position transition probability density, which we already know we can calculate with a path integral:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{S_2} \ket{x_2} \bra{x_1} \ket{S_2} \int e^{\frac{i}{\hbar} \int_{0}^{T} L} dy(t) dx_1 dx_2
```

This may not seem better, but the fact that operators are no longer acting on the weird states $`S_1, S_2`$ makes all the difference. Nine times out of ten, the path integral version is much easier to calculate.

## Finally, From Particles To Fields

In this last expression lies our answer. This is an expression in terms of particles; we want to rewrite it as one in terms of fields. At a surface level inspection (we seem to be ignoring the mass term inherent in the definition of the path integral, but whatever), the only particle-dependent thing in this expression is the Lagrangian $`L`$. The Lagrangian is just the kinetic energy of the particle minus the positional energy of the particle. **Thus in order to describe fields using the path integral method, we need to be able to write their kinetic and positional energies.**

This is precisely what we've spent the last couple sections doing. We fairly quickly came up with a definition for the kinetic energy of a field $`F(x, t)`$ using the mass density function $`d_m`$:

```math
E_K(F(x, t)) = \int_{-\infty}^{\infty} \frac{d_m(x)}{2} \left(\frac{\partial F}{\partial t}\right)^2 dx
```

And we've just now come up with a definition for the positional energy of a field:

```math
E_P(F(x, t)) = \int_{-\infty}^{\infty} \frac{P(x)}{2} \left(\frac{\partial F}{\partial x}\right)^2 dx
```

note that we've gone back down to one dimension, but can easily generalize back up again if necessary.

Thus we can now write the Lagrangian of such a field:

```math
L = \int_{-\infty}^{\infty} E_K(F(x, t)) - E_P(F(x, t)) dx = \int_{-\infty}^{\infty} \frac{d_m(x)}{2} \left(\frac{\partial F}{\partial t}\right)^2 - \frac{P(x)}{2} \left(\frac{\partial F}{\partial x}\right)^2 dx
```

For future reference, the term inside the integral here is often called the **Lagrangian density** of the field. This is simply the definition of an "X density": it is something that you integrate over space to get X. It is often written as a fancy curved L that looks confusing as hell, and for that reason I judiciously ignore it.

Now we see the power of the path integral method. Simply by rewriting the Lagrangian, we generalized our method of calculating probabilities from particles to fields:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{S_2} \ket{x_2} \bra{x_1} \ket{S_2} \int e^{\frac{i}{\hbar} \int_{0}^{T} L} dy(t) dx_1 dx_2
```

## Next Time

Next time, we will reformat this Lagrangian a bit. We will find that some interesting properties jump out. We'll then generalize this path integral a bit and see if we can't get some interesting interactions out of it.
