# Install Kibana from source
{% from "kibana/map.jinja" import kibana with context %}

make-sure-kibana-opt-dir-exists:
  file.directory:
    - name: {{kibana.sourceInstallPath}}

download-kibana-sources-linux:
  {% if grains['osarch'] == 'amd64' %}
  archive.extracted:
    - name: {{kibana.sourceInstallPath}}
    - source: {{kibana.sources.baseURL}}kibana-{{kibana.sourceVersion}}-linux-x64.tar.gz
    - source_hash: {{kibana.sources.baseURL}}kibana-{{kibana.sourceVersion}}-linux-x64.tar.gz.sha1.txt
    - archive_format: tar
    - if_missing: {{kibana.sourceInstallPath}}kibana-{{kibana.sourceVersion}}-linux-x64
  {% else %}
  archive.extracted:
    - name: {{kibana.sourceInstallPath}}
    - source: {{kibana.sources.baseURL}}kibana-{{kibana.sourceVersion}}-linux-x86.tar.gz
    - source_hash: {{kibana.sources.baseURL}}kibana-{{kibana.sourceVersion}}-linux-x86.tar.gz.sha1.txt
    - archive_format: tar
    - if_missing: {{kibana.sourceInstallPath}}kibana-{{kibana.sourceVersion}}-linux-x64
  {% endif %}
