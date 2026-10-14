#!/usr/bin/env bash
# Command reference for "Secure File Management & User Configuration on Kali Linux".
# IMPORTANT: This file is a reference, not an all-in-one automation script.
# Execute each section manually under the account stated in its heading.
# Do not put passwords in this file.

# ---------------------------------------------------------------------------
# SECTION A — Existing account with sudo privileges
# ---------------------------------------------------------------------------
sudo useradd -m -s /bin/bash -G sudo agent007
sudo passwd agent007
su - agent007

# ---------------------------------------------------------------------------
# SECTION B — Run after switching to agent007 (normal user)
# ---------------------------------------------------------------------------
whoami
pwd

# Create the required workspace and navigate into intel/.
cd /home/agent007
mkdir -p mission/intel mission/ops/backup
cd /home/agent007/mission/intel

# Create the three empty files.
touch targets.txt routes.txt keys.txt

# Save each listing command's output to the required separate file.
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt

# Copy routes.txt to backup/ and remove keys.txt from intel/.
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
rm /home/agent007/mission/intel/keys.txt

# Set owner rw, group r, others no permissions; verify.
chmod 640 /home/agent007/mission/intel/targets.txt
ls -l /home/agent007/mission/intel/targets.txt

# Intentionally delete the backup copy, then restore it from intel/.
rm /home/agent007/mission/ops/backup/routes.txt
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
ls -l /home/agent007/mission/ops/backup/routes.txt

# ---------------------------------------------------------------------------
# SECTION C — Explicit ownership demonstration (privileged)
# ---------------------------------------------------------------------------
# First leave the agent007 shell and enter a root shell from the sudo-capable
# account. Do not perform the normal file operations as root.
exit
sudo -i
chown root:root /home/agent007/mission/intel/targets.txt
ls -l /home/agent007/mission/intel/targets.txt
exit

# ---------------------------------------------------------------------------
# SECTION D — Switch back to agent007 and collect the required final output
# ---------------------------------------------------------------------------
su - agent007
ls -l /home/agent007/mission/intel/targets.txt
ls -laR /home/agent007/mission/

# Save actual command history before closing this agent007 shell:
history -a
history
# Copy the commands actually used into submission/command-history.txt.
# Save actual recursive listing output to submission/final-output.txt using
# the real absolute path of this repository, as described in workflow/workflow.md.
