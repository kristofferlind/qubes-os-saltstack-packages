packages_split-ssh_client-template_bashrc:
  file.append:
    - name: /etc/skel/.bashrc
    - text: |
        # SPLIT SSH CONFIGURATION >>>
        # replace "vault" with your AppVM name which stores the ssh private key(s)
        SSH_VAULT_VM="vault"

        if [ "$SSH_VAULT_VM" != "" ]; then
          export SSH_AUTH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
        fi
        # <<< SPLIT SSH CONFIGURATION
