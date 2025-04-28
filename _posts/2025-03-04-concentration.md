---
layout: post
title:  "ci"
date:   2025-03-04 10:00:00 
categories: ci
---

# Understanding Concentration Inequalities: Markov, Ville, and Hoeffding

Concentration inequalities are a cornerstone of probability theory, especially useful in machine learning, statistics, and theoretical computer science. They provide bounds on how a random variable deviates from some central tendency, usually its expectation.

In this post, we’ll build from basic principles to a powerful result — **Hoeffding’s inequality** — by walking through **Markov's** and **Ville's** inequalities first.

---

## Markov’s Inequality

The simplest and most general of concentration results.

**Statement:**

Let $ X $ be a non-negative random variable with finite expectation $ \mathbb{E}[X] $. Then for any $ a > 0 $:

$
\mathbb{P}(X \geq a) \leq \frac{\mathbb{E}[X]}{a}
$

**Proof Sketch:**

Since \( X \geq 0 \),

\[
\mathbb{E}[X] = \int_0^\infty \mathbb{P}(X \geq t) \, dt \geq \int_a^\infty \mathbb{P}(X \geq a) \, dt = \mathbb{P}(X \geq a) \cdot \int_a^\infty dt = \mathbb{P}(X \geq a) \cdot (\infty - a)
\]

More precisely, write:

\[
\mathbb{E}[X] \geq a \cdot \mathbb{P}(X \geq a)
\Rightarrow \mathbb{P}(X \geq a) \leq \frac{\mathbb{E}[X]}{a}
\]

It’s that simple.

---

## Ville’s Inequality

A powerful extension of Markov’s inequality for **martingales**.

**Statement (Ville’s Inequality):**

Let \( (M_t) \) be a non-negative supermartingale. Then for any \( \lambda > 0 \) and \( T \in \mathbb{N} \):

\[
\mathbb{P} \left( \sup_{t \leq T} M_t \geq \lambda \right) \leq \frac{\mathbb{E}[M_0]}{\lambda}
\]

**Intuition:**

Ville’s inequality is like a “maximum version” of Markov’s — it tells us that a martingale is unlikely to get too big at any time step.

**Proof Sketch:**

Apply Markov’s inequality to the maximum:

\[
\mathbb{P} \left( \max_{t \leq T} M_t \geq \lambda \right)
\leq \frac{\mathbb{E}[M_T]}{\lambda} \leq \frac{\mathbb{E}[M_0]}{\lambda}
\]

using the supermartingale property: \( \mathbb{E}[M_T] \leq \mathbb{E}[M_0] \).

---

## Hoeffding’s Inequality

Hoeffding’s inequality gives exponentially decaying bounds on the probability that the sum of bounded independent random variables deviates from its expected value.

### Setup

Let \( X_1, \dots, X_n \) be **independent** random variables with \( X_i \in [a_i, b_i] \), and define:

\[
S_n = \sum_{i=1}^n X_i
\quad \text{and} \quad
\mu = \mathbb{E}[S_n]
\]

Then for any \( t > 0 \):

\[
\mathbb{P}(S_n - \mu \geq t) \leq \exp\left( -\frac{2t^2}{\sum_{i=1}^n (b_i - a_i)^2} \right)
\]

**Proof Sketch:**

We use the **exponential Markov inequality**:

\[
\mathbb{P}(S_n - \mu \geq t) = \mathbb{P}(e^{\lambda (S_n - \mu)} \geq e^{\lambda t})
\leq \frac{\mathbb{E}[e^{\lambda (S_n - \mu)}]}{e^{\lambda t}}
\]

Now, since the \( X_i \)'s are independent:

\[
\mathbb{E}[e^{\lambda (S_n - \mu)}] = \prod_{i=1}^n \mathbb{E}[e^{\lambda (X_i - \mathbb{E}[X_i])}]
\]

Hoeffding’s lemma tells us:

\[
\mathbb{E}[e^{\lambda (X_i - \mathbb{E}[X_i])}] \leq \exp\left( \frac{\lambda^2 (b_i - a_i)^2}{8} \right)
\]

Combining:

\[
\mathbb{E}[e^{\lambda (S_n - \mu)}] \leq \exp\left( \frac{\lambda^2}{8} \sum_{i=1}^n (b_i - a_i)^2 \right)
\]

Thus:

\[
\mathbb{P}(S_n - \mu \geq t) \leq \exp\left( \frac{\lambda^2}{8} \sum (b_i - a_i)^2 - \lambda t \right)
\]

Minimize the bound with respect to \( \lambda \):

\[
\lambda^* = \frac{4t}{\sum (b_i - a_i)^2}
\]

Plugging in gives the result.

---

## Summary

| Inequality | Type | Bound |
|------------|------|-------|
| **Markov** | Any non-negative variable | \( \mathbb{P}(X \geq a) \leq \frac{\mathbb{E}[X]}{a} \) |
| **Ville**  | Non-negative supermartingale | \( \mathbb{P}(\sup M_t \geq \lambda) \leq \frac{\mathbb{E}[M_0]}{\lambda} \) |
| **Hoeffding** | Sum of bounded i.i.d. variables | \( \mathbb{P}(S_n - \mu \geq t) \leq \exp\left( -\frac{2t^2}{\sum (b_i - a_i)^2} \right) \) |

Concentration inequalities like these form the backbone of learning theory, algorithm analysis, and probabilistic modeling. Hoeffding’s inequality is particularly useful for deriving generalization bounds in machine learning.

---

*Thanks for reading! Feel free to leave a comment or ask questions about extensions like Bernstein’s or Azuma’s inequality next.*

