---
id: 22
title: "From Particles To Fields (4)"
subtitle: ""
date: "2023.07.19"
tags: "qft"
---

# Disturbing the Vacuum

Last time, we generalized the path integral method from particles to fields. Today, we will start to get more specific. Instead of focusing on transitions between any two pairs of states, we'll focus on the one transition to rule them all: transitions from the vacuum state to the vacuum state, and perturbations from it. This concept of perturbing the vacuum will be the root of much of our research going forward.

## The Vacuum State

"The vacuum" is a somewhat mystical term. To people less familiar with physics, it is often taken as some mysterious, unknowable state where nothing exists at all. The reality is at once far simpler and far more powerful. 

Let's start with the basics: there is no singular "the vacuum." Rather, in physics we speak of **the vacuum state of a particular field $`F(x, t)`$.** The vacuum state of a field is simply the state (or states) with the lowest possible energy. There is a bit of irony in this. The vacuum is not a complex, unknowable thing as many expect; rather, the vacuum is literally the simplest possible state of a field. It is the state of the field with the least energy.

For simplicity, we often write the vacuum state of a field in a slightly different way. Recall that the actual energy of a state is meaningless. Rather, it is only the *differences* between the energies of two states that matter. We can shift the energies for all the states of a field by a constant amount without changing how the universe behaves. **Since the vacuum state is by definition the lowest energy state, we usually choose to shift such that the energy of the vacuum state is zero.** This is what we truly mean when we say "the vacuum has no energy." It is not that there is nothing happening; it's just that the field is in its lowest-energy state, and for mathematical convenience, we choose to shift all the energies so that the vacuum's energy is $`0`$.

We reflect this choice in our notation for the vacuum state. Recall that the energy of some state $`\ket{S}`$ is its eigenvalue when acted on by the energy operator. If the vacuum state has energy $`0`$, then its eigenvalue for the energy operator is also $`0`$. Thus we often write the vacuum state simply as

```math
\text{(vacuum state)} = \ket{0}
```

***Note that this is not the zero vector!*** I've seen this mistake suck up more time than I care to count. The zero here does not indicate a zero vector. It indicates that the energy eigenvalue of the state is zero.

## Why The Vacuum Is Useful

So why do we care about the vacuum? Why would we choose to study what is by definition the least interesting state of a field?

There are two answers to this: philosophical and practical.

Philosophically, physics is hard. The simplicity of the vacuum state makes studying it, and related concepts, a little less hard. Thus we choose to do so by the principle of laziness.

Practically, studying the vacuum plays nicely with an assumption we made earlier for the positional energy. We assumed that every point of the field will stay fairly close to its energy minimum. **In the continuous limit, this means that the field never gets too far from its vacuum state.** This means that we can study just small deviations from the vacuum states.

