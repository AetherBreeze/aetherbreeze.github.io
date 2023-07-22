---
id: 24
title: "From Particles To Fields (6)"
subtitle: ""
date: "2023.07.21"
tags: "qft"
---

# The Matrix Trick

Last time, we derived a simple path integral for a relativistic quantum field. Today, we will meet a soon-to-be-common mathematical trick that allows us to evluate it.

## Physicsists Are Lazy

Recall the "simple" path integral we derived last time:

```math
\int e^{\frac{i}{\hbar} \int \frac{1}{2} (\partial_a F)^2 - \frac{m^2}{2} F^2 + J(x) F d^4 x} dF(x, t)
```

On the surface, this looks kind of similar to the Gaussian integral we did earlier, but with the field $`F`$ instead of $`x`$. We have both a negative term proportional to $`F^2`$ and a term proportional to $`F`$ in the numerator. Thus our first thought might be to evaluate this similarly to a Gaussian integral.

However, the term proportional to $`\partial_a F`$ ruins everything. We have *no* idea how to deal with this. Thus we are faced with two choices: either find a different way to solve this integral, or bend this integral so that it can be done like its Gaussian cousins.

Because I really don't want to learn more integration techniques, I'm going to opt for the second. 

## Getting Rid of Derivatives (Temporarily)

We want to turn the problematic term $`(\partial F)^2`$ in the exponent into one that cooperates with the Gaussian integral method. This means finding some way to get rid of the derivative.

Let's chop off the rest of the integral for now and just focus on the tricky bit:

```math
\int \frac{1}{2} \partial_a^2 F^2 d^4 x
```

Whenever we think of moving derivatives around inside of integrals, we should immediately think about integration by parts. Here we finally see the payoff from integrating over all spacetime. If we assume that the derivatives of the fields go to zero at infinity (which they better, or a lot of stuff is diverging), we can use integration by parts to turn this integral into

```math
- \int \frac{1}{2} F \partial_a^2 F d^4 x
```

If we wanted, we could try to integrate again. However, this will not be necessary. This step has already left our integral in a cooperative form for our next trick...

## Discrete is Easier

We'll now introduce an even more powerful trick for getting rid of derivatives. It's really quite simple. The idea is based on the fact that derivatives can only exist in continuous systems. **Thus if we temporarily make the system discrete again, we can turn these derivatives into something else.**

You might wonder why we'd bother doing this if we have to eventually bring the derivatives back. Well, we can sometimes manipulate the system while it's discrete so that when the derivatives come back, they're in a nicer form. We will soon see what I mean.

But first, we have to ask: what does discretizing a field like $`F(x, t)`$ mean?

The answer is simple. First, we choose some *grid line distance* $`k`$. We then turn $`F(x, t)`$ into a discrete vector defined by

i apologize for choosing the meaningless letter $`k`$ for the grid line distance, but we're rapidly running out of letters

```math
F_a = F(k a, t)
```

We can also discretize the time component using this same method. Doing so will give us a 'vector' $`F`$ with two lower indices. One-dimensional vectors are much easier to analyze, though, so we'll use one of many bijections between $`\Z^2`$ and $`\Z`$ to turn this back into one.

## Discrete Derivatives

Now that we've discretized the continuous field $`F(x, t)`$ into a vector, we can go about our original goal: turning derivatives into something friendlier. We will now find out what this friendlier object is.

It's really quite simple. Say we want to compute the partial derivative of $`F`$ in the $`m`$ direction. This is defined as

```math
\frac{\partial F}{\partial x^m} = \lim_{\delta \to 0} \frac{F(x + \delta, t) - F(x, t)}{\delta}
```

We discretize this by doing the opposite of what we usually do when taking the continuous limit: we take the limit away. Say for simplicity that we've discretized space with grid line distance $`k`$. Furthermore, say we've only discretized space in the $`m`$ direction, since this will not change the math but will make the indices easier to work with. Then we can write this no-longer-infinitesimal difference as

```math
\partial_m F = \frac{F(k(a + 1)) - F(k a)}{k} = \frac{F_{a + 1} - F_{a}}{k}
```

Note that this is just a linear combination of elements of the vector $`F`$!

