packages_split-ssh_install:
  pkg.installed:
    - pkgs:
      - openssh-client
      - libnotify-bin
      {% if grains['os_family']|lower == 'debian' %}
      - ssh-askpass-gnome
      {% else %}
      - openssh-askpass
      {% endif %}
    - skip_suggestions: True
    - install_recommends: False

/etc/qubes-rpc/qubes.SshAgent:
  file.managed:
    - source:
      - salt://packages/kristofferlind/split-ssh/vault.qubes.SshAgent
    - user: root
    - mode: '0555'
    - replace: True
