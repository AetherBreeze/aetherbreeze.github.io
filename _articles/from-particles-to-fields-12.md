---
id: 30
title: "From Particles To Fields (12)"
subtitle: ""
date: "2023.07.27"
tags: "qft"
---

# The Propagator and Contour Integration (2)

Today, we will delve into the contour integration in the propagator.

## Dealing with Singularities (again) (again)

Recall our "fixed" expression for the free propagator:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + i \epsilon} d^4 p
```

We made the singularities more obvious by splitting the momentum into its time and spatial components:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x)_t p_t - (y - x)_\lambda p_\lambda}}{p_t^2 - p_\lambda^2 - m^2 + i \epsilon} dp_\lambda dp_t
```

We then introduced the convenient variable $`\omega`$ to study the denominator in terms of $`p_t`$:

```math
\omega = \sqrt{p_\lambda^2 + m^2}
```

which puts the denominator in the simpler form

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x)_t p_t - i (y - x)_\lambda p_\lambda}}{p_t^2 - \omega^2 + i \epsilon} dp_\lambda dp_t
```

The singularities can now be easily examined in terms of $`p_t`$. To isolate them even further, we will split this integrand using exponent rules into an "outer" integral over $`p_\lambda`$ and an "inner" integral over $`p_t`$:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int e^{-i (y - x)_\lambda p_\lambda} \int \frac{e^{i (y - x)_t p_t}}{p_t^2 - \omega^2 + i \epsilon} dp_t dp_\lambda
```

The "outer" integral currently has no singularities, so we'll disregard it for now and focus on the tricky part:

```math
\int \frac{e^{i (y - x)_t p_t}}{p_t^2 - \omega^2 + i \epsilon} dp_t
```

## The Residue Theorem

I will now skip about a 40 minute video's worth of background on complex analysis. Specifically, [this video by Mathemaniac](https://www.youtube.com/watch?v=EyBDtUtyshk). It's the best expository of complex analysis and the residue theorem I've ever seen by a long shot. We're going to proceed with the assumption that you understand the residue theorem, so if you don't, *please* take some time to watch that video. Seriously, it's half a college course in one free package.

Got it? Good. I will now assume that you understand the residue theorem and why it's important for complex integrals.

Recall that we changed the path of our integral to dance around two singularities on the momentum axis. In doing so, we introduced two new singularities at

```math
p_t = \pm \sqrt{\omega^2 - i \epsilon}
```

We will eventually take the limit $`\epsilon \to 0`$. In that limit, the square root simplifies to its linear term:

```math
p_t = \pm (\omega - i \epsilon)
```

Thus we can factor the denominator, in the limit, to

```math
p_t^2 - \omega^2 + i \epsilon \to (p_t - \omega + i \epsilon)(p_t + \omega - i \epsilon)
```

Let's quickly expand the right term and confirm this:

```math
(p_t - \omega + i \epsilon)(p_t + \omega - i \epsilon) = p_t^2 - \omega^2 + 2 i \omega \epsilon + \epsilon^2
```

In the limit, any finite multiple of $`\epsilon`$ is just $`\epsilon`$, and terms of order $`\epsilon^2`$ vanish, so this reduces to

```math
p_t^2 - \omega^2 + 2 i \omega \epsilon + \epsilon^2 \to p_t^2 - \omega^2 + i \epsilon
```

as desired. Thus in the limit, our integral of interest factors out to

```math
\int \frac{e^{i (y - x)_t p_t}}{(p_t - (\omega - i \epsilon))(p_t + (\omega - i \epsilon))} dp_t
```

## Finding the Residues

Now that the integrand's denominator is factored, it's much easier to apply the residue theorem. There are two singularities to consider:

```math
p_t = \pm (\omega - i \epsilon)
```

It's possible to consider them together, but practically, it's easier to take them on one by one. Thus we will now split our analysis in two halves: one where $`p_t`$ is positive, and one where $`p_t`$ is negative. (Note that we are assuming $`\omega = \sqrt{p_\lambda^2 - m^2}`$ is positive).

When $`p_t`$ is positive, the singularity is at $`\omega - i \epsilon`$. The residue at this point is

```math
R_+ = \frac{e^{i (y - x)_t (\omega - i \epsilon)}}{((\omega - i \epsilon) + (\omega - i \epsilon))}
```

Dropping terms of order $`\epsilon`$ in the exponent and combining them in the denominator, this simplifies to

```math
R_+ = \frac{e^{i (y - x)_t (\omega - i \epsilon)}}{2 \omega - i \epsilon}
```

Similarly, when $`p_t`$ is negative, the singularity at $`\omega + i \epsilon`$ has residue

```math
R_- = \frac{e^{-i (y - x)_t (\omega - i \epsilon)}}{-2 \omega + i \epsilon}
```

The above value isn't too hard to derive. It's a good test of your complex analysis knowledge to do so yourself.

We can now apply the residue theorem. The integral over positive $`p_t`$ is just

```math
2 \pi i R_+ = 2 \pi i \frac{e^{i (y - x)_t (\omega - i \epsilon)}}{2 \omega - i \epsilon}
```

and the integral over negative $`p_t`$ is

```math
2 \pi i R_+ = -2 \pi i \frac{e^{-i (y - x)_t (\omega - i \epsilon)}}{-2 \omega + i \epsilon}
```

We can combine these using the step function $`\text{step}(p_t)`$. The step function is a simple "utility" function defined to be $`0`$ when $`x`$ is negative and $`1`$ when $`x`$ is positive. (Observant readers might intuit that the step function is just the integral of the spike function!) With this trick, we can write our full integral in one, fairly simple piece:

```math
\int \frac{e^{i (y - x)_t p_t}}{p_t^2 - \omega^2 + i \epsilon} dp_t = \frac{2 \pi i}{2 \omega - i \epsilon} (e^{i (y - x)_t (\omega - i \epsilon)} \text{step}(p_t) + e^{-i (y - x)_t (\omega - i \epsilon)} \text{step}(-p_t))
```

Finally we see the payout for our efforts -- the denominator no longer has singularities in $`p_t`$, and we can finally the limit $`\epsilon \to 0`$:

```math
\int \frac{e^{i (y - x)_t p_t}}{p_t^2 - \omega^2 + i \epsilon} dp_t = \frac{2 \pi i}{2 \omega} (e^{i (y - x)_t \omega} \text{step}(p_t) + e^{-i (y - x)_t \omega} \text{step}(-p_t))
```

We don't need to worry about the singularities anymore -- we've taken care of them using residues, and the remaining integral path will steer well clear of them. Nice!

## Plugging It Back In

We have now solved... the *inner* integral for the propagator. Substituting it back into the full four-dimensional integral from the intro, we get our final-ish expression:

```math
D^{-1}(y - x) = \frac{i}{(2 \pi)^3} \int e^{i ((y - x)_\t \omega - (y - x)_\lambda p_\lambda)} \text{step}(p_t) + e^{i (-(y - x)_t \omega - (y - x)_\lambda p_\lambda)} \text{step}(-p_t) dp_\lambda
```

This is about as simple as it gets in quantum field theory. It may look complicated right now, but in time, we'll grow to understand each and every part of this expression. We'll wrap up our discussion on it next time before finally (*finally*) moving onto the next chapter.
