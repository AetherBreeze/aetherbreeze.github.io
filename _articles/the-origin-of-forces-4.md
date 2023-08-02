---
id: 34
title: "The Origin of Forces (4)"
subtitle: ""
date: "2023.08.01"
tags: "qft"
---

# Forces From the Path Exponent (3)

Last time, we attempted to more rigorously derive an integral related to forces in the path integral. Today, we will evaluate that integral.

## Into Spherical Coordinates

Through a series of mathematically dubious shenanigans, we have reduced the path integral exponent integral

```math
\frac{1}{(2 \pi)^4} \int J(p)^\dag \frac{1}{p^2 - m^2 + i \epsilon} J(p) d^4 p
```

for a vacuum perturbation $`J(p)`$ that consists of two spike functions at spacetime points $`x_1, x_2`$:

```math
J(x) = \delta(x - x_1) + \delta(x - x_2)
```

to an integral over the three spatial components of momentum:

```math
-\frac{1}{(2 \pi)^2} \int \frac{e^{-i (x_2 - x_1)_\lambda p_\lambda}}{p_\lambda^2 + m^2 + i \epsilon} d^3 p_\lambda
```

Since the denominator is now always positive, we can finally drop the singularity-dodging $`i \epsilon`$ term:

```math
-\frac{1}{(2 \pi)^2} \int \frac{e^{-i (x_2 - x_1)_\lambda p_\lambda}}{p_\lambda^2 + m^2} d^3 p_\lambda
```

We will now evaluate this integral.

First, we'll swap to a better set of coordinates. Note that the three momentum components $`p_x, p_y, p_z`$ never show up alone. We only have terms containing the magnitude of $`p_\lambda`$ and the dot product of $`p_\lambda`$ with another vector. This is a strong hint that the integral may be better computed in spherical coordinates.

We'll define these spherical coordinates as such. The radial coordinate, $`P`$, will just be the magnitude of $`p_\lambda`$. This gives us an easy way to write the denominator.

Next, we need to find a way to write the dot product. We'll do this by defining a new vector along the displacement:

```math
\bar{x} := (x_2 - x_1)_\lambda
```

We'll set our coordinates such that $`\bar{x}`$ always points in the radial direction. We'll then define the first angular coordinate, $`\theta`$, as the angle between the three-momentum $`p_\lambda`$ and $`\bar{x}`$. This will allow us to write their dot product as

```math
|\bar{x}| P \cos(\theta) = (x_2 - x_1)_\lambda p_\lambda
```

Finally, we'll throw in the last unused spherical coordinate $`\phi`$.

In the end, remembering to throw in the area factor, our transformed integral will look like this:

```math
-\frac{1}{(2 \pi)^2} \int \frac{e^{-i (x_2 - x_1)_\lambda p_\lambda}}{p_\lambda^2 + m^2} d^3 p_\lambda = -\frac{1}{(2 \pi)^2} \int_0^{\infty} \int_{0}^{\pi} \int_{0}^{2 \pi} \frac{e^{-i |\bar{x}| P \cos(\theta)}}{P^2 + m^2} P^2 \cos(\theta) dP d\theta d\phi
```

## Evaluating The Integral

### Phi

We'll start where we usually start with spherical integrals: doing the trivial $`\phi`$ integral:

```math
-\frac{1}{(2 \pi)^2} \int_0^{\infty} \int_{0}^{\pi} \int_{0}^{2 \pi} \frac{e^{-i |\bar{x}| P \cos(\theta)}}{P^2 + m^2} P^2 \cos(\theta) dP d\theta d\phi = -\frac{1}{2 \pi} \int_0^{\infty} \int_{0}^{\pi} \frac{e^{-i |\bar{x}| P \cos(\theta)}}{P^2 + m^2} P^2 \sin(\theta) dP d\theta
```

### Theta

We'll then make another change of coordinates. Since $`\theta`$ only shows up in our original integrand as $`\cos(\theta)`$, we can use this itself as a coordinate

```math
C := \cos(\theta)
```

We can calculate its differential:

```math
\frac{d C}{d \theta} = -\sin(\theta) \implies dC = -\sin(\theta) d\theta \implies d\theta = -\frac{d C}{\sin(\theta)}
```

