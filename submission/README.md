# Submission Materials

The uploaded task requires three deliverables:

1. **Command history** — `.bash_history` or a copy-paste of the commands used.
2. **Final recursive listing** — a screenshot or text file showing the output of `ls -laR /home/agent007/mission/`.
3. **A 4–5-line explanation** of `chmod`, `ls -l`, and `useradd`.

## Complete the command history

Copy your actual commands into [`command-history.txt`](command-history.txt). Do not leave the placeholder as your submitted evidence. Alternatively, provide your real `.bash_history` file if accepted by your instructor. Remove passwords and unrelated sensitive history.

## Complete the final output

Save actual output from this command into [`final-output.txt`](final-output.txt), or save a genuine screenshot in `evidence/screenshots/`:

```bash
ls -laR /home/agent007/mission/
```

Run it after the task steps, as `agent007`. If writing to the repository file, use the actual absolute path of your extracted project directory.

## Required 4–5-line explanation

The following is a four-line example aligned with the activity. Read it and adjust it if needed to reflect your understanding:

`chmod` changes file or directory permissions, controlling what the owner, group, and others can do.  
`ls -l` displays a detailed listing including permissions, link count, owner, group, size, and modification time.  
`useradd` creates a new user account; options such as `-m` create a home directory and `-s` selects the login shell.  
In this task, `sudo useradd -m -s /bin/bash -G sudo agent007` creates `agent007` with a home directory, Bash shell, and membership in the `sudo` group.

## Before submitting

- [ ] `command-history.txt` contains the commands actually used, or actual `.bash_history` is supplied.
- [ ] `final-output.txt` contains real output, or a genuine screenshot of the final recursive listing is supplied.
- [ ] The 4–5-line explanation is included.
- [ ] Optional screenshots are genuine and do not expose passwords.
