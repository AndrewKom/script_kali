#!/bin/bash


mv sshd_config /etc/ssh/sshd_config


echo "auth required pam_tally2.so onerr=fail audit silent deny=5 unlock_time=900"   | tee -a /etc/pam.d/common-auth



sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 365/g' /etc/login.defs


systemctl restart wazuh-agent 