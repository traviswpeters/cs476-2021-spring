---
layout: default
---

## Activities

Below are links to activities that we'll do in class. 

{% assign sorted_pages = site.pages | sort: 'id' %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "activity" %}
**{{page.date}}** --- [{{page.title}}]({{site.baseurl}}{{page.url}})
{:.m-0 .p-0}
{% endif %}
{% endfor %}
{% endfor %}
