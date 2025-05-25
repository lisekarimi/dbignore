# DBignore

**DBignore** is a simple script to mark unwanted files and folders as ignored by Dropbox, without deleting them from your local machine.

Useful for Python developers and data scientists who want to keep `.env`, `.venv`, `dist/`, `logs`, `models`, and other generated files out of Dropbox sync.


## 🔧 How It Works

Dropbox supports marking files and folders as **"ignored"**. This script finds common junk, temp, and sensitive files/folders, and marks them so Dropbox stops syncing them — but leaves them on disk.


## ✅ Requirements

- Windows with PowerShell
- Dropbox desktop app installed
- Make - for easier command execution

To install `make` with **Chocolatey**:

```bash
choco install make
```

> 💡 If you don’t have Chocolatey, install it from [https://chocolatey.org/install](https://chocolatey.org/install#individual) first.


## 🔧 Setup

1. Clone the repo
```bash
git clone https://github.com/lisekarimi/dbignore.git
cd dbignore
```
2. Open `dropbox_ignore.ps1` and change this line to your own Dropbox project path:
```bash
$parentFolder = "C:\Users\username\Dropbox"
```

3. Open a terminal in the project folder and run
```bash
make ignore
```

This will run the PowerShell script and apply the ignore rules.


## 📁 To Add More Files/Folders to Ignore

Open `dropbox_ignore.ps1` and update these two arrays:

```powershell
$targetNames = @(
  # exact file or folder names (no wildcards)
)

$extensions = @(
  # file extensions to ignore (e.g., ".pkl", ".log")
)
```

Save and re-run `make ignore`.


## 🧹 Safe & Reversible

Ignored items are:

- **Removed from Dropbox cloud**
- **Kept locally**
- **Can be un-ignored anytime** using the `make unignore` command. Just edit `dropbox_unignore.ps1` and add the files or folders you want Dropbox to stop ignoring.

---

Made with ❤️ by Lise

