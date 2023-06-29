---
id: 8
title: "Quantum Mechanics Speedrun (9)"
subtitle: ""
date: "2023.06.27"
tags: "qft"
---

# The Crux of Modern Physics

Last time, we found that the quantum equation of motion can be written in terms of matrix multiplication. Specifically, if we expand a system $`\ket{S}(t)`$ in terms of its energy states $`\ket{E_1}, \ket{E_2}, \ket{E_N}`$, then the system at time $`t`$ can be written in terms of the system at time $`0`$ as

```math
\ket{S}(t) = \begin{bmatrix} e^{i \frac{E_1}{\hbar} t} && 0 && ... \\ 0 && e^{i \frac{E_2}{\hbar} t} && ... \\ ... \\ ... && 0 && e^{i \frac{E_N}{\hbar} t} \end{bmatrix} \ket{S}(0)
```

Today, we will see how this statement can be viewed as a simple application of a powerful tool. It is a tool that lies at the heart of modern physics, up to and including the Standard Model: the exponential map.

## Simplicity Is King

We will start in one of the two places we always start: simplification. Consider this time evolution law again:

```math
\ket{S}(t) = \begin{bmatrix} e^{i \frac{E_1}{\hbar} t} && 0 && ... \\ 0 && e^{i \frac{E_2}{\hbar} t} && ... \\ ... \\ ... && 0 && e^{i \frac{E_N}{\hbar} t} \end{bmatrix} \ket{S}(0)
```

Specifically, consider the matrix. The only thing that really changes from element to element of this matrix is the energy value $`E_a`$. It almost seems like we should be able to pull the exponential and coefficients out of the matrix, and write it as something like

```math
\ket{S}(t) = e^{i \frac{\hat{E}}{\hbar} t} \ket{S}(0)
```

for some matrix $`\hat{E}`$ which holds the actual energy values:

```math
\hat{E} = \begin{bmatrix} E_1 && 0 && ... \\ 0 && E_2 && ... \\ ... && 0 && E_N \end{bmatrix}
```

This would simplify our equations significantly. Instead of using some weird matrix with exponentials, we could just use the "energy matrix" $`\hat{E}`$ whose eigenvectors are the energy states and whose eigenvalues are the corresponding energy levels. But of course, we can't just shove a matrix into an exponential. Can we?

## We Totally Can

Let's step back to think for a second. When we want to calculate an exponential like $`e^x`$ -- I mean *really* calculate -- what do we do?

Our first thought might be to just multiply $`e`$ by itself $`x`$ times. However, when $`x`$ isn't an integer (and it usually isn't) this attempt falls flat on its face. Instead, the more general method is to use the **Taylor series** for the exponential:

```math
e^x = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} +..
```

Now this is interesting. We may not know how to calculate $`e^M`$ for a matrix $`M`$, but we do know how to calculate $`M^n`$ to an integer power -- just multiply $`M`$ by itself $`n`$ times. This means that we can calculate every term of the Taylor series for $`e^M`$. The only tricky term is the constant term $`1`$, which we can quickly generalize to the identity matrix $`I`$. But if we can calculate every term of the Taylor series, then we can calculate the entire function. **Thus almost by accident, we have discovered a way to take the exponential of a matrix!**

```math
e^M = I + M + \frac{M^2}{2!} + \frac{M^3}{3!} +..
```

## Making Sure It Makes Sense

We have discovered a way to take the exponential of the matrix. However, we don't yet know if it does what we want. In our original use case, we came up with this idea so that we could write

```math
\begin{bmatrix} e^{i \frac{E_1}{\hbar} t} && 0 && ... \\ 0 && e^{i \frac{E_2}{\hbar} t} && ... \\ ... \\ ... && 0 && e^{i \frac{E_N}{\hbar} t} \end{bmatrix} = e^{i \hat{E} t}
```

for the diagonal matrix

```math
\hat{E} = \begin{bmatrix} E_1 && 0 && ... \\ 0 && E_2 && ... \\ ... && 0 && E_N \end{bmatrix}
```


Let's plug $`\hat{E}`$ into our new matrix exponential and see if our trick works. We have

```math
e^M = I + \hat{E} + \frac{\hat{E}^2}{2!} + \frac{\hat{E}^3}{3!} +..
```

