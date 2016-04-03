# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "kibana/map.jinja" import kibana with context %}

kibana-config:
  file.managed:
    - name: {{ kibana.config }}
    - source: salt://kibana/files/example.tmpl
    - mode: 644
    - user: root
    - group: root
