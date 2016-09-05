# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "kibana/map.jinja" import kibana with context %}

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