Behold! The factor of $`\frac{1}{\sin(theta)}`$ in the differential perfectly cancels out the $`\sin(\theta)`$ from the earlier area factor. This is a common trick in spherical integrals: if $`\theta`$ only shows up via $`\cos(\theta)`$, this change of coordinates is often useful.

Plugging this in, our integral gets a lot simpler:

```math
-\frac{1}{2 \pi} \int_0^{\infty} \int_{0}^{\pi} \frac{e^{-i |\bar{x}| P \cos(\theta)}}{P^2 + m^2} P^2 \sin(\theta) dP d\theta = \frac{1}{2 \pi} \int_0^{\infty} \int_{1}^{-1} \frac{e^{-i |\bar{x}| P C}}{P^2 + m^2} P^2 dP dC
```

Flipping the bounds of $`C`$ re-introduces our minus sign:

```math
\frac{1}{2 \pi} \int_0^{\infty} \int_{1}^{-1} \frac{e^{-i |\bar{x}| P C}}{P^2 + m^2} P^2 dP dC = -\frac{1}{2 \pi} \int_0^{\infty} \int_{-1}^{1} \frac{e^{-i |\bar{x}| P C}}{P^2 + m^2} P^2 dP dC
```

The $`C`$ integral is now very simple:

```math
\int_{-1}^{1} \frac{e^{-i |\bar{x}| P C}}{P^2 + m^2} P^2 dC = \left[\frac{P^2}{-i |\bar{x}| P} \frac{e^{-i |\bar{x}| P C}}{P^2 + m^2}\right]_{-1}^{1} = \left[\frac{P}{-i |\bar{x}|} \frac{e^{-i |\bar{x}| P C}}{P^2 + m^2}\right]_{-1}^{1} = \frac{P}{-i |\bar{x}|} \frac{e^{-i |\bar{x}| P} - e^{i |\bar{x}| P}}{P^2 + m^2}
```

## P

All of a sudden, this numerator is something very familiar. The difference of two imaginary exponents like this is just twice the imaginary sine of the argument:

```math
e^{i x} - e^{-i x} = (\cos(x) + i \sin(x)) - (\cos(x) - i \sin(x)) = 2 i \sin(x)
```

Substituting this in, we get a (relatively) simpler expression:

```math
-\frac{1}{2 \pi} \int_0^{\infty} \frac{P}{-i |\bar{x}|} \frac{e^{-i |\bar{x}| P} - e^{i |\bar{x}| P}}{P^2 + m^2} dP = -\frac{1}{2 \pi} \int_0^{\infty} \frac{P}{-i |\bar{x}|} \frac{-2 i \sin(\bar{x} P)}{P^2 + m^2} dP
```

Taking a second to group the constants:

```math
-\frac{1}{2 \pi} \int_0^{\infty} \frac{P}{-i |\bar{x}|} \frac{-2 i \sin(\bar{x} P)}{P^2 + m^2} dP = -\frac{1}{\pi |\bar{x}|} \int_0^{\infty} P \frac{\sin(\bar{x} P)}{P^2 + m^2} dP
```

We can now pull a second clever trick to turn this sine back into an exponential. The complex exponential $`e^{i x}`$ is $`\cos(x) + i \sin(x)`$. We already have $`\sin(x)`$ here, so if we could add a term proportional to $`\cos(x)`$, we could pull everything back into an easier-to-integrate exponential. However, obviously, we can't add random terms to a random integral... or can we?

Let's be explicit about what we want. We'd like to be able to write something like

```math
-\frac{1}{\pi |\bar{x}|} \int_0^{\infty} P \frac{\sin(\bar{x} P)}{P^2 + m^2} dP = -\frac{1}{\pi |\bar{x}|} \int_0^{\infty} P \frac{\sin(\bar{x} P) - i \cos(\bar{x})}{P^2 + m^2} dP = -\frac{1}{\pi |\bar{x}|} (\int_0^{\infty} P \frac{\sin(\bar{x} P)}{P^2 + m^2} - i \int_0^{\infty} P \frac{\cos(\bar{x} P)}{P^2 + m^2} dP)
```

