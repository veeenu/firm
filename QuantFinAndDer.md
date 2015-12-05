---
layout: post
title: Quantitative Finance and Derivatives
...

Models for asset pricing
========================

Underlying processes
--------------------

### Stochastic Processes

Stochastic processes are collections of random variables representing
the evolution of some system over time. Stochastic processes can have
discrete or continuous values, and can evolve over discrete or
continuous time.

We have four different possible situations:

1.  $X(n,\omega) : \mathbb{N} \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{Z}:$
    discrete time, discrete values. For example: a *random walk*.

2.  $X(n,\omega) : \mathbb{N} \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{R}:$
    discrete time, continuous values.

3.  $X(n,\omega) : \mathbb{R}^+ \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{Z}:$
    continuous time, discrete values. For example: a *Poisson process*.

4.  $X(n,\omega) : \mathbb{R}^+ \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{R}:$
    continuous time, continuous values. For example: a *Brownian
    motion*.

#### From random walk to Brownian motion

Let $$(X_n)_{n   \geq    0}$$ be a stochastic process such that $X_i$,
for any $i$, can take value $1$ with probability
$\mathbb{P}(X_i=1)=\frac{1}{2}$, and $-1$ with probability
$\mathbb{P}(X_i=-1)=\frac{1}{2}$. Let then
$S_n = X_1 + X_2 + \ldots +X_n$ be the position you are at on a line
after $n$ steps. Informally, each $X_i$ “moves” you randomly one step to
the right or one step to the left. We want to know expectation and
variance of this process. Let’s assume the $(X_n)_{n \geq  0}$ to be
*independent and identically distributed*. We can now assert the
following:

$$E\left[X_i\right] = (+1) \cdot \frac{1}{2} + (-1) \cdot \frac{1}{2} = 0$$

$$E\left[X_i^2\right] = (+1)^2 \cdot \frac{1}{2} + (-1)^2 \cdot \frac{1}{2} = 1$$

Hence,

$$E\left[S_n\right] = \sum_{i=1}^n E\left[X_i\right] = 0$$

$$Var\left[S_n\right] = \sum_{i=1}^n E\left[X_i^2\right] = n$$

As $n$ approaches infinity, the conditions for the *Central Limit
Theorem* hold: $X_i$s are *i.i.d.*, so we can apply

$$\frac{S_n - n \cdot E\left[X_i\right]}{\sqrt{n \cdot Var\left[X_i\right]}}
    = \frac{S_n}{\sqrt{n}} \underset{n \to \infty}{\sim} \mathcal{N}(0,1)$$

Consider now a non-unitary time. Suppose we move in time steps of
$\delta >
  0$ and in space steps of $\sqrt{\delta}$, and let’s consider the
process in the interval $[0,t],\ t\in\mathbb{R}^+$. Then,

$$S_t = \sum_{i=0}^{\left\lfloor \frac{t}{\delta} \right\rfloor} X_i$$

where $X_i$ moves by $\pm\sqrt\delta$ with probability
$\mathbb{P}=\frac{1}{2}$. Then, $E\left[S_t\right]=0$ and

$$Var[X_i] = E^2[X_i] - E[X_i^2] = E^2[X_i] = (+\sqrt{\delta})^2 \cdot \frac{1}{2} + (-\sqrt{\delta})^2 \cdot \frac{1}{2} 
      = \delta$$

$$Var[S_t] = \frac{t}{\delta} \cdot \delta = t$$

Let’s now apply *Central Limit Theorem*:

$$\frac{S_t - \frac{t}{\delta} E[X_i]}{\sqrt{\frac{t}{\delta} Var[X_i]}}
    = \frac{S_t}{\sqrt{t}} \underset{t \to \infty}{\sim} \mathcal{N}(0,1).$$

So, $S_t \sim \mathcal{N}(0,t)$: this is the *Brownian motion*.

**(Brownian motion).** The stochastic process

$$(W_t)_{t\in\mathbb{R}^+} : \mathbb{R}^+ \times (\Omega, (\mathcal{F}_t)_{t \geq 0}, \mathbb{P}) \to \mathbb{R}$$

is a Brownian motion if and only if

1.  $W_0 = 0$,

2.  it is continuous,

3.  has stationary increments: the distribution doesn’t depend on
    initial time, only on waiting time.

    $$\forall t > s,\ W_t - W_s \sim \mathcal{N}(0,t-s)$$

4.  has independent increments over disjoint intervals:

    $$\forall q < r < s < t,\ (W_r-W_q) \perp (W_t-W_s).$$

#### Classes of Brownian motions

1.  <span>***Standard Brownian motion*, or *Wiener Process***</span>.

2.  <span>***Arithmetic Brownian motion*, or *Bachelier Model***</span>.

    $$dp_t = p_{t+h} - p_t = \mu dt + \sigma dW_t$$

    Where $\mu$ is called *drift*, and $\sigma$ the *volatility*.

### Itô Formula
