# Scripts

## `verify-workspace.sh`

A read-only verification helper that checks the required directories/files and prints current permissions/ownership. Run it as `agent007` after completing the lab:

```bash
bash scripts/verify-workspace.sh
```

Run it from the extracted repository root. It does not create, delete, repair, or change permissions on lab files, and it does not fabricate evidence. The ownership change can affect access to `targets.txt`; the script reports metadata rather than requiring that `agent007` can read the file.