Seems like we need to calculate all the integer powers of $`\hat{E}`$. Luckily, since it's a diagonal matrix, this is trivial. If we write

```math
\hat{E} = \begin{bmatrix} E_1 && 0 && ... \\ 0 && E_2 && ... \\ ... && 0 && E_N \end{bmatrix}
```

then it is a simple calculation to see that we should have

```math
\hat{E}^n = \begin{bmatrix} E_1^x && 0 && ... \\ 0 && E_2^x && ... \\ ... && 0 && E_N^x \end{bmatrix}
```

We can now substitute this back into the Taylor series to get a nasty-looking expression:

```math
e^{\hat{E}} = \begin{bmatrix} 1 && 0 && ... \\ 0 && 1 && ... \\ ... && 0 && 1 \end{bmatrix} + \begin{bmatrix} E_1 && 0 && ... \\ 0 && E_2 && ... \\ ... && 0 && E_N \end{bmatrix} + \frac{1}{2!} \begin{bmatrix} E_1^2 && 0 && ... \\ 0 && E_2^2 && ... \\ ... && 0 && E_N^2 \end{bmatrix} + \frac{1}{3!} \begin{bmatrix} E_1^3 && 0 && ... \\ 0 && E_2^3 && ... \\ ... && 0 && E_N^3 \end{bmatrix} +..
```

But wait. If we actually compute these matrix sums...

```math
e^{\hat{E}} = \begin{bmatrix} 1 + E_1 + \frac{E_1^2}{2!} + \frac{E_1^3}{3!} +.. && 0 && ... \\ 0 && 1 + E_2 + \frac{E_2^2}{2!} + \frac{E_2^3}{3!} +.. && ... \\ ... && 0 && 1 + E_N + \frac{E_N^2}{2!} + \frac{E_N^3}{3!} +.. \end{bmatrix}
```

A beautiful realization: each of these elements is just the Taylor series for $`e^{E_a}`$!

```math
e^{\hat{E}} = \begin{bmatrix} e^{E_1} && 0 && ... \\ 0 && e^{E_2} && ... \\ ... && 0 && e^{E_N} \end{bmatrix}
```

Thus we have made the contact we desired, and we can write the equations of motion in our much nicer form:

```math
\ket{S}(t) = e^{i \frac{\hat{E}}{\hbar} t} \ket{S}(0)
```

## What If $`\hat{E}`$ Isn't Diagonal?

So far, we've made things easy for ourselves by expanding $`\ket{S}`$ in terms of energy states. In practice we usually won't have this luxury; we tend to expand $`\ket{S}`$ in terms of things like position, momentum, magnetic field, and other variables. In these scenarios, the energy matrix $`\hat{E}`$ isn't so simple. It's still a matrix whose eigenvectors are the energy states $`\ket{E_a}`$, but these states are no longer the basis vectors. This means that $`\hat{E}`$ usually isn't diagonal.

This is a problem. Our above proof relied heavily on the fact that $`\hat{E}`$ was diagonal. Now we need to approach the matrix exponential without this cheat code.

However, as physicists and mathematicians, we are still quite lazy. Is there any way we can approach this proof that takes advantage of our existing diagonal one?

For the linear algebra enthusiasts in the crowd, the answer might already be clear. We may not be able to assume that $`\hat{E}`$ is diagonal, since it's diagonal in some basis (the energy basis), we can assume it's diagonal*izable*. That is, we can expand $`\hat{E}`$ as

```math
\hat{E} = \hat{B} \hat{D} \hat{B}^{-1}
```

for some change of basis matrix $`\hat{B}`$ and a diagonal matrix $`\hat{D}`$ whose eigenvalues are the energy values $`E_1, E_2,.. E_N`$.

This trick makes our proof surprisingly easy. We'll start by doing the same thing as last time: calculating all the integer powers of $`\hat{E}`$:

```math
\hat{E}^n = (\hat{B} \hat{D} \hat{B}^{-1})^n
= (\hat{B} \hat{D} \hat{B}^{-1}) (\hat{B} \hat{D} \hat{B}^{-1}) ... (\hat{B} \hat{D} \hat{B}^{-1})
```