Now let's put those ideas into math. Mathematically, the main tool we've developed for analyzing quantum fields is weighted the path integral method. This method lets us calculate the transition probability between two states $`\ket{S_1}, \ket{S_2}`$ over time time $`T`$:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{S_2} \ket{x_2} \bra{x_1} \ket{S_1} \int e^{i \int_{0}^{T} L dt} dy(t) dx_1 dx_2
```

If we're dealing with states close to the vacuum, both the beginning and the end state will be the vacuum state $`\ket{0}`$. Thus we will devote the rest of today (and the next several days) to studying the **weighted vacuum path integral:**

```math
\bra{0} e^{i \frac{\hat{E}}{\hbar} T} \ket{0} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{0} \ket{x_2} \bra{x_1} \ket{0} \int e^{i \int_{0}^{T} L dt} dy(t) dx_1 dx_2
```

## Simplifying the Field Lagrangian

The key element in the above expression is the field Lagrangian $`L`$. Yesterday, we used a few approximations to simplify this Lagrangian to

```math
L = \int_{-\infty}^{\infty} \frac{d_m(x)}{2} \frac{\partial F}{\partial t}^2 - \frac{P(x)}{2} \frac{\partial F}{\partial x}^2 dx
```

in one dimension, and

```math
L = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{d_m(x, y, z)}{2} \frac{\partial F}{\partial t}^2 - \frac{P(x, y, z)}{2} \left(\frac{\partial F}{\partial x}^2 + \frac{\partial F}{\partial y}^2 + \frac{\partial F}{\partial z}^2\right) dx dy dz
```

in several.

We will now do our favorite thing: simplify. We will assume that the kinetic energy scale factor $`d_m`$ -- which was originally a mass density -- is the same at all points on the field. It's important to note that *there is no physical reason for this*. This is purely a trick to make our calculations easier. It happens to work out well enough to write physics with it, but it does not necessarily have to be true.

This simplification then begets simplifications. Since the whole Lagrangian is proportional to $`F^2`$, we can get rid of this constant entirely by scaling $`F \to F / \sqrt{d_m}`$:

```math
L = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} \frac{\partial F}{\partial t}^2 - \frac{P(x, y, z)}{2 d_m} \left(\frac{\partial F}{\partial x}^2 + \frac{\partial F}{\partial y}^2 + \frac{\partial F}{\partial z}^2\right) dx dy dz
```

For reasons I don't entirely understand, we will then assume that the potential energy scale factor $`P(x, y, z)`$ is *also* a constant. I think this is justified by us adding back a more complex potential energy term later on. It still seems strange to me. Regardless, we will now assume that the leading coefficient $`P`$ of the potential energy Taylor approximation is always a constant:

```math
L = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} \frac{\partial F}{\partial t}^2 - \frac{P}{2 d_m} \left(\frac{\partial F}{\partial x}^2 + \frac{\partial F}{\partial y}^2 + \frac{\partial F}{\partial z}^2\right) dx dy dz
```

This is a familiar form in physics. We have squares of time derivatives minus squares of space derivatives. This should always make us think of the wave equation. And in fact, if we take out the constant of $`1/2`$ and rewrite $`P = \frac{d_m}{c^2}`$ for some constant $`c`$, we get exactly that form:

```math
L = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} \left(\frac{\partial F}{\partial t}^2 - \frac{1}{c^2} \left(\frac{\partial F}{\partial x}^2 + \frac{\partial F}{\partial y}^2 + \frac{\partial F}{\partial z}^2\right)\right) dx dy dz
```

Physics enjoyers might recognize this first term -- its the square of the four-gradient of $`F`$, $`\partial^2 F`$!

This analogy with relativity gives us another idea. We can choose our units such that the speed of waves in this field, $`c`$, is simply one. Doing so gives us the simplest form of the "basic" field Lagrangian:

```math
L = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} \left(\frac{\partial F}{\partial t}^2 - \left(\frac{\partial F}{\partial x}^2 + \frac{\partial F}{\partial y}^2 + \frac{\partial F}{\partial z}^2\right)\right) dx dy dz \\
= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} \partial^2 F dx dy dz 
```

## The Relativistic Field Lagrangian

We have reached the above expression through a truly ludicrous series of approximations. Here is a list:

0. Each point on the field stays pretty close to its energy minimum.
0. Each point on the field only directly interacts with neighboring points.
0. The kinetic energy scale factor is constant.
0. The positional energy scale factor is constant.

As it turns out, all but one of these assumptions are reasonable enough to do good physics under. The exception is the last one. In order to make good predictions, we'll have to re-introduce the potential energy in some capacity. However, while doing so, we'll have to respect a certain symmetry.

We have talked a great deal about symmetries so far. In that respect, the expression we just derived is very interesting. It is practically the textbook example of one of physics' most important symmetries -- *Lorentz* symmetry.

Lorentz symmetry is the main symmetry of special relativity. It states that physics must remain unchanged under Lorentz transformations. As it happens, pretty much the fundamental value that remains unchanged under Lorentz transformations is $`\partial^2 F`$. Thus almost by accident, we have already written a Lorentz-invariant Lagrangian!

Since we want our theory to work with special relativity, we want to preserve this Lorentz-invariant quality. Thus we must re-add the positional energy in a way that preserves this factor.

The most general way to do this is also the simplest -- we just subtract some positional energy function $`E_P(x, y, z)`$ from the Lagrangian:

```math
L = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} \partial^2 F - E_P(x, y, z) dx dy dz 
```

In practice, this "extra" positional energy function will have to be greatly simplified to calculate anything analytically. However, this is the most general case.

Thus at the end of the day, our "practical" vacuum weighted path integral looks like

```math
\bra{0} e^{i \frac{\hat{E}}{\hbar} T} \ket{0} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{0} \ket{x_2} \bra{x_1} \ket{0} \int e^{i \int_{0}^{T} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} \partial^2 F - E_P(x, y, z) dx dy dz dt} dy(t) dx_1 dx_2
```

One further change. Now that we're in relativity-land, it's time to start putting space and time on more equal footing. You'll notice that the exponent now contains integrals over all four spatial dimensions -- three over all of space, and one from $`0`$ to $`T`$. To treat everything equally, and to simplify many integrals, we will usually evaluate the time integral over all of time as well (from $`0`$ to $`\infty`$). Doing so allows us to simplify the integral to one over all spacetime:

```math
\lim_{T \to \infty} \bra{0} e^{i \frac{\hat{E}}{\hbar} T} \ket{0} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{0} \ket{x_2} \bra{x_1} \ket{0} \int e^{i \int_{0}^{T}  \frac{1}{2} \partial^2 F - E_P(x) d^4 x} dy(t) dx_1 dx_2
```

Physically, this integral represents the probability density for the field to stay in the vacuum state forever.

## Perturbing Developments

With our new field Lagrangian in hand, we can finally set about doing some interesting physics. We mentioned earlier that "interesting physics" in quantum mechanics mostly involves taking the vacuum state and giving it a little poke. Mathematically, this means adding some new term to the Lagrangian.

We have to be careful when adding terms to the Lagrangian. After all, we just went to great lengths to explain why our Lagrangian must be Lorentz-invariant. Any new terms we add must be Lorentz-invariant as well. The simplest way to do this (the 'linear approximation') is to add a term of the form

```math
A(x) F(x, t)
```

Note that since we're perturbing the positional energy, this perturbation function $`A(x)`$ is only a function of position!

Throwing this into the Lagrangian, we get the grand product of this section: the **perturbed vacuum weighted path integral.** It should be a marker of how far you've come that you can understand what that means.

```math
\lim_{T \to \infty} \bra{0} e^{i \frac{\hat{E}}{\hbar} T} \ket{0} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{0} \ket{x_2} \bra{x_1} \ket{0} \int e^{i \int_{0}^{T}  \frac{1}{2} \partial^2 F - E_P(x) + A(x) F(x, t) d^4 x} dy(t) dx_1 dx_2
```

## Next Steps

So far in this section, we've done a whole lot of abstract math and not a lot of computation. We'll balance that out next time by looking at a simple case (the only case, in fact) where the above integral can be evaluated analytically. This will inadvertently give us our first truly quantum-field-theoretical equation: the *Klein-Gordon equation*.
