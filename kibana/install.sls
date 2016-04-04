# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "kibana/map.jinja" import kibana with context %}

# There is no pkg at this time, we can only do source installs
{%- if kibana.source %}
include:
  - kibana.source
{%- else %}
include:
  - kibana.repo

kibana-pkg:
  pkg.installed:
    - name: {{ kibana.pkg }}
{%- endif %}
