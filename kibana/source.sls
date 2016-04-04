# Install Kibana from source
{% from "kibana/map.jinja" import kibana with context %}

make-sure-kibana-opt-dir-exists:
  file.directory:
    - name: {{kibana.sourceInstallPath}}

download-kibana-sources:
  {% if grains['osarch'] == 'amd64' %}
  archive.extracted:
    - name: {{kibana.sourceInstallPath}}{{kibana.sources.linux.amd64.tarball}}
    - source: {{kibana.sources.linux.amd64.baseURL}}{{kibana.sources.linux.amd64.tarball}}
    - source_hash: {{kibana.sources.linux.amd64.baseURL}}{{kibana.sources.linux.amd64.hashfile}}
    - archive_format: tar
  {% else %}
  archive.extracted:
    - name: {{kibana.sourceInstallPath}}{{kibana.sources.linux.x86.tarball}}
    - source: {{kibana.sources.linux.x86.baseURL}}{{kibana.sources.linux.x86.tarball}}
    - source_hash: {{kibana.sources.linux.x86.baseURL}}{{kibana.sources.linux.x86.hashfile}}
    - archive_format: tar
  {% endif %}
