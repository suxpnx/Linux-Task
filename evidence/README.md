# Evidence Collection

Do not add invented or sample outputs as if they were your own. Capture evidence while performing the practical task.

## Required evidence from the activity sheet

1. **Command history:** save `.bash_history` or a copy-paste of the commands you actually used. See `submission/command-history.txt`.
2. **Final recursive listing:** capture a screenshot or save the actual output of:
   ```bash
   ls -laR /home/agent007/mission/
   ```
   Store text output in `submission/final-output.txt` or a screenshot in `screenshots/`.
3. **4–5-line explanation:** explain `chmod`, `ls -l`, and `useradd`; complete `submission/README.md`.

## Helpful optional screenshots

The task sheet only mandates a screenshot or text file of the final recursive listing; these extra screenshots are optional study evidence.

| Suggested filename | When to capture | What it demonstrates |
|---|---|---|
| `01-user-created.png` | After user creation and `id agent007` | Account and group configuration |
| `02-workspace-created.png` | After creating the directory structure | Required directory layout |
| `03-file-permissions.png` | After `chmod 640` and `ls -l` | Permission mode before ownership change |
| `04-backup-recovered.png` | After restoring backup `routes.txt` | Copy/recovery operation |
| `05-ownership-change.png` | After returning to `agent007` and running `ls -l` | Ownership change observed from the normal account |
| `06-final-directory-structure.png` | After final `ls -laR` | Final recursive listing required by the task |

## Evidence folders

- `screenshots/`: place genuine terminal screenshots here.
- `terminal-output/`: place optional captured terminal outputs here.

Use readable terminal font size and keep the command and output visible. Avoid showing passwords or unrelated personal information.
