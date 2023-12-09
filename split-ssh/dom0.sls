packages_split-ssh_dom0_policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/qubes.SshAgent
    - source: 
      - salt://packages/kristofferlind/split-ssh/dom0.qubes.SshAgent
    - user: root
    - mode: '0644'
    - replace: True
