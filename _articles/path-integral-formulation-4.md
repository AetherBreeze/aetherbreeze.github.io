---
id: 16
title: "Path Integral Method (3)"
subtitle: ""
date: "2023.07.13"
tags: "qft"
---

# Lagrangian Ex Vacuo

Last time, we took a mathematical detour to calculate the probability density of a single small path in our path integral. Today, we will apply this result to all small paths. This will, seemingly out of nowhere, spawn one of the most fundamental objects in all of theoretical physics.

## Studying One Piece

Since we've just done a lot of math, let's remind ourselves of our actual physical goal. We want to calculate the probability density for a particle to move from some position $`x_1`$ at time $`0`$ to some position $`x_2`$ at time $`t`$. In its most deceptively complex form, this is

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_2}
```

This simple-looking equation is actually devilishly complex. To simplify it, we broke it down into a product of a bunch of probability densities for $`N`$ smaller paths:

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_2} = \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} (\bra{x_2} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{y_N}) (\bra{y_N} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{y_{N-1}}) ... (\bra{y_2} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{y_1}) (\bra{x_1} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{x_1})
```

We then zoomed in on just one of these probability densities. We chose the simplest case (where there's no potential energy, so that $`\hat{E} = \frac{\hat{P}^2}{2 m}`$) and evaluated it using the Gaussian integral:

```math
\bra{y_b} e^{i \frac{\hat{p^2}}{2 m \hbar} \frac{t}{N}} \ket{y_a} = \sqrt{\frac{i m \hbar}{2 \pi \delta_N t}} e^{-i \frac{m (y_b - y_a)^2}{2 \delta_N t}}
```

where we have introduced the shorthand $`\delta_N t = \frac{t}{N}`$.

## Putting It All Together

With this solution in hand, we can go ahead and plug it in for *every* small path. For convenience, we'll define $`y_0 = x_1`$ and $`y_{N + 1} = x_2`$:

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_2} = \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} (\sqrt{\frac{i m \hbar}{2 \pi \delta_N t}} e^{-i \frac{m (y_{N + 1} - y_{N})^2}{2 \delta_N t}}) (\sqrt{\frac{i m \hbar}{2 \pi \delta_N t}} e^{-i \frac{m (y_N - y_{N - 1})^2}{2 \delta_N t}}) ... (\sqrt{\frac{i m \hbar}{2 \pi \delta_N t}} e^{-i \frac{m (y_2 - y_1)^2}{2 \delta_N t}}) (\sqrt{\frac{i m \hbar}{2 \pi \delta_N t}} e^{-i \frac{m (y_1 - y_0)^2}{2 \delta_N t}})
```

Note how the only thing that changes in every term is the difference of coordaintes. We can use exponential terms to clean this up quite a bit:

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_2} = \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} \left(\frac{i m \hbar}{2 \pi \delta_N t}\right)^{N / 2} e^{\sum_{a = 0}^{N} -i \frac{m (y_{a + 1} - y_{a})^2}{2 \delta_N t}}
```

Hold on. Take a look at that exponent for a second:

```math
-i \frac{m (y_{a + 1} - y_{a})^2}{2 \delta_N t}
```

If we squint...

```math
-i \delta_N t \frac{m}{2} \frac{(y_{a + 1} - y_{a})^2}{\delta_N t^2} = -i \delta_N t \frac{m v^2}{2}
```

That's right -- like magic, it's the (lower limit of) kinetic energy!

Well, almost. We do have to take two limits first: $`\delta_N t \to 0`$, and $`y_b \to y_a`$. This corresponds to looking at smaller and smaller path slices, until they're infinitesimally small and we can integrate over them. Doing so, the travel probability density becomes

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_2} = \lim_{N \to \infty} \left(\frac{i m \hbar N}{2 \pi t}\right)^{N / 2} \Pi \int_{x_1}^{x_2} dy_a e^{-i \int_0^T \frac{m (\dot{y}(t))^2}{2} dt}
```

We can now finally define the path integral as this product of integrals over all intermediate points, times the collective constant:

```math
\int dy(t) := \lim_{N \to \infty} \left(\frac{i m \hbar N}{2 \pi t}\right)^{N / 2} \Pi \int_{x_1}^{x_2} dy_a
```

With this tool, we can finally write what Feynman was famous for (well, one of the things...)

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_2} = \int e^{-i \int_0^T \frac{m \dot{y}(t)^2}{2} dt} dy(t)
```

