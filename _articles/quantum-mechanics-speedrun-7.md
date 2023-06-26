---
id: 5
title: "Quantum Mechanics Speedrun (7)"
subtitle: ""
date: "2023.06.25"
tags: "qft"
---

# The Schrodinger Equation

At its heart, physics is about answering one question: "Given a system $`S`$ at time $`t`$, what does $`S`$ look like at time $`t + a`$"? In other words, how does a system evolve with time?

This question is more difficult than it may seem. First, we have to mathematically define a *system*. Our last page wrapped up that part of the problem. Now we get to tackle the fun part: given that we know what a system is, how does it change with time?

The answer is shockingly simple. In fact, it's so simple that you could probably come up with it yourself. We'll give you some pointers today, and then come back tomorrow and do the derivation for real. This is a good way of flexing your theoretical muscles and definitely *not*  because I just worked 16 hours on a Sunday and I'll lose the money I made doing it if this page isn't up in three hours.

## The Most Fundamental Principle In Physics

As always when we're developing a theory, we start by asking which experimental facts we want to build our mathematics around. Since we're tackling a topic that deals with time, we might restrict our search for experimental facts that have to do with time evolution. What experimental facts do we know that deal with how systems change with time?

Here's our first major hint: What facts do we know that deal with how systems *don't* change with time?

Immediately, our minds jump to energy. One of the most fundamental experimental facts in physics (the third most fundamental, by my count) is that *the energy of a closed system doesn't change with time.* This is exactly what we were looking for: a fact about time evolution to base our theory around.

## The Problem With Conservation Of Energy

In fact, energy conservation by itself is almost enough to give us our time evolution law. To see why, consider our definition of a system in quantum mechanics:

1. A system can be described by an $`N`$-dimensional vector $`\ket{S}`$, where $`N`$ is the (possibly infinite) number of states the system can be in. Each possible state $`s_a`$ is represented by a basis vector $`\ket{s_a}`$.
2. The probability (density) of measuring the system in some state $`s_a`$ is the squared magnitude of the coefficient of $`\ket{s_a}`$. That is, $`\text{prob}(s_a) = |\bra{S} \ket{s_a}|^2`$.

Our systems are expanded in terms of their possible states. The key here is to realize that *an energy level is just a state of the system*. This means that we can expand $`\ket{S}`$ in terms of its possible energy levels. For simplicity, we'll start with a system that has a finite number $E_1, E_2,.. E_N$ of energy levels:

```math
\ket{S} = p_1 \ket{E_1} + p_2 \ket{E_2} +.. p_N \ket{E_N}
```

Now we ask a surprisingly tricky question. What is the energy of this system?

We don't know for sure. All we know is that, when we measure the energy, we'll get $`E_1`$ with probability $`|p_1|^2`$, $`E_2`$ with probability $`|p_2|^2`$, and so on. 

This may seem like a problem. How can we have energy conservation if we don't even know what the energy of the state will be until we measure it?

## Energy Conservation, Quantum Style

The answer, as it often is when inventing new physics, is to find the closest analogue of energy conversion that makes sense within our theory.

This is fairly simple in our case. We may not know the *precise* energy of the system before measuring it, but we know the *average* value of the energy: it is each energy level multiplied by its probability:

```math
E_\text{avg} = \sum_{a=1}^N |p_a|^2 E_a
```

This gives us our first guess at what energy conservation looks like in quantum mechanics:

**Quantum energy conservation (v1):** The average energy of a system $`S`$ does not change with time.

(Note that for a system with only one energy, this reduces to classical energy conservation.)

In fact, we can be a little more precise. In general, the only way to ensure that the average value doesn't change is to ensure that the probabilities $`|p_a|^2`$ don't change. Thus we can write this principle slightly more specifically:

**Quantum energy conservation (v2):** The probability (i.e., the squared magnitudes of the coefficients) of the energy states of a system don't change with time.

## Schrodinger's Footsteps

This statement of energy conservation gives us our second major clue. What kind of operation can we do to the system without changing the magnitudes of its complex coefficients?

The answer is (almost) as simple as it sounds. Feel free to ruminate on your own; next time, we will see the canonical answer, and the canonical equation of motion for quantum mechanics.
