---
id: 3
title: "Quantum Mechanics Speedrun (4)"
subtitle: ""
date: "2023.06.22"
tags: "qft"
---

# Wait, It's All Linear Algebra?

Last time, we narrowed in on our first fully functional theory of quantum mechanics. We started with our "list of probabilities" theory. Then, to account for multiple states having the same probabilities when written in terms of other states, we switched to a "list of square roots of probabilities" theory. Finally, to allow for infinitely many states with the same list of probabilities, we landed on "list of complex numbers whose squared magnitudes are the probabilities".

This will remain the basis of our model. However, with a little work, we can extend it to take advantage of a massive treasure trove of mathematics.

## The Most Important Expression

Let us recount our theory as it stands. Given a system $`S`$ which can take on $`N`$ possible states ($`s_1, s_2,.. s_N`$), we write it as a list of complex numbers ($`p_1, p_2,.. p_N`$) whose squared magnitudes give the probability of measuring $`S`$ in the corresponding state:

```math
S = p_1 \ket{s_1} + p_2 \ket{s_2} +.. p_N \ket{s_N} \\
\text{probability of measuring } s_A = |p_A|^2
```

We also know how to describe *conjugate variables*: values which, when measured, affect the probabilities of other values. As an example, we considered the components of the electron's magnetic field in the $`x, y,`$ and $`z`$ directions. Since these values are conjugate, we can write the "electron's magnetic field" system in terms of any of them:

```math
\text{magnetic field } = a_1 \ket{x_+} + a_2 \ket{x_-} \\
\text{magnetic field } = b_1 \ket{y_+} + b_2 \ket{y_-} \\
\text{magnetic field } = c_1 \ket{z_+} + c_2 \ket{z_-}
```

Measuring any of these directions leaves us with a 50% chance of measuring each value in the other directions. In the language of math, we express this by writing states like $`\ket{x_\pm}`$ in terms of the other states:

```math
\ket{x_+} = \sqrt{0.5} \ket{y_+} + \sqrt{0.5} \ket{y_-} \\
\ket{x_-} = \sqrt{0.5} \ket{y_-} - \sqrt{0.5} \ket{y_-}
```

What we have written above is a rare breed of expression. It is the type of expression that a physicist is lucky to discover even once in their life. It is an expression that is based in physics, and yet matches nearly perfectly with a powerful system of mathematics. These sorts of expressions -- those that seemingly spuriously connect physics to mathematics -- are how giant leaps in physics are born. In the case of general relativity, such an expression revealed to Einstein the link between gravity and curvature. In our case, it reveals a link between quanutm mechanics and linear algebra.

## States as Vectors

From now on, I will assume a basic understanding of linear algebra. Weapons such as vectors, dot products, and changes of bases will be wielded without padding or face masks. If you with such tools, I would heartily recommend you watch [3blue1brown's series on linear algebra](https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab) -- it is the foundation of how I understand almost all the math I know.

Got it? We all understand what a change of basis is now? Good. Now, let's take another look at that expression:

```math
\ket{x_+} = \sqrt{0.5} \ket{y_+} + \sqrt{0.5} \ket{y_-} \\
\ket{x_-} = \sqrt{0.5} \ket{y_-} - \sqrt{0.5} \ket{y_-}
```

Physically, this equation tells us about relative probabilities. Mathematically, however, *it looks identical to a change of basis for two-dimensional vectors*.

Let's put this into math by returning to our list-of-numbers formalism. Say we're in the "$`y`$ magnetic field basis", where $`(1, 0)`$ represents a state that's definitely $`+1`$ in the $`y`$ direction and $`(0, 1)`$ represents a state that's definitely $`-1`$. Then the above expression tells us that the change-of-basis matrix between the $`\ket{y_\pm}`$ basis and the $`\ket{x_\pm}`$ basis is

```math
\begin{bmatrix} p_{x_+} \\ p_{x_-} \end{bmatrix} = \begin{bmatrix} \sqrt{0.5} && \sqrt{0.5} \\ \sqrt{0.5} && -\sqrt{0.5} \end{bmatrix} \begin{bmatrix} p_{y_+} \\ p_{y_-} \end{bmatrix}
```

Similarly, we can use our expression from last time to find the change-of-basis matrix between $`\ket{x_\pm}`$ and $`\ket{z_\pm}`$:

```math
\begin{bmatrix} p_{x_+} \\ p_{x_-} \end{bmatrix} = \begin{bmatrix} i \sqrt{0.5} && i \sqrt{0.5} \\ \sqrt{0.5} && -\sqrt{0.5} \end{bmatrix} \begin{bmatrix} p_{z_+} \\ p_{z_-} \end{bmatrix}
```

## Putting It In Math

This identification between quantum mechanics and linear algebra is one of the greatest triumphs in physics. Next time, we will re-state our entire theory in terms of linear algebra. This will give us a whole suite of powerful tools to work with, and allow us to generalize quantum mechanics to the continuous case.
