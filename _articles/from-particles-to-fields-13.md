---
id: 31
title: "From Particles To Fields (13)"
subtitle: ""
date: "2023.07.28"
tags: "qft"
---

# Interpreting the Propagator

Last time, we used contour integration and the residue theorem to simplify our expression for the propagator. Now we will interpret that expression and encounter a new famous friend.

## What the Hell Does "On-Shell" Mean?

The expression we ended up with last time for the propagator was

```math
D^{-1}(y - x) = \frac{i}{(2 \pi)^3} \int \frac{1}{2 \omega} (e^{i ((y - x)_\t \omega - (y - x)_\lambda p_\lambda)} \text{step}((y - x)_t) + e^{i (-(y - x)_t \omega - (y - x)_\lambda p_\lambda)} \text{step}(-(y - x)_t)) dp_\lambda
```

However, we can draw an interesting conclusion from considering an earlier version from before we dealt with the singularities:

```math
D^{-1}(y - x) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2 + i \epsilon} d^4 p
```

Whenever we see an integral over a plane wave like $`e^{i (y - x) p}`$, we should always look at the thing that's multiplying it. Integrals over plane waves by themselves are very boring. One might consider an integral over $`\cos(x)`$ to see why. However, if the scaling factor makes certain plane waves matter more than others, then these integrals can get *very* interesting. Thus to analyze this integral, we should look at places where the scaling factor is large.

Thankfully this case is very simple. The scaling factor is $`\frac{1}{p^2 - m^2 + i \epsilon}`$. This is large when the magnitude of the momentum $`p`$ is close to the mass $`m`$. **Thus waves for which $`|p|`$ is close to $`m`$ contribute the most to the propagator.**

Physicists often give this the utterly terrible name "the on-shell condition." The proverbial "shell" is the region where $`|p| = m`$; that is, where the relativistic mass-energy equation is satisfied. Processes that happen in this region make up most of the probability for most particle interactions. However, interestingly, *they don't make up ALL of the probability.*

I'll say that again, because it's important: *Processes which violate the relativistic mass-energy equation still contribute to the probability for an event.*

This is our first brush with a very important principle. In quantum mechanics, we are typically allowed to "bend" the rules of classical physics a little bit. Processes that break the classical rules, such as energy conservation, are still allowed to contribute to probabilities and even have physical relevance. However, these 'rule-breaking' processes must make *much* smaller contributions to the probabilities than the 'rule-following' processes do. If this were not the case, these classical mechanics rules wouldn't exist in the first place.

There are a couple of ways of interpreting these rule-breaking processes. One is the Heisenberg uncertainty principle. Another is the existence of "virtual particles." In fact, I believe (naively) that this concept gives us a better way to view virtual particlesL **Virtual particles are the 'rule-breaking' processes that contribute little bits of probabilities.** We will see more from this interpretation later.

## Propagating Across Time

To get a further feel for the propagator, we might consider some special cases. We will start by assuming (without loss of generality) that the particle is starting at the origin. This lets us get rid of $`x`$ and knock our integral down to just one spatial coordinate:

```math
D^{-1}(y) = \frac{i}{(2 \pi)^3} \int \frac{1}{2 \omega} (e^{i (y_\t \omega - y_\lambda p_\lambda)} \text{step}(y_t) + e^{i (-y_t \omega - y_\lambda p_\lambda)} \text{step}(-y_t)) dp_\lambda
```

We will then consider perhaps the simplest possible case: a particle moving through time but not through space. In this case, the spatial coordinates $`y_\lambda`$ will be zero, and the integral will simplify to

```math
D^{-1}(y) = \frac{i}{(2 \pi)^3} \int \frac{1}{2 \omega} (e^{i y_t \omega} \text{step}(y_t) + e^{-i y_t \omega} \text{step}(-y_t)) dp_\lambda
```

