# GitHub Organization Setup Guide

This guide will help you set up the `jan-a-krzywda-page` GitHub organization with all the necessary repositories.

## Prerequisites

1. **GitHub Account**: Make sure you have a GitHub account
2. **Git Installed**: Ensure git is installed on your system
3. **GitHub CLI** (Optional but recommended): Install `gh` CLI for easier management

## Step 1: Create GitHub Organization

### Option A: Using GitHub Web Interface
1. Go to [GitHub](https://github.com)
2. Click your profile picture → "Your organizations"
3. Click "New organization"
4. Choose "Free" plan
5. Organization name: `jan-a-krzywda-page`
6. Contact email: [your email]
7. Click "Create organization"

### Option B: Using GitHub CLI
```bash
gh org create jan-a-krzywda-page --description "Research organization of Jan A. Krzywda focused on quantum technologies"
```

## Step 2: Create Main Organization Repository

### Option A: Using GitHub Web Interface
1. Go to your organization page
2. Click "New repository"
3. Repository name: `jan-a-krzywda-page`
4. Description: "Research organization of Jan A. Krzywda focused on quantum technologies"
5. Make it **Public**
6. Initialize with README: **No** (we already have one)
7. Click "Create repository"

### Option B: Using GitHub CLI
```bash
cd /Users/krzywdaja/Documents/Repositories/jan-a-krzywda-page
gh repo create jan-a-krzywda-page/jan-a-krzywda-page --public --description "Research organization of Jan A. Krzywda focused on quantum technologies"
```

## Step 3: Push Main Organization Repository

```bash
cd /Users/krzywdaja/Documents/Repositories/jan-a-krzywda-page
git init
git add README.md
git commit -m "Initial commit: Organization overview and navigation"
git branch -M main
git remote add origin https://github.com/jan-a-krzywda-page/jan-a-krzywda-page.git
git push -u origin main
```

## Step 4: Create Project Repositories

For each project, you'll need to create a repository and push the README. Here are the commands for each:

### 4.1 Charge Noise in Spin Qubits

```bash
# Create repository on GitHub
gh repo create jan-a-krzywda-page/charge-noise-spin-qubits --public --description "Arguably the biggest obstacle to large scale spin qubit device. Experimental characterization and ab-initio simulation"

# Push to GitHub
cd charge-noise-spin-qubits
git init
git add README.md
git commit -m "Initial commit: Charge noise in spin qubits project overview"
git branch -M main
git remote add origin https://github.com/jan-a-krzywda-page/charge-noise-spin-qubits.git
git push -u origin main
cd ..
```

### 4.2 Machine Learning for Quantum

```bash
# Create repository on GitHub
gh repo create jan-a-krzywda-page/machine-learning-quantum --public --description "Classical machine learning methods for processing and simulating quantum systems and devices from sparse data"

# Push to GitHub
cd machine-learning-quantum
git init
git add README.md
git commit -m "Initial commit: Machine learning for quantum project overview"
git branch -M main
git remote add origin https://github.com/jan-a-krzywda-page/machine-learning-quantum.git
git push -u origin main
cd ..
```

### 4.3 Quantum Feedback Control

```bash
# Create repository on GitHub
gh repo create jan-a-krzywda-page/quantum-feedback-control --public --description "Qubits suffer from dynamical noise. We deploy real-life FPGA controller to track down and correct random fluctuations"

# Push to GitHub
cd quantum-feedback-control
git init
git add README.md
git commit -m "Initial commit: Quantum feedback control project overview"
git branch -M main
git remote add origin https://github.com/jan-a-krzywda-page/quantum-feedback-control.git
git push -u origin main
cd ..
```

### 4.4 Quantum Games

```bash
# Create repository on GitHub
gh repo create jan-a-krzywda-page/quantum-games --public --description "Games drive progress, from chess to computer graphics. Now the time has come to quantum technologies"

# Push to GitHub
cd quantum-games
git init
git add README.md
git commit -m "Initial commit: Quantum games project overview"
git branch -M main
git remote add origin https://github.com/jan-a-krzywda-page/quantum-games.git
git push -u origin main
cd ..
```

### 4.5 Quantum Learning Machines

```bash
# Create repository on GitHub
gh repo create jan-a-krzywda-page/quantum-learning-machines --public --description "Practical use of noisy quantum devices for data-driven learning, reinforcement learning and generative AI"

# Push to GitHub
cd quantum-learning-machines
git init
git add README.md
git commit -m "Initial commit: Quantum learning machines project overview"
git branch -M main
git remote add origin https://github.com/jan-a-krzywda-page/quantum-learning-machines.git
git push -u origin main
cd ..
```

### 4.6 Spin Qubits Emulator

```bash
# Create repository on GitHub
gh repo create jan-a-krzywda-page/spin-qubit-emulator --public --description "Spin qubit are complex. Lots of data is needed for autonomous tuning and new algorithms dev. Digital twin is needed for that"

# Push to GitHub
cd spin-qubit-emulator
git init
git add README.md
git commit -m "Initial commit: Spin qubits emulator project overview"
git branch -M main
git remote add origin https://github.com/jan-a-krzywda-page/spin-qubit-emulator.git
git push -u origin main
cd ..
```

## Step 5: Automated Setup Script

I've also created an automated script that you can run to set up everything at once. See `setup_github_repos.sh` in this directory.

## Step 6: Verify Setup

After running all commands, you should have:

1. **Main Organization Repository**: `https://github.com/jan-a-krzywda-page/jan-a-krzywda-page`
2. **6 Project Repositories**:
   - `https://github.com/jan-a-krzywda-page/charge-noise-spin-qubits`
   - `https://github.com/jan-a-krzywda-page/machine-learning-quantum`
   - `https://github.com/jan-a-krzywda-page/quantum-feedback-control`
   - `https://github.com/jan-a-krzywda-page/quantum-games`
   - `https://github.com/jan-a-krzywda-page/quantum-learning-machines`
   - `https://github.com/jan-a-krzywda-page/spin-qubit-emulator`

## Troubleshooting

### If GitHub CLI is not installed:
```bash
# macOS
brew install gh

# Then authenticate
gh auth login
```

### If you get permission errors:
Make sure you're authenticated with GitHub:
```bash
gh auth login
```

### If repositories already exist:
You can skip the creation step and just push:
```bash
git remote add origin https://github.com/jan-a-krzywda-page/[repo-name].git
git push -u origin main
```

## Next Steps

After setting up the repositories, you can:

1. **Add individual project repositories** to each project folder's `repos/` subfolder
2. **Update README links** to point to the actual GitHub repository URLs
3. **Add collaborators** to the organization if needed
4. **Set up GitHub Pages** for any project websites

## Organization Settings

Consider configuring these organization settings:

1. **Member privileges**: Set appropriate permissions for collaborators
2. **Repository creation**: Allow members to create repositories if needed
3. **Two-factor authentication**: Require 2FA for organization members
4. **Webhooks**: Set up webhooks for CI/CD if needed
