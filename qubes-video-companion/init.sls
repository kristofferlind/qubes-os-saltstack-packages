packages_qubes-video-companion_install:
  pkg.installed:
    - pkgs:
      - qubes-video-companion
      - qubes-core-agent-passwordless-root
    - skip_suggestions: True
    - install_recommends: False
    - order: 1