There are two interesting cases here. When we consider the particle propagating forward in time (that is, when $`y_t > 0`$), then this simplifies further to

```math
D^{-1}(y) = \frac{i}{(2 \pi)^3} \int \frac{1}{2 \omega} e^{i y_t \omega} dp_\lambda
```

that is, the forward-time propagator oscillates with a frequency $`\omega = \sqrt{p_\lambda^2 + m^2}`$. Similarly, backwards in time, we get the other half of the step function:

```math
D^{-1}(y) = \frac{i}{(2 \pi)^3} \int \frac{1}{2 \omega}  e^{-i y_t \omega} dp_\lambda
```

Thus the propagator for a particle standing still has two "halves": a wave propagating forward in time and a wave propagating backward in time. The only difference between the two is the sign of the frequency.

This has an interesting consequence. First, it implies that physics behaves more or less the same whether forwards and backwards in time. This is somewhat unintuitive. In our everyday lives, it seems like things behave very different whether they're going forwards or backwards in time. It is natural for a glass to fall and shatter on the floor, it is unnatural for the shattered pieces of glass to reassemble themselves and float back into your hand. One might therefore assume that the laws of physics differ depending on the direction of time. Yet we are seeing here that this is not the case. The basic laws of physics are pretty similar forwards and backwards in time; it is only in more complex systems when entropy makes the arrow of time obvious.

## Propagating Through Space

Finally, something even more interesting happens when we consider the particle's propagation in another direction. In this case we will consider a particle that isn't moving at all in time ($`y_t = 0`$), but that *is* moving in space. That is, we consider particles that violate causality.

This is actually a bit tricky because the step function $`\text{step}(y)`$ is not well-defined for $`y = 0`$. For the purposes of our analysis, we will take the standard mathematical approach and say that $`\text{step}(0) = 0.5`$. This lets us simplify our integral to

```math
D^{-1}(y) = \frac{i}{(2 \pi)^3} \int \frac{1}{2 \omega} e^{-i y_\lambda p_\lambda} dp_\lambda
```

This is another integral over a plane wave. Thus, as mentioned before, we should look closely at places where the coefficient of the plane wave is large. The coefficient here is

```math
\frac{1}{2 \omega} = \frac{1}{2 \sqrt{p_\lambda^2 + m^2}}
```

At first glance, this coefficient might seem to be permanently bounded from above by $`\frac{1}{m^2}`$. However, the introduction of the complex plane gives us new freedom. We find that the probabilities are maximized here when

```math
p_\lambda \to -i m
```

Substituting this into the exponential, we find that the waves with the most contribution are

```math
e^{-i y_\lambda (-i m)} = e^{- |y_\lambda| m}
```

This is another instance of the earlier phenomenon we mentioned where quantum systems can "bend" the classical rules. In classical mechanics, we don't even need to consider paths that 'break causality' (that leave the light cone). However, in quantum mechanics, these paths still contribute some probability. The probability in this case falls off exponentially and proportional to the particle's mass $`m`$.

**Thus in quantum mechanics, particles can "leak" outside of their light cone. Particles that do so contribute probabilities which exponentially decay with the particle's mass.** From some perspectives, this is an instance of Heisenberg's uncertainy principle. In my mind, this agrees better with the standard idea of virtual paticles, but who am I to say?

## Next Steps

At long last, we're done introducing the propagator. It was quite a journey: we started from the mass-weighted path integral, discretized spacetime, found the matrix version of the Gaussian integral, met the mass-adjusted derivative, found its inverse (the propagator), and partially evaluated it using contour integration. As our prize, we have a powerful tool to calculate probabilities for fields and particles in quantum mechancis. We have also discovered the concepts of "on-shell" or "rule-following" calculations and analyzed the "virtual particles" that arise from "rule-breaking calculations."

Next time, we'll start looking at how we can use these ideas to introduce quantum-mechanical force fields. Doesn't that name just sound great by itself?
