# Secure File Management & User Configuration on Kali Linux

A GitHub-ready, learning-focused workflow for the practical task **“Secure File Management & User Configuration on Kali Linux.”** This repository provides instructions, commands, verification guidance, and submission templates. It does not contain fabricated terminal output or screenshots.

## Objective

Demonstrate fundamental Linux filesystem and user-management commands by creating a secure workspace for `agent007`, organizing files, inspecting permissions, recovering a deleted backup, and observing an ownership change.

## Task requirements

- Create `agent007` with a home directory, `/bin/bash` shell, and membership in the `sudo` group.
- Set a password and switch to `agent007`.
- Create `/home/agent007/mission/` with `intel/` and `ops/backup/`.
- In `intel/`, create empty `targets.txt`, `routes.txt`, and `keys.txt`.
- Save output from `ls`, `ls -l`, and `ls -la` as `listing1.txt`, `listing2.txt`, and `listing3.txt` in `intel/`.
- Copy `routes.txt` to `ops/backup/`; remove `keys.txt` using `rm`.
- Set `targets.txt` permissions so owner has read/write, group has read only, and others have no permissions (`chmod 640`).
- Delete `ops/backup/routes.txt` intentionally and restore it from `intel/routes.txt`.
- As root, change ownership of `intel/targets.txt` to another user (the task gives `root` as an example); switch back to `agent007` and inspect with `ls -l`.
- Submit command history, a screenshot or text file of `ls -laR /home/agent007/mission/`, and a 4–5-line explanation of `chmod`, `ls -l`, and `useradd`.

## Tools

- Kali Linux
- Bash
- Standard Linux commands: `useradd`, `passwd`, `su`, `mkdir`, `cd`, `touch`, `ls`, `cp`, `rm`, `chmod`, `chown`, `history`
- `sudo` for the user-creation and explicitly privileged ownership step

## Prerequisites

- Access to a Kali Linux environment and an account that can use `sudo`.
- The username `agent007` must not already exist. If it does, stop and inspect the existing account rather than deleting or modifying it blindly.
- Complete the password prompts interactively; do not put passwords in scripts or Git.
- Keep normal workspace/file operations under `agent007`. The ownership-change step is the explicit privileged exception in the task.

## Quick start

1. Extract this repository and open a terminal in its project directory.
2. Read [`workflow/workflow.md`](workflow/workflow.md) before executing commands.
3. Create the account from your existing administrator-capable account:

   ```bash
   sudo useradd -m -s /bin/bash -G sudo agent007
   sudo passwd agent007
   su - agent007
   ```

4. As `agent007`, follow the workspace, file, listing, copy/remove, permissions, and recovery phases in the workflow. The command reference is [`commands/commands.sh`](commands/commands.sh).
5. Perform the ownership demonstration exactly as described in the workflow: leave the `agent007` session, use a root shell for `chown`, then switch back to `agent007` and inspect the file.
6. Capture your real command history and final recursive listing in the `submission/` directory, then review [`submission/README.md`](submission/README.md).

## Expected final workspace

```text
/home/agent007/mission/
├── intel/
│   ├── targets.txt
│   ├── routes.txt
│   ├── listing1.txt
│   ├── listing2.txt
│   └── listing3.txt
└── ops/
    └── backup/
        └── routes.txt
```

`keys.txt` is intentionally removed. The listing files are created from the required `ls` commands. Since the task says to change `targets.txt` ownership to another user, its final owner may be `root` (if you choose the provided example). The final recursive listing should reflect what actually exists after you complete the lab.

## Repository structure

```text
linux-secure-file-management-kali/
├── README.md
├── .gitignore
├── docs/
│   ├── README.md
│   └── task-overview.md
├── workflow/
│   ├── README.md
│   └── workflow.md
├── commands/
│   ├── README.md
│   └── commands.sh
├── scripts/
│   ├── README.md
│   └── verify-workspace.sh
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   │   └── .gitkeep
│   └── terminal-output/
│       └── .gitkeep
└── submission/
    ├── README.md
    ├── command-history.txt
    └── final-output.txt
```

## Verification checklist

- [ ] `agent007` exists, has a home directory, uses `/bin/bash`, and belongs to `sudo`.
- [ ] Workspace directories match the required paths.
- [ ] The three original files were created in `intel/`.
- [ ] `listing1.txt`, `listing2.txt`, and `listing3.txt` exist in `intel/`.
- [ ] `routes.txt` exists in both `intel/` and `ops/backup/` after recovery.
- [ ] `keys.txt` has been removed from `intel/`.
- [ ] `targets.txt` has mode `640` before the ownership demonstration.
- [ ] Backup deletion and recovery were performed.
- [ ] Ownership was changed from a root shell and the result was inspected as `agent007`.
- [ ] Actual command history has been saved.
- [ ] Actual `ls -laR /home/agent007/mission/` output or screenshot has been saved.
- [ ] The required 4–5-line command explanation is included.

## Troubleshooting and safety notes

- **`useradd: user 'agent007' already exists`:** Stop and inspect with `id agent007` and `getent passwd agent007`. Do not delete an existing account as a shortcut.
- **`su - agent007` fails:** Confirm the password was set with `sudo passwd agent007` and type it carefully.
- **`Permission denied` after `chown root:root`:** This may be expected for writing to `targets.txt` as `agent007`; the ownership demonstration deliberately changes the file owner. Use `ls -l` to observe the metadata. Do not change permissions back unless your instructor directs you.
- **`sudo` is unavailable:** Use the authorized administrator account for the explicitly privileged steps; do not attempt to bypass system access controls.
- **Do not run the normal file-operation steps as root.** Only the account-creation commands and the specified ownership-change operation need elevated privilege.
- Do not commit passwords, personal data, or unrelated terminal history to GitHub.

## Source alignment

This project follows the uploaded task’s names, paths, commands, and submission requirements. It does not add extra lab objectives. Evidence files remain placeholders until you perform the task.
