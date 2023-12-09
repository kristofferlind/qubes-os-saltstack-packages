packages_qubes-video-companion_dom0_install:
  pkg.installed:
    - pkgs:
      - qubes-video-companion
    - skip_suggestions: True
    - install_recommends: False
    - order: 1

# this file should be included by default in dom0 install but fails, leaving it managed from here also allow customization
/etc/qubes-rpc/policy/qvc.ScreenShare:
  file.managed:
    - source:
      - salt://packages/kristofferlind/qubes-video-companion/qvc.ScreenShare
    - user: root
    - mode: '0644'
    - replace: True
