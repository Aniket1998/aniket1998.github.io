---
layout: homepage
---

## About Me

Hi! I'm a third year CS PhD student in [Stanford Theory Group](https://theory.stanford.edu/main/index.shtml), where I'm advised by the spectacular duo of [Tselil Schramm](https://tselilschramm.org/) and [Nima Anari](https://nimaanari.com/). 

My interests broadly lie at the intersection of probability and theoretical computer science. Recently, I've been thinking about Markov chains, spin glasses, and algorithms for average-case problems.

Prior to grad school, I was a Pre-Doctoral Researcher at Google DeepMind India. Before that, I was a dazed and confused undergrad at IIT Kanpur, where I double majored in Electrical Engineering and Math.


## Selected and Recent Papers

<p class="papers-index-link"><a href="{{ '/papers/' | relative_url }}">View all papers <span aria-hidden="true">→</span></a></p>

{% assign selected_papers = site.data.papers | where: "selected", true %}
{% include paper-list.html papers=selected_papers %}

## Talks

- **Reaching the Algorithmic Threshold for Tensor PCA via Local Markov Chains**<br>
Stanford Theory Seminar; UC San Diego Theory Seminar · Nov 2026

- **Linear Time Streaming Algorithms for Heavy Tailed Statistics**<br>
MSR-IISc Theory Seminar · Aug 2024<br>
[Slides](https://docs.google.com/presentation/d/1pvHixpJPB6mRwnk7q7IduzTkAMiNNOoXm9XtoX4Zs-A/edit?usp=sharing){: .talk-resource} [Video](https://youtu.be/m-Eka_n8iI4?si=PAs126P-S7f4KpOX){: .talk-resource}

- **Sampling Through the Lens of Optimization: Recent Advances and Insights**<br>
MSR-IISc Theory Seminar · Nov 2023; EPFL FLAIR Seminar · Mar 2024<br>
[Slides](https://docs.google.com/presentation/d/1Q8K-gFItZUtFOSrLKA-3cu4KJE7_vkt2TN4_ijU4pjQ/edit?usp=sharing){: .talk-resource} [Video](https://www.youtube.com/watch?v=ufDU59FSCls){: .talk-resource}