By starting with our dream scenario, we've narrowed down our goal. We now just need to show that this second integral is zero.

Unfortunately for us, this integral is not zero. Fortunately for us, it can be convinced to become so with a little trickery.

Consider the original integral again:

```math
-\frac{1}{\pi |\bar{x}|} \int_0^{\infty} P \frac{\sin(\bar{x} P)}{P^2 + m^2} dP
```

Note that the integrand here is the product of an odd function $`P`$, another odd function $`\sin`$, and an even function $`\frac{1}{P^2 + m^2}`$. Thus this entire integral is even. If we replaced the sine with a cosine, it would become odd. And if we integrate an odd function over symmetric bounds, it has to be zero!

Let's put this plan into action. First, we use the even nature of this integral to extend it from $`0 \to \infty`$ to $`-\infty \to \infty`$:

```math
-\frac{1}{\pi |\bar{x}|} \int_0^{\infty} P \frac{\sin(\bar{x} P)}{P^2 + m^2} dP = -\frac{1}{2 \pi |\bar{x}|} \int_{-\infty}^{\infty} P \frac{\sin(\bar{x} P)}{P^2 + m^2} dP
```

This time, when we add our corresponding cosine function, the integrand becomes odd and gets integrated over symmetric bounds -- thus becoming zero!

```math
\int_{-\infty}^{\infty} P \frac{\cos(\bar{x} P)}{P^2 + m^2} dP = 0
```

Thus we can rewrite our above integral using a complex exponential:

```math
-\frac{1}{2 \pi |\bar{x}|} \int_{-\infty}^{\infty} P \frac{\sin(\bar{x} P)}{P^2 + m^2} dP = -\frac{1}{2 \pi |\bar{x}|} \int_{-\infty}^{\infty} P \frac{\sin(\bar{x} P) - i \cos(\bar{x} P)}{P^2 + m^2} dP = \frac{i}{2 \pi |\bar{x}|} \int_{-\infty}^{\infty} P \frac{e^{i \bar{x} P}}{P^2 + m^2} dP
```

### Back to Residues

This is now a complex contour integral along a closed(?) contour. Thus it is zero save for the residues.

There are two singularities at play here: $`P = \pm i m`$. However, for reasons I don't totally understand, we only consider the singularity at $`P = +i m`$. The argument is given that "since $`|\bar{x}|`$ is positive, the function is exponentiall damped in the upper-half plane; thus we want to pick up the pole in the upper half plane." I don't understand that at all. Maybe we only want to pick up poles where the function is exponentially damped? But if so, why?

Whatever. Let's power through:

```math
P \frac{e^{i \bar{x} P}}{P^2 + m^2} = P \frac{e^{i \bar{x} P}}{(P + i m)(P - i m)} \implies \text{Res}_{i m} = (i m) \frac{e^{i \bar{x} i m}}{i m + i m} = \frac{e^{-\bar{x} m}}{2}
```

Thus the residue's contribution to the integral is

```math
i 2 \pi \sum \text{Res} = i \pi e^{-\bar{x} m}
```

and the integral as a whole comes out to

```math
\frac{i}{2 \pi |\bar{x}|} \int_{-\infty}^{\infty} P \frac{e^{i \bar{x} P}}{P^2 + m^2} dP = \frac{i}{2 \pi |\bar{x}|} (i \pi e^{-\bar{x} m}) = -\frac{e^{|\bar{x}| m}}{2 |\bar{x}|}
```

where we have finally stopped abusing notation in the exponent and written $`|\bar{x}|`$ instead of $`\bar{x}`$. Sorry!

## Damn

This is almost what we wanted. We wanted to show that this integral gave rise to a central force law. However, we fell short by the exact factor of $`2 \pi`$ in the denominator that we dropped earlier during the spike function debacle:

```math
-\frac{e^{|\bar{x}| m}}{2 |\bar{x}|} \neq -\frac{e^{|\bar{x}| m}}{4 \pi |\bar{x}|}
```

Tomorrow I'll see if I can find a source on why the spike nonsense worked out the way it is. If I can't, I'll keep going on with this chapter, but I might reconsider the book if it's pulling inexplicable mathematical nonsense out of its ass to make its predictions give nice equations.