Like magic, all the $`\hat{B}`$ and $`\hat{B}^{-1}`$s in the middle cancel, leaving us with

```math
\hat{E}^n = \hat{B} \hat{D}^n \hat{B}^{-1}
```

We can now substitute this back into the Taylor series for $`e^x`$:

```math
e^{\hat{E}} = I + \hat{B} \hat{D} \hat{B}^{-1} + \frac{1}{2!} \hat{B} \hat{D}^2 \hat{B}^{-1} + \frac{1}{3!} \hat{B} \hat{D}^3 \hat{B}^{-1} +..
```

Notice that $`\hat{B}`$ appears on the left of nearly every term, and $`\hat{B}^{-1}`$ on the right. The only seemingly odd term out is the identity matrix.

But wait -- the identity matrix is just $`\hat{B} \hat{B}^{-1}`$ in disguise!

```math
e^{\hat{E}} = \hat{B} \hat{B}^{-1} + \hat{B} \hat{D} \hat{B}^{-1} + \frac{1}{2!} \hat{B} \hat{D}^2 \hat{B}^{-1} + \frac{1}{3!} \hat{B} \hat{D}^3 \hat{B}^{-1} +..
```

We can now take the change of basis matrices out to get

```math
e^{\hat{E}} = \hat{B} (I + \hat{D} + \frac{1}{2!} \hat{D}^2 + \frac{1}{3!} \hat{D}^3 +..) \hat{B}^{-1} \\
= \hat{B}^{-1} e^{\hat{D}} \hat{B}^{-1}
```

This might seem a little confusing. In terms of basis transformations, though, it's pretty easy. We read from right to left:

- First, we transform from our current basis to the energy basis
- Next, we apply the diagonal matrix with eigenvalues $`e^{E_a}`$, just like in the diagonal case.
- Finally, we transform back to the original basis

**In short, this is exactly what we wanted!** We showed that even if we're in a basis where $`\hat{E}`$ is not diagonal, our exponential trick will still work; the diagonal exponential matrix will still be applied to the energy states.

Thus we can truly conclude, once and for all: **this is the quantum equation of motion**:

```math
\ket{S}(t) = e^{i \frac{\hat{E}}{\hbar} t} \ket{S}(0)
```

## The Equation You See On T-Shirts

Howeever, we are not quite done. If you've seen the Schrodinger equation before -- on t-shirts, mugs, or tatooed on the necks of professors with bad foresight -- you probably remember it looking a little different. Specifically, isn't it supposed to have a time derivative in it?

The answer is: it can if we want it to. Our expression for $`\ket{S}(t)`$ is so beautifully simple that we can turn it into an expression for $`\frac{d}{dt} \ket{S}(t)`$ without breaking a sweat. Let's do it in three equations, starting from

```math
\ket{S}(t) = e^{i \frac{\hat{E}}{\hbar} t} \ket{S}(0)
```

The original state $`\ket{S}(0)`$ is a constant, so the time derivative of this is just

```math
\frac{d}{dt} \ket{S}(t) = i \frac{\hat{E}}{\hbar} e^{i \frac{\hat{E}}{\hbar} t} \ket{S}(0)
```

But the rightmost part is just a multiple of $`\ket{S}(t)`$ again! Thus we get our final expression:

```math
\frac{d}{dt} \ket{S}(t) = i \frac{\hat{E}}{\hbar} \ket{S}(t)
```

This equation often takes a slightly different form. In experimental use cases, the energy matrix $`\hat{E}`$ is usually very complicated. Thus it is easier to keep it alone on one side of the equation and move all the constants to the other. Doing this will leave us with

```math
-i \hbar \frac{d}{dt} \ket{S}(t) = \hat{E} \ket{S}(t)
```

which is the most common (matrix) form of the Schrodinger equation.

## Next Steps

Today, we made two major advancements. First, we derived two useful forms of the quantum equation of motion. Second, and arguably more importantly, we quietly discovered an incredibly powerful trick: using Taylor series to take the exponential of a matrix. It may not seem like much right now, but this concept of taking the exponential of a function will be *pivotal* in almost all of modern physics. To understand why will take a while, but for now, consider how exponentials like $`e^x`$ are defined by the continuous multiplication of small changes -- almost like how integrals are defined by the continuous addition of small changes.
