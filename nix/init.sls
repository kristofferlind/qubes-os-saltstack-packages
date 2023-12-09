# bind /nix
/rw/config/qubes-bind-dirs.d:
  file.directory:
    - mkdirs: True
    - force: True

/rw/config/qubes-bind-dirs.d/50_user.conf:
  file.managed:
    - source: 
      - salt://packages/kristofferlind/nix/50_user.conf
    - mode: '0644'
    - replace: True

# copy install script
/home/user/nix-install.sh:
  file.managed:
    - source:
      - salt://packages/kristofferlind/nix/nix-install.sh
    - user: root
    - mode: '0700'
    - replace: True

# copy tarball
/home/user/Downloads/nix-2.19.1-x86_64-linux.tar.xz:
  file.managed:
    - source:
      - salt://packages/kristofferlind/nix/nix-2.19.1-x86_64-linux.tar.xz
    - user: root
    - mode: '0644'
    - replace: True

# install (rewritten to use local tarball, fails to initialize channels)
"/home/user/nix-install.sh --daemon":
  cmd.run:
    - runas: root
    - creates:
      - /nix

# hack to initialize channels that were skipped during install as it's offline
/etc/skel/.bashrc:
  file.append:
    - text: |
        # hack to initialize channel, skipped in template install as they weren't available (offline)
        nix-channel --add https://nixos.org/channels/nixpkgs-unstable
        nix-channel --update
