# The Multi-Cluster Fluctuating Two-Ray Fading Model
This is a code pack related to the following scientific article:

José David Vega Sánchez, F. Javier López-Martínez, José F. Paris, Juan M. Romero-Jerez, “The Multi-cluster Fluctuating Two-Ray Fading Model,” Dec., 2022, https://arxiv.org/pdf/2212.02448.pdf. [Online].

# Abstract of Article

We introduce a new class of fading channels, built as the superposition of two fluctuating specular components with random phases, plus a clustering of scattered waves: the Multi-cluster Fluctuating Two-Ray (MFTR) fading channel. The MFTR model emerges as a natural generalization of both the fluctuating two-ray (FTR) and the κ-μ Shadowed fading models through a more general yet equally mathematically tractable model. This generalization enables the presence of additional multipath clusters in the purely ray-based FTR model, and the convenience of the new underlying fading channel model is discussed in depth. Then, we derive all the chief probability functions of the MFTR model (e.g., probability density function (PDF), cumulative density function (CDF), and moment generation function) in closed-form, having a mathematical complexity similar to other fading models in the state-of-the-art. We also provide two additional analytical formulations for the PDF and the CDF: (i) in terms of a continuous mixture of κ-μ Shadowed distributions, and (ii) as an infinite discrete mixture of Gamma distributions. Such expressions enable to conduct performance analysis under MFTR fading by \emph{directly} leveraging readily available results for the κ-μ Shadowed or Nakagami-m cases, respectively. The performance of wireless communications systems undergoing MFTR fading is exemplified in terms of a classical benchmarking metric like the outage probability, both in exact and asymptotic forms, and the amount of fading.

# Content of Code Package

The package contains a main script labeled "scriptMFTR.m" which generates the theoretical probability density function (PDF) and cumulative density function (CDF) of the MFTR model in both amplitude and power/SNR distributions, as well as the Monte Carlo simulation for comparison purposes. In addition, the package contains a Matlab function that is used by one of the main script, i.e., "scriptMFTR.m". See each file for further documentation.

For any questions, please do not hesitate to contact me at the email jose.vega01@epn.edu.ec.
