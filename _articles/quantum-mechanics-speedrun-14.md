---
id: 19
title: "Quantum Mechanics Speedrun (14)"
subtitle: ""
date: "2023.07.16"
tags: "qft"
---

# Introduction to Entanglement and Many Worlds

I've realized that I forgot to explain two very important elements of quantum mechanics: how it describes multiple particles, and how it describes entanglement. Today, we will cover these gaps.

## Multiple Quantum Particles

This topic is one of many gripes I have with how most courses teach quantum mechanics. Most of them present the very foundations of the system as deeply complex. This is not true. The way quantum mechanics describes multiple independent particles is the simplest part of quantum mechanics.

To see why, let's consider two quantum particles. It always helps to make things easy when exploring a new topic, so let's assume they each have magnetic fields that can be either up $`+`$ or down $`-`$. We can then write the two particles $`\ket{S_1}, \ket{S_2}`$ as

```math
\ket{S_1} = p_{1+} \ket{+_1} + p_{1-} \ket{-_1}
```

```math
\ket{S_2} = p_{2+} \ket{+_2} + p_{2-} \ket{-_2}
```

There is one very important thing to note here. The two states $`S_1, S_2`$ are unrelated particles. This means that their possible states $`+_1, -_1, +_2, -_2`$ are different states. In general, the fact that particle $`S_2`$'s magnetic field points down has no effect on particle $`S_1`$'s magnetic field. *This means that the basis vectors representing these states, $`\ket{+_1}, \ket{-_1}, \ket{+_2}, \ket{-_2}`$ must be different vectors.*

## Writing Independent States

Let us now say we want to write the system that includes both particles $`S_1`$ and $`S_2`$ as one big system. Let's assume that the two states are totally independent; that is, we can describe each particle independently of the other. Then we can write the two states seperately in terms of their two possible values:

```math
\ket{S_1} = p_{1+} \ket{+_1} + p_{1-} \ket{-_1}
```

```math
\ket{S_2} = p_{2+} \ket{+_2} + p_{2-} \ket{-_2}
```

Now consider the composite system. Since each particle has two possible values of magnetic field, the total system will have four possible values -- one for each combination. We will write these states (suggestively) as products of the respective basis vectors: $`\ket{+_1} \ket{+_2}, \ket{+_1} \ket{-_2}, \ket{-_1} \ket{+_2}, \ket{-_1} \ket{-_2}`$. 

We are now tasked with a simple question: if the two particles are totally unrelated, what should the coefficients of these four basis vectors be?

It's very simple. Since they're unrelated, the probability of a composite state should just be the product of the probabilities for the individual states. For example, the probability density of the state $`\ket{+_1} \ket{-_2}`$ should just be $`p_{1+} p_{2-}`$. This is essentially a restatement of the fact that the two particles are independent, and can be written fully as

```math
\ket{S_1 S_2} = p_{1+} p_{2+} \ket{+_1} \ket{+_2} + p_{1+} p_{2-} \ket{+_1} \ket{-_2} + p_{1-} p_{2+} \ket{-_1} \ket{+_2} + p_{1-} p_{2-} \ket{-_1} \ket{-_2}
```

Such a state is called a **product state** for the simple reason that its probabilities are the products of the individual states' probabilities. The key here is that *a product state is made up of independent parts*.

## Writing Dependent States

On the surface, it may seem that we have just stated the blatantly obvious. However, there is something very deep hiding here. If we look just a bit closer, we will find it: the space of possible states for the composite system $`\ket{S_1 S_2}`$ is larger than the space of product states. That is, **there are a lot of valid states of $`\ket{S_1 S_2}`$ that are not product states.**

Here's one very famous example:

```math
\ket{S_1 S_2} = 0 \ket{+_1} \ket{+_2} + \sqrt{0.5} \ket{+_1} \ket{-_2} + \sqrt{0.5} \ket{-_1} \ket{+_2} + 0 \ket{-_1} \ket{-_2}
```

This is a perfectly valid state in the product basis. However, we quickly see that it cannot be written as a product state. It's a good simple exercise to figure out why.

Since I'm not an asshole, I'll also give the answer. It follows from three simple steps:
- Assume this is a  product state. Then the coefficient of $`\ket{+_1} \ket{+_2}`$ should be $`p_{1+} p_{2+}`$. Since this coefficient is zero, we then conclude that either $`p_{1+}`$ or $`p_{2+}`$ must be zero.
- The coefficient of $`\ket{+_1} \ket{-_2}`$ in a product state must be $`p_{1+} p_{2-}`$. Since this coefficient is not zero, we conclude that $`p_{1+} \neq 0`$. Thus we must have $`p_{2+} = 0`$.
- Similarly, the coefficient of $`\ket{-_1} \ket{+_2}`$ must be $`p_{1-} p_{2+}`$. Thus $`p_{2+} \neq 0`$, giving us a contradiction.

So there are mathematically possible states for the composite system $`\ket{S_1 S_2}`$ that are *not* product states. Remember that if a system is a product state, that means its components are independent. Thus it follows that *the particles in this state are not independent, and arguably cannot be considered fully distinct particles.*

In fact, this is quite easy to see. Look at the probability densities again:

```math
\ket{S_1 S_2} = 0 \ket{+_1} \ket{+_2} + \sqrt{0.5} \ket{+_1} \ket{-_2} + \sqrt{0.5} \ket{-_1} \ket{+_2} + 0 \ket{-_1} \ket{-_2}
```

Say we measure particle $`S_2`$ and find that its magnetic field is negative. Then we have measured the state $`\ket{-_2}`$, which means the composite system must now be in the state $`\ket{+_1} \ket{-_2}`$. But this means that particle $`S_1`$ must be in state $`\ket{+_1}`$. Thus by measuring particle $`S_2`$, we have also determined the state of particle $`S_1`$! This is all possible because the state is not a product state, and thus its component particles are not independent.

This phenomenon - the existence of composite state that are not product states - is called *quantum entanglement*.

## How Does Entanglement Happen?

But hold on, I hear you ask. There is an important difference between mathematics and physics. Mathematics is a tool for *describing* physical systems; it need not always *correspond* to physical systems. All that we've done so far is show that entangled states are *mathematically* possible -- not that they can physically arise.

Very fair. But what if I told you we've been dealing with entangled states since the very start, and just haven't realized it?

Let's back up a bit. All the way back in Lesson 4, we wrote the following axiom for quantum mechanics:

1. The $`A`$th element $`s_a`$ of a quantum state (written in the basis for some value $`V`$) is a complex number. The squared magnitude of that complex number is the probability of measuring the associated value $`v_a`$.

Mathematically, this implies the following transition. Say we have a particle $`S_1`$ and we've written it in the magnetic field basis with basis vectors $`\ket{+}`$ and $`\ket{-}`$. Then the particle in general is in some state

```math
\ket{S} = p_+ \ket{+} + p_- \ket{-}
```

Then say we point a Magnetic Field Detector Micro^{tm} at this particle and measure its spin to be up. Per our theory, this means that the particle has jumped to the state

```math
\ket{S} = \ket{+}
```

We skimmed over this before, but it's worth noting that this is a bit weird. Nature, in general, seems to behave *continuously*. If we measure a system at some time $`t`$ and then again a short time later $`t + dt`$, we don't expect it to be that different. However, in this theory the system becomes *very* different at the instant of measurement. The coefficient of $`\ket{+}`$ immediately jumps to $`1`$, and all other coefficients jump to $`0`$.

Some claim this discontinuity is a fundamental property of quantum mechanics. Others claim that it is an illusion that can be explained by quantum entanglement.

## The Many-Worlds Theory

The key to the second viewpoint is to realize that the Magnetic Field Detector Micro^{tm} is *also*, on some level, a quantum system. Thus we can model the Micro^{tm} very abstractly, in our quantum way, as a system $`\ket{M}`$ with three states: measuring a positive magnetic field ($`\ket{M_+}`$), measuring a negative magnetic field ($`\ket{M_-}`$), and measuring nothing $`\ket{M_0}`$.

We can then write the particle-Micro^{tm} as a composite system. Before measurement, the detector has measured nothing, so the system can be written as

```math
\ket{S M} = p_+ \ket{+} \ket{M_0} + p_- \ket{-} \ket{M_0}
```

It's a good test of what we've learned so far to check that this makes sense.

Say that we then measure the particle using the Micro^{tm}. In our previous analysis, we assumed this would "force" the particle into either the state $`\ket{+}`$ or the state $`\ket{-}`$. However, in this view, the measurement instead *splits* this product state. The detector enters the state $`\ket{M_+}`$ with probability density $`p_+`$ and the state $`M_-`$ with probability density $`p_-`$. Thus the measured state becomes

```math
\ket{S M} = p_+ \ket{+} \ket{M_+} + p_- \ket{-} \ket{M_-}
```

As a final test of everything we've learned today, you should show that this is indeed *not a product state*. That is, **wavefunction collapse is just entanglement viewed from the inside.**

No, I won't give you the proof. Maybe I am an asshole.

## A Parting Musing

Astute observers might notice that, for all my blustering about continuity, the above transition is not continuous either. The coefficients of the particle's states $`\ket{+}, \ket{-}`$ have not changed, but the coefficients of the Micro^{tm}'s states (and thus the product states as a whole) have changed quite abruptly.

I must admit I don't know how to resolve this. Maybe the probability does not immediately jump from one state to another, but instead continuously evolves to the final state very quickly?

This seems like a testable theory. Find a way to produce particles in a very predictable state (say 50% for each state, when measured with one detector). Then check if measuring the particle with two detectors in quick succession affects these probabilities. If the collapse is instant, the probabilities should always be the same, but if it's a fast transition and we catch it in the middle, the second detector should sometimes "snap" the particle back into the opposite state it was "collapsing" into.

I have no clue if this is feasible, or even interesting. But I do like continuity, so I will continue to think about it.

If this is a real thing, it may also be related to the quantum Zeno effect. The quantum Zeno effect says that repeated measurements can stop a particle from evolving by repeatedly forcing it back into its highest-probability state. This has always been a bit confusing to me. In my mind, particles are always continuously interacting with their environment. Would this not constitute continuous observation for the purposes of the Zeno effect? Well, since the Zeno effect has been rigorously measured, maybe not. Are there different levels of "interaction"? Can you cohere strongly or weakly? I have no idea. I just know that it is damn interesting.