## The Elephant In The Room

Before I go any further, I should mention a few important things. The first is something observant readers might have noticed. Look at the constant in the path integral's definition:

```math
\lim_{N \to \infty} \left(\frac{i m \hbar N}{2 \pi t}\right)^{N / 2}
```

This *incredibly* diverges. Like, super-ultra-diverges. I'm not exactly sure what the resolution to this divergence is (or if there even is one), so let's keep it in the back of our minds. 

The second thing is a bit more abstract. If you look carefully at the path integral itself, you'll see that it's an integral over an imaginary exponent:

```math
\int e^{-i \int_0^T \frac{m \dot{y}(t)^2}{2} dt} dy(t)
```

This is essentially the same as doing an integral over a full sine or cosine wave. It is not guaranteed to converge. However, in most physical cases, the exponent itself will supress almost all the terms and the integral will converge nicely. This is a physicist solution -- it isn't mathematically rigorous, but it usually works well enough.

For a rigorous solution, we need to turn to a mathematical trick known as a *Wick rotation*. This just means that we send the time $`t`$ to an imaginary time $`i t`$. If you look back at our derivation, you'll see that this gets rid of the imaginary values and makes the path integral converge nicely:

```math
\int e^{-\int_0^T \frac{m \dot{y}(t)^2}{2} dt} dy(t)
```

This is actually quite interesting. Experienced readers might note that Wick rotations are also used in special relativity to convert the Minkowski metric to the Euclidean metric. Some people believe these are deep truths hiding in the use of Wick rotations. I don't know enough to be one of them, but I would be remiss if I didn't point it out.

## Deriving the Lagrangian

With that out of the way, we can go back and generalize our last simplification. Recall that, to derive the short-path probability density, we assumed that the energy $`\hat{E}`$ was just the kinetic energy $`\frac{\hat{P}^2}{2 m}`$. Now we can consider the case with a potential energy:

```math
\hat{E} = \frac{\hat{P}^2}{2 m} + \hat{V}(\hat{X})
```

The short-path probability density would then be

```math
\bra{y_a} e^{i \left(\frac{\hat{P}^2}{2 m \hbar} + \frac{\hat{V}(\hat{X})}{\hbar}\right) \frac{t}{N}} \ket{y_b}
```

Once again, exponent properties come in clutch:

```math
\bra{y_a} e^{i \frac{\hat{P}^2}{2 m \hbar}} e^{i \frac{\hat{V}(\hat{X})}{\hbar} \frac{t}{N}} \ket{y_b}
```

Since the potential value operator $`\hat{V}(\hat{X})`$ is a function of the position operator, it acts trivially on position states like $`\ket{y_b}`$:

```math
\bra{y_a} e^{i \frac{\hat{P}^2}{2 m \hbar}} e^{i \frac{V(y_b)}{\hbar} \frac{t}{N}} \ket{y_b}
```

This factor of $`e^{i \frac{V(y_b)}{\hbar} \frac{t}{N}}`$ gets carried along as a spectator for the Gaussian integral odyssey. Then, when we take the limit $`\frac{t}{N} \to dt`$, it gets pulled into the integral. Note that, since it doesn't itself go through the Gaussian integral, **it doesn't pick up the minus sign that the kinetic energy does**:

```math
\int e^{i \int_0^T -\frac{m \dot{y}(t)^2}{2} + V(y(t)) dt} dy(t)
```

This lack of a minus sign is crucial. It means that the term in the integral isn't quite the classical energy, but instead a strange new thing:

```math
L = -\frac{m \dot{y(t)}^2}{2} + V(y(t))
```

In classical physics, we typically take the minus sign out of the integral and instead consider the quantity:


```math
-L = \frac{m \dot{y(t)}^2}{2} - V(y(t))
```

Physics enjoyers already know what this is. It needs no introduction, but it deserves one anyway: it is the *Lagrangian*, and its integral is the *action*.

This may not strike you as astounding, but it does strike me as such, so I'll repeat what just happened. We started with the basic principle of quantum mechanics. We then used the time evolution operator to calculate the probability for a particle to move from point $`x_1`$ to $`x_2`$ over a time duration $`T`$. Then, with no other assumptions, we found a solution which involves the integral of the Lagrangian from $`0`$ to $`T`$.

Next time, we will wrap this study up by using this to derive the basis of all classical physics.
