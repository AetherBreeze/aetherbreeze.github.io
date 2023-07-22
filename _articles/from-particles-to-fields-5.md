---
id: 23
title: "From Particles To Fields (5)"
subtitle: ""
date: "2023.07.20"
tags: "qft"
---

# The Quantum Klein-Gordon Equation

Last time, we introduced the idea of disturbing the vacuum. We used this to derive the form of the **perturbed vacuum weighted path integral**, which we claim can be used to make predictions. Today, we will start studyign a simple system for which we can do so.

## The Problem with Schrodinger

We'll start in a bit of a strange place.

One of the main advances we made last time was making the field Lagrangian Lorentz-invariant. This is a crucial property that theories must have to work with special relativity. Thus we are finally ready to start treating quantum mechanics as a special-relativistic theory.

However, there is a problem with doing this using our existing equations. Recall the form of the continuous Schrodinger equation:

```math
- \frac{1}{2 m} \frac{\partial^2 f}{\partial x^2} + \hat{V}(x) = i \hbar \frac{\partial f}{\partial t}
```

Do you see a problem with using this equation in relativistic scenarios?

The answer is that this equation treats time and space very differently. We take just a first derivative with respect to time, but a second derivative with respect to space. A proper relativistic equation should treat these two very similarly. Thus we cannot use the Schrodinger equation for relativistic quantum mechanics.

## The Klein-Gordon Equation

We can fix this problem by going back to the basics. Recall that, at its most fundamental, the Schrodinger equation is the quantum version of the equation

```math
E = E_K + E_P
```

This gives us a potential lead. If we can find a relativistic expression that includes the energy, we might be able to "quantum-ify" it in a similar way to how we derived the Schrodinger equation.

In relativity, the energy is best known for being the time component of the 4-momentum. The 4-momentum is a 4-vector whose time component is the energy, and whose $`x, y, z`$ components are the standard momentum. Can we write a useful equation using this quantity?

We can! It involves a fundamental property of four-vectors: **their magnitude does not change under a Lorentz transformation.** This means that the magnitude of the 4-momentum

```math
E^2 - p_x^2 - p_y^2 - p_z^2
```

must be the same in every reference frame. Note that we are setting our units such that the speed of light is $`1`$.

What happens next follows a common pattern for symmetry tricks. Since this quantity must be the same in every reference frame, we are free to choose a reference frame where it's very simple. Here, the simplest frame is probably the one where the particle we're studying is at rest. In this frame, all the momenta are zero, and the energy reduces to Einstein's famous equation

```math
E = mc^2
```

or, in units where $`c = 1`$,

```math
E = m
```

Thus the magnitude of the 4-momentum in this frame is simply $`m^2`$.

We can now use our symmetry rule to set the magnitude of the 4-momentum in *any* frame equal to this value:

```math
E^2 - p_x^2 - p_y^2 - p_z^2 = m^2
```

Now *this* is an equation we can quantize! All we have to do is substitute our quantum versions of the energy and momentum operators, and...

```math
-\frac{\partial^2}{\partial t^2} + \frac{\partial^2}{\partial x^2} + \frac{\partial^2}{\partial y^2} + \frac{\partial^2}{\partial z^2} = m^2
```

Wait. We've seen the first bit before: it's just the negative of the squared four-gradient!

```math
-\partial^2 = m^2
```

Moving everything to one side and letting it act on some function $`f`$, we find our relativistic version of the time-evolution equation:

```math
(\partial^2 + m^2) f = 0
```

This is misleadingly named the Klein-Gordon equation. In reality, Schrodinger himself derived this equation before he even derived the "actual" Schrodinger equation. Thus we should really call this the proto-Schrodinger equation, which is actually more advanced than the real Schrodinger equation. Physics history is weird.

## Finding the Right Lagrangian

What we've just done is one way to arrive at the relativistic quantum equation of motion. However, there is another, more "proper" way: deriving the equation from a Lagrangian using the least action principle. If what we've derived is the correct equation of motion, then the "most basic" Lagrangian should yield it as a result of this process.

We can use this idea to work backwards and figure out the proper "simple" Lagrangian. We know the equation of motion we want:

```math
(\partial^2 + m^2) f = 0
```

We will assume that you already know the field version of the least action equation. If you don't, or if you need a refresher on least action principles in general, you should **definitely** become familiar with them. They're the basis of all modern physics, and most of what remains to be done in this course. My recommendation would be to read *The Theoretical Minimum* by Leonard Susskind, but there is no shortage of excellent resources on the Internet.

Anyways, yes, the field version of the least action equation:

```math
\partial_a \frac{\partial L}{\partial (\partial a F)} - \frac{\partial L}{\partial f} = 0
```

We would like the solution of this equation to yield the relativistic time evolution equation. Since $`f`$ and $`\partial^2 f`$ each show up once in that equation, the solution is blissfully simple:

```math
L = \frac{1}{2} (\partial_a F)^2 - \frac{m^2}{2} f^2
```

This is the 'basic' field Lagrangian. We will now begin trying to solve the perturbed weighted vacuum path integral for this Lagrangian.

## Next Time

We will evaluate this integral in a totally normal and not haunted way. The first step will happen this time and isn't that bad. The next step will be the topic of tomorrow's entire lecture.

We'll start with the path integral itself:

```math
\int_{-\infty}^{\infty} \bra{0} \ket{x_2} \bra{x_1} \ket{x_2} \int e^{\frac{i}{\hbar} \int L d^4 x} dF(x, t)
```

Substituting in our basic Lagrangian, plus some perturbation term $`J(x) F(x, t)`$:

```math
\int_{-\infty}^{\infty} \bra{0} \ket{x_2} \bra{x_1} \ket{x_2} \int e^{\frac{i}{\hbar} \int \frac{1}{2} (\partial_a F)^2 - \frac{m^2}{2} F^2 + J(x) F d^4 x} dF(x, t)
```

For now, we'll just focus on evaluating the path integral itself. We'll leave the weighted component for another day. We totally won't ignore it until I can dig up some resource that explains why the hell this is always disregarded.

Next time we shall embark on the Bullshit Expedition.
