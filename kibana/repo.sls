# Setup Elastic Repo
{% from "kibana/map.jinja" import kibana with context %}

kibana-repo:
  pkgrepo.managed:
    - humanname: Kibana Repo
    - name: deb http://packages.elastic.co/kibana/{{kibana.repoVersion}}/debian stable main
    - file: /etc/apt/sources.list.d/kibana.list
    - gpgcheck: 1
    - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch
    - require_in:
      - pkg: kibana
