# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "kibana/map.jinja" import kibana with context %}

kibana-pkg:
  pkg.installed:
    - name: {{ kibana.pkg }}
