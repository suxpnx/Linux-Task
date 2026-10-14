# Workflow: Secure File Management & User Configuration

This procedure is based on the uploaded activity sheet. Replace no required usernames, filenames, or paths. Commands labelled **existing admin account** are run from the account you already use with `sudo`; **agent007** commands are run after `su - agent007`; **root shell** is used only for the explicit ownership change.

## Phase 1 — Create and configure the user

### Step 1.1 — Create `agent007`
**Run as:** Existing account with sudo privileges.  
**Command:**
```bash
sudo useradd -m -s /bin/bash -G sudo agent007
```
**Purpose:** Creates the user, home directory, Bash login shell, and `sudo` group membership as required.  
**Expected result:** No output on success.  
**Verification:**
```bash
getent passwd agent007
id agent007
```
Check that the home directory is `/home/agent007`, shell is `/bin/bash`, and `sudo` appears among the groups.  
**Evidence:** Capture a terminal screenshot if desired; the task does not explicitly require this screenshot.  
**Note:** If the account already exists, stop and inspect it rather than blindly re-running or deleting it.

### Step 1.2 — Set the password
**Run as:** Existing account with sudo privileges.  
**Command:**
```bash
sudo passwd agent007
```
**Purpose:** Sets an interactive password for the new account.  
**Expected result:** The terminal prompts for and confirms a password.  
**Verification:** The password-setting command reports success. Do not save the password in evidence or Git.

### Step 1.3 — Switch to the new user
**Run as:** Existing account.  
**Command:**
```bash
su - agent007
```
**Purpose:** Opens a login shell as `agent007`; subsequent ordinary steps must use this account.  
**Verification:**
```bash
whoami
pwd
```
Expected: `agent007` and `/home/agent007`.  
**Evidence:** Optional screenshot showing the active user.

## Phase 2 — Create the workspace

**Run as:** `agent007`.  
**Commands:**
```bash
cd /home/agent007
mkdir -p mission/intel mission/ops/backup
cd /home/agent007/mission/intel
```
**Purpose:** Creates the exact required directory structure and moves into `intel/`.  
**Verification:**
```bash
ls -la /home/agent007/mission
ls -la /home/agent007/mission/ops
```
**Expected result:** `intel/` and `ops/` under `mission/`, with `backup/` under `ops/`.  
**Evidence:** Optional screenshot of the directory listing.

## Phase 3 — Create files and save listing outputs

**Run as:** `agent007`, from `/home/agent007/mission/intel`.  
**Commands:**
```bash
cd /home/agent007/mission/intel
touch targets.txt routes.txt keys.txt
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt
```
**Purpose:** Creates three empty files and redirects the three required listing commands to their named output files.  
**Expected result:** All three original files and all three listing files exist in `intel/`. Because shell redirection creates the output file before `ls` runs, the listing output may include its own output filename.  
**Verification:**
```bash
ls
ls -l
ls -la
```
**Evidence:** Capture terminal output if useful. The submission specifically requires final recursive output, command history, and the short explanation.

## Phase 4 — Copy and remove files

**Run as:** `agent007`.  
**Commands:**
```bash
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
rm /home/agent007/mission/intel/keys.txt
```
**Purpose:** Copies `routes.txt` to `backup/` and removes `keys.txt` from `intel/`.  
**Expected result:** `routes.txt` exists in both locations at this point; `keys.txt` is absent from `intel/`.  
**Verification:**
```bash
ls -l /home/agent007/mission/intel
ls -l /home/agent007/mission/ops/backup
```
**Evidence:** Optional screenshot of both listings.

## Phase 5 — Set and verify file permissions

**Run as:** `agent007`.  
**Command:**
```bash
chmod 640 /home/agent007/mission/intel/targets.txt
ls -l /home/agent007/mission/intel/targets.txt
```
**Purpose:** `640` means owner read/write (`rw-`), group read (`r--`), and others no permissions (`---`).  
**Expected result before the ownership demonstration:** Permission string should begin `-rw-r-----`.  
**Evidence:** If capturing a screenshot, include the `chmod` and `ls -l` commands and their output.  
**Important:** The later ownership step may make `targets.txt` owned by `root`; with `root:root` ownership, `agent007` may no longer have group read access. Do not confuse that later ownership result with the required mode setting. The file mode should remain `640` unless the task/instructor says otherwise.

