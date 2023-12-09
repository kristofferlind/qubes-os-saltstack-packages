packages_snap_uptodate:
  pkg.uptodate:
    - refresh: True

packages_snap_install:
  pkg.installed:
    - pkgs:
      - qubes-core-agent-passwordless-root
      - snapd
      - qubes-snapd-helper
    - skip_suggestions: True
    - install_recommends: False
    - order: 1
