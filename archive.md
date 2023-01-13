---
layout: page
permalink: /archive/
title: Archive
---

<!-- <h5> <a href="/archive/"> [日期] </a>    <a href="/categories/"> [分类] </a>    <a href="/tags/"> [标签] </a></h5> -->

<div class="post">

{% for post in site.posts %}
{% assign thisyear = post.date | date: "%B %Y" %}
{% assign prevyear = post.previous.date | date: "%B %Y" %}
{% assign counter = counter | plus: 1 %}
{% if thisyear != prevyear %}

<h2><small>{{ thisyear }} <small><strong><sup>{{ counter }}</sup></strong></small></small></h2>

{% assign fli = forloop.index | minus: counter %}
{% for post2 in site.posts limit: counter offset: fli %} 

<a href="{{ post2.url }}">{{ post2.title }}</a>&nbsp;&nbsp;
<small><small><time datetime="{{ post2.date | date_to_xmlschema }}">{{ post2.date | date: "%-d %b %Y" }}</time></small></small>
<br>
{% endfor %}
{% assign counter = 0 %}
{% endif %}
{% endfor %}
</div>