## Phase 6 — Simulate deletion and recover the backup

**Run as:** `agent007`.  
**Commands:**
```bash
rm /home/agent007/mission/ops/backup/routes.txt
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
```
**Purpose:** Intentionally removes the backup copy and restores it from the original file in `intel/`.  
**Expected result:** `ops/backup/routes.txt` exists again.  
**Verification:**
```bash
ls -l /home/agent007/mission/ops/backup/routes.txt
```
**Evidence:** Optional screenshot showing the recovery command and verification. This step is part of the practical exercise.

## Phase 7 — Change ownership as root, then inspect as `agent007`

### Step 7.1 — Enter a root shell
**Run as:** Existing sudo-capable account, after leaving the `agent007` shell.  
**Command:**
```bash
exit
sudo -i
```
If `exit` returns you to a different shell than expected, verify the current account with `whoami` before continuing.

### Step 7.2 — Change ownership
**Run as:** Root shell.  
**Command:**
```bash
chown root:root /home/agent007/mission/intel/targets.txt
```
**Purpose:** Demonstrates the required privileged ownership change, using the task’s example owner `root`.  
**Expected result:** No output on success.  
**Verification as root:**
```bash
ls -l /home/agent007/mission/intel/targets.txt
```
Expected owner and group: `root root`.  
**Note:** This is the explicit privileged ownership step in the activity; do not perform ordinary file operations as root.

### Step 7.3 — Return to `agent007` and observe
**Run as:** Root shell, then switch to the normal task user.  
**Commands:**
```bash
exit
su - agent007
ls -l /home/agent007/mission/intel/targets.txt
```
**Purpose:** Returns to `agent007` and observes the changed owner with `ls -l`, as required.  
**Expected result:** The listing shows the owner/group changed to `root root`. With mode `640`, `agent007` may not be able to read or write the file if neither owner nor group permissions apply; this is an expected consequence of the demonstration.  
**Evidence:** Capture the `ls -l` result after switching back to `agent007`.

## Phase 8 — Capture final output and submission

**Run as:** `agent007`.  
**Command required by the task:**
```bash
ls -laR /home/agent007/mission/
```
Copy the actual output into `submission/final-output.txt` (or save it as a screenshot). To save the output directly in the repository, use the absolute path to your extracted project directory, for example:
```bash
ls -laR /home/agent007/mission/ > /path/to/linux-secure-file-management-kali/submission/final-output.txt
```
Replace `/path/to/...` with the actual location of this repository on your machine. This redirects the actual output; it does not create a fake result.

### Save command history
The task accepts `.bash_history` or a copy-paste of the commands used. Before closing the `agent007` shell:
```bash
history -a
history
```
Copy the commands you actually used into `submission/command-history.txt`. Do not paste passwords or unrelated sensitive commands. If you prefer `.bash_history`, copy the relevant real history from `/home/agent007/.bash_history` after it has been written.

### Include the 4–5-line explanation
Complete `submission/README.md` with the short explanation. A source-aligned example is already provided there; you may use it if it accurately represents your understanding.

## Final verification checklist

- [ ] `agent007` created with home directory, `/bin/bash`, and `sudo` membership.
- [ ] Password set and switched to `agent007`.
- [ ] Required `mission/intel/` and `mission/ops/backup/` directories exist.
- [ ] `targets.txt`, `routes.txt`, and `keys.txt` were initially created in `intel/`.
- [ ] `listing1.txt`, `listing2.txt`, and `listing3.txt` were generated using `ls`, `ls -l`, and `ls -la`.
- [ ] `routes.txt` copied to `backup/`; `keys.txt` removed using `rm`.
- [ ] `targets.txt` set to mode `640` and verified with `ls -l`.
- [ ] Backup `routes.txt` intentionally removed and restored.
- [ ] Ownership of `targets.txt` changed from a root shell and inspected as `agent007`.
- [ ] Actual command history saved.
- [ ] Actual final `ls -laR /home/agent007/mission/` output or screenshot saved.
- [ ] 4–5-line explanation of `chmod`, `ls -l`, and `useradd` included.
