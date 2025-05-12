# PwshUtils.FindApp

A PowerShell utility module that helps you find installed applications on a Windows system — whether in standard directories or installed via the Microsoft Store.

---

## 📦 Module Overview

This module provides a main cmdlet:

- `Find-App`: Searches common installation paths and the Microsoft Store for applications matching a given name.

Supporting internal functions:
- `Find-AppCDrive`: Scans common folders like `Program Files`, `Program Files (x86)`, and `AppData` recursively for `.exe` files.
- `Find-MSStoreApp`: Uses `Get-AppxPackage` to check for MS Store apps.

---

## 🚀 Usage

### 1. Import the module

```powershell
Import-Module PwshUtils.FindApp
```

### 2. Search for an application

```powershell
Find-App -AppName "notepad"
```

#### Example output:

| Name         | Directory                           |
|--------------|-------------------------------------|
| notepad.exe  | C:\Program Files\WindowsApps\... |

---

## 📁 Files Included

- `PwshUtils.FindApp.psm1`: PowerShell module script
- `PwshUtils.FindApp.psd1`: Module manifest
- `README.md`: This documentation

---

## 🔧 Features

- ✅ Recursively searches for `.exe` files in key system folders
- 🔎 Detects apps installed from Microsoft Store
- ⚙️ Uses built-in cmdlets (`Get-ChildItem`, `Get-AppxPackage`)
- 🧠 Lightweight and script-friendly

---

## 📌 Requirements

- PowerShell 5.1+
- Windows OS

---

## 💡 Why I Built This

Searching for where apps are installed (especially Store apps) is a recurring headache. This tool solves it quickly and scriptably, without relying on third-party tools.

---

## 📜 License

MIT License — free to use, modify, and share 😎.