Thus we reach a conclusion that, in hindsight, makes a lot of sense. In the discrete case, a derivative is just a linear operator on the function vectors! We will denote this linear operator, the discrete equivalent of the partial in the $`m`$th direction, as $`D_m`$.

Using this discretized derivative, we can finally rewrite the troublesome path integral term as

```math
\int -\frac{1}{2} F \partial_a^2 F d^4 x \to \sum -\frac{1}{2} F D_a^2 F
```

Since we're dealing with vectors again, we will also revert back to our old quantum notation for vectors. We will also write the sum over all four squared partials as simply $`D`$, since the old notation does't use indices:

```math
\int -\frac{1}{2} F \partial_a^2 F d^4 x \to \sum -\frac{1}{2} \bra{F} D^2 \ket{F}
```



## Substituting Back In

Now that we've figured out how to (temporarily) rid ourselves of the pesky derivative, it's time to substitute everything back into the original expression. There's just one tiny snag: since we've discretized the derivative term, we also have to discretize everything else.

Thankfully, everything else is pretty easy. Let's look again at our original expression:


```math
\int e^{\frac{i}{\hbar} \int \frac{1}{2} (\partial_a F)^2 - \frac{m^2}{2} F^2 + J(x) F d^4 x} dy(t)
```

Before we discretize, let's swap the first term for its integrated-by-parts cousin:

```math
\int e^{\frac{i}{\hbar} \int -\frac{1}{2} F \partial_a^2 F - \frac{m^2}{2} F^2 + J(x) F d^4 x} dy(t)
```

The easiest term is the vacuum perturbation term $`J(x) F`$. The integral of the product of two functions is literally the definition of the continuous dot product, so we can write this discretized term as

```math
J(x) F(x, t) \to \bra{J} \ket{F}
```

The mass term is a bit trickier. We want to turn the function $`F`$ into a vector $`\ket{F}`$, but we don't know how to take the square of a vector. The solution is to realize that since $`\frac{m^2}{2}`$ is a scalar, we can simply take one $`F`$ and move it to the other side of that scalar:

```math
\frac{m^2}{2} F^2 = F \frac{m^2}{2} F
```

This can now easily be discretized using our vector notation:

```math
\frac{m^2}{2} \to \bra{F} \frac{m^2}{2} \ket{F}
```

Finally, we recall our discretization of the derivative:

```math
F \partial_a^2 F \to \bra{F} D^2 \ket{F}
```

Substituting this back into the integal and discretizing that integral to a sum, we find that

```math
\int e^{\frac{i}{\hbar} \int -\frac{1}{2} F \partial_a^2 F - \frac{m^2}{2} F^2 + J(x) F d^4 x} dy(t) \to \int e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{F} D^2 \ket{F} - \bra{F} \frac{m^2}{2} \ket{F} + \bra{J} \ket{F}} dF(x, t) 
```

The first two terms can be combined for brevity:

```math
\int e^{\frac{i}{\hbar} \int -\frac{1}{2} F \partial_a^2 F - \frac{m^2}{2} F^2 + J(x) F d^4 x} dy(t) \to \int e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{F} (D^2 + m^2) \ket{F} + \bra{J} \ket{F}} dF(x, t) 
```

One final step. Since we've discretized the field $`F`$, it no longer makes sense to integrate over all possible configurations of that field. Thus we can split our path integral $`\int dF(x, t)`$ back into a product of integrals over individual field components (denoting the components $`F_1, F_2,.. F_N`$ of the field vector):

```math
\int e^{\frac{i}{\hbar} \int -\frac{1}{2} F \partial_a^2 F - \frac{m^2}{2} F^2 + J(x) F d^4 x} dy(t) \to \left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dF_a\right) e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{F} (D^2 + m^2) \ket{F} + \bra{J} \ket{F}}
```

This also allows us to get rid of that meddlesome component proportional to $`\lim_{N \to \infty} m^{N/2}`$ that has been vexing us since minute one. Nice!

## Next Steps

Today we used two tricks to (temporarily) eliminate derivatives from an integral. The first trick was integration by parts, which works on all functions whose derivatives disappear at infinity. The next trick was to jump back to discrete vectors for a bit in the hopes that we can rearrange the equation to a more pliable form. Next time, we will do just that by generalizing our method for evaluating the Gaussian integral. This will give us a hint at the first truly new quantum field-theoretical function.
