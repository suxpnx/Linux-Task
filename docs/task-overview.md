# Task Overview

## Title
Practical Task: Secure File Management & User Configuration on Kali Linux

## Objective
Demonstrate fundamental Linux filesystem and user-management commands by setting up a secure workspace for a newly created user and organizing files with proper permissions and structure.

## Restrictions and account roles
The activity says not to use root for file operations. Create `agent007` and use that account for the workspace and file steps. The task explicitly makes the ownership change a root operation: change ownership of `intel/targets.txt`, then return to `agent007` and observe the result.

## Required operations
1. Create `agent007` with a home directory and `/bin/bash`, and add the user to `sudo`:
   `sudo useradd -m -s /bin/bash -G sudo agent007`
2. Set the account password and switch to `agent007`.
3. Create `/home/agent007/mission/intel/` and `/home/agent007/mission/ops/backup/` using `mkdir` and `cd`.
4. Create empty `targets.txt`, `routes.txt`, and `keys.txt` in `intel/`.
5. Redirect `ls`, `ls -l`, and `ls -la` output into `listing1.txt`, `listing2.txt`, and `listing3.txt` in `intel/`.
6. Copy `routes.txt` to `ops/backup/` and remove `keys.txt` with `rm`.
7. Set `targets.txt` to owner read/write, group read, others no access; verify with `ls -l`. Numeric mode: `640`.
8. Delete `ops/backup/routes.txt` intentionally, then restore it from `intel/routes.txt`.
9. As root, change ownership of `intel/targets.txt` to another user (for example `root`); switch back to `agent007` and observe with `ls -l`.

## Required submission
- Command history (`.bash_history` or a copy-paste of commands used).
- Screenshot or text file showing the final output of `ls -laR /home/agent007/mission/`.
- A 4–5-line explanation of `chmod`, `ls -l`, and `useradd`.

The task does not specify required screenshot count, file contents, a particular root ownership target beyond an example, or a GitHub URL. Do not treat those as additional task requirements.
