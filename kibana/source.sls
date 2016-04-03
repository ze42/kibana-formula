# Install Kibana from source
{% from "kibana/map.jinja" import kibana with context %}

download-kibana-sources:
  {% if grains['osarch'] == 'amd64' %}
  file.managed:
    - name: {{kibana.sourceInstallPath}}{{kibana.sources.linux.amd64.tarball}}
    - source: {{kibana.sources.linux.amd64.baseURL}}{{kibana.sources.linux.amd64.tarball}}
    - source_hash: {{kibana.sources.linux.amd64.baseURL}}{{kibana.sources.linux.amd64.hashfile}}
    - makedirs: true
    - unless: ls {{kibana.sourceInstallPath}}{{kibana.sources.linux.amd64.tarball}}
  {% else %}
  file.managed:
    - name: {{kibana.sourceInstallPath}}{{kibana.sources.linux.x86.tarball}}
    - source: {{kibana.sources.linux.x86.baseURL}}{{kibana.sources.linux.x86.tarball}}
    - source_hash: {{kibana.sources.linux.x86.baseURL}}{{kibana.sources.linux.x86.hashfile}}
    - makedirs: true
    - unless: ls {{kibana.sourceInstallPath}}{{kibana.sources.linux.x86.tarball}}
  {% endif %}
