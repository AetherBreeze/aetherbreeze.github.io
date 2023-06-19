---
id: 0
title: "Quantum Mechanics Speedrun (1)"
subtitle: ""
date: "2023.06.19"
tags: "qft"
---

# Why Quantum Field Theory?

Quantum field theory is the most successful model of the universe ever proposed. Not only is it [actually a model of physics](https://xkcd.com/171/), but it describes three of the universe's four fundamental forces with [up to 99.9999999999% precision](https://en.wikipedia.org/wiki/Precision_tests_of_QED#Anomalous_magnetic_dipole_moments). These successes have made it hugely influential; to paraphrase a quote about Cicero, almost all of modern physics is either a reaction to or an extension of quantum field theory. This accuracy and universal relevance make quantum field theory an excellent entry point to physics research. If one wants to break into modern physics, one would be well advised to pick the lock with the toolkit of quantum field theory.

This series will provide you with that toolkit. Specifically, it will provide you with the toolkit I am piecing together for myself as I too attempt to learn this theory. It will contain math, of course. Physics is the practice of bending math until it looks like the universe. However, I will attempt to present the math using a discovery mindset (why would we use this math to solve this problem?) rather than a calculation mindset (how might I most efficiently imitate a computer?). We will present as much math as is necessary to learn and work with this absurdly powerful theory, and we will do so in a way that will help you develop theories of your own.

Ready? Let's get started.

## Starting Simple

In order to understand quantum field theory, one must first understand quantum mechanics. Unfortunately, most people who know quantum mechanics learned it in college classes, and college classes are about as condusive to long-term learning as dieting for a week after New Year's is to not dying of heart disease at 50. I know this because *I* learned quantum mechanics in a college class, and I was having to stop every after every half-page of *Quantum Field Theory in a Nutshell* to remind myself what a Born approximation is. Clearly it is not enough to rely on pre-existing knowledge. In order to start everyone off with a single, well-founded body of knowledge, we will thus spend a couple of days reminding ourself what all this quantum nonsense is about.

We will get at quantum mechanics the same way as its inventors: by studying a place where classical mechanics fails. Specifically, we will consider how classical mechanics can describe a large magnet (a bar magnet), but cannot describe a small magnet (an electron).

### A Large Magnet

Consider a large bar magnet. It has a magnetic field pointing towards its north pole (which we will call the $`y`$ direction):

MAGNET PICTURE MAGNET PICTURE

Suppose we point a Magnetic Field Detector$`^{tm}`$ at this bar magnet. The Magnetic Field Detector$`^{tm}`$ can measure the strength of a magnetic field in a particular direction. Using this detector, we might make the following measurements:

- The magnetic field of the bar magnet in the $`y`$ direction has a strength of 1 (in Convenient Units).
- The magnetic field in the $`x`$ direction has a strength of 0.
- The magnetic field at a $`45^o`$ angle between $`x`$ and $`y`$ has a strength, per Pythagoras, of $`\sqrt{0.5}`$.
- The magnetic field in the $`-y`$ direction has a strength of $`-1`$ (the full strength, but pointed the opposite way).

We might also make the following series of measurements:

- If we measure the magnetic field in the $`y`$ direction, it will be $`1`$.
- If we then measure it in the $`x`$ direction, it will be $`0`$.
- If we then measure it again in the $`y`$ direction, it will still be $`1`$.

All this is is very logical behavior. For that reason, it is well predicted by classical physics. (Mathematically, we might say that the Magnetic Field Detector$`^{tm}`$ takes the dot product between bar magnet's magnetic field and the direction the detector is pointed.)

### A Small Magnet

Now let's look at how small systems flagrantly disregard all of these logical assertions. Consider an electron, which also has a magnetic field:

ELECTRON PICTURE ELECTRON PICTURE

Say we point our Magnetic Field Detector Micro$`^{tm}`$ at this electron and make the same measurements we made of the bar magnet. The results might look like this:

- The magnetic field of the bar magnet in the $`y`$ direction has a strength of 1 (in Smaller Convenient Units).
- The magnetic field in the $`x`$ direction has a strength of... $`-1`$?.
- The magnetic field at a $`45^o`$ angle between $`x`$ and $`y`$ has a strength of... also $`-1`$. What?
- The magnetic field in the $`-y`$ direction has a strength of $`1`$ as well. What the hell is going on?

Okay. That's strange. And when we make the second series of measurements, it gets even stranger:

- We measure the magnetic field in the $`y`$ direction and get $`1`$.
- We then measure it in the $`x`$ direction and get $`1`$. That's not even the same as what happened last time...
- We then measure it again in the $`y`$ direction and get $`-1`$.
- As a sanity check, we measure it in the again $`x`$ direction and get $`1`$ again.
- Finally, we measure it again in the $`y`$ direction and get $`1`$. That settles it: the $`x`$ measurement 'disturbs' the $`y`$ measurement, but does not fully determine it.

Clearly there are shenanigans afoot.

### Uprooting Reality

This is the situation that the founders of quantum mechanics found themselves in. The laws of physics they had learned (and, in some cases, invented) for large magnets failed horribly to predict the behavior of small magnets. They realized, though surprisingly slowly, that the two magnets' behaviors were irreconcilable. This was not something that the old models could explain. **A new theory of physics was needed.**

At this point, most physics classes would present the fully formed laws of quantum mechanics, like Athena from the forehead of Zeus after he gave his wife the DeviantArt treatment. This is not how theories of science are born. If we actually want to understand how physics is done, we need to understand the process of coming up with new physics. We are not here to learn how to *do* physics; we are here to learn how to *discover* physics. We will build up the laws of quantum mechanics from intuition and experiment, just like the good ol' days.

Let's start from the top. We have a big system that acts as expected and a small system that does not. The first step in developing a new model is to figure out the specific ways in which the new system and the old system behave differently. In other words, we need to figure out which rules the small system breaks.

After some thought, we might come up with the following two rules:

1. Physical quantities can take any value in a continuous range ($`0, 1, 0.5, \sqrt{2}`$...)
2. Measuring one property of a system **does not** affect future measurements of different properties.

Both of these are "classical" ways for the universe to behave, and both of them are ways that our electron fails to behave. Instead, the electron seems to obey the following rules:

1. Some physical quantities can only take on a discrete set of values (e.g. either $`1`$ or $`-1`$).
2. Measuring one property of a system **can** affect future measurements of different properties.
3. In the above situation, the future measurements' values seem to be random.

### Math Time

Now we start the real work of discovering new physics. We have discovered a system which seems to break the rules; we have come up with a new set of rules that we think describes it better. Now we need to translate these new rules into math. This will eventually allow us to make that most vital of physics products: predictions.

We have three rules to translate into math. Let's start by considering two of them:

1. Some physical quantities can only take on a discrete set of values (e.g. either $`1`$ or $`-1`$).
2. In some situations, the measurements of these values seem to be random.

How would we describe a system that can take on a discrete set of values, and that has a certain probability to take on any given value?

Let's start, as we always will, with the simplest possible option. Say a system can take on $`N`$ possible values. We will model this system by simply writing a list of $`N`$ numbers $`p_1, p_2,.. p_N`$, where $`p_a`$ is the probability of measuring the $`a`$th value:

```math
\text{model = } \begin{bmatrix} p_1 \\ p_2 \\ ... \\ p_N \end{bmatrix}
```

(i am well aware that this matrix looks like ass, katex is inexplicably broken and i'm looking into it)

This model is not far from the truth. Next time, we will build up this theory even further until we have a functioning model of quantum mechanics.
