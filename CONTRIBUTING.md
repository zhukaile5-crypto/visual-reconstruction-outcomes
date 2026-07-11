# Contribution Guide

This document explains how collaborators should contribute to this repository.

## 1. Repository Access

Collaborators must first accept the GitHub repository invitation before pushing changes.

Repository:

```text
https://github.com/zhukaile5-crypto/visual-reconstruction-outcomes
```

## 2. Install Git and Git LFS

Git LFS is required because this repository contains large files such as:

- Model checkpoints
- Images
- Point clouds
- Gaussian Splat `.ply` files
- Videos

On Ubuntu or WSL, install Git and Git LFS with:

```bash
sudo apt update
sudo apt install -y git git-lfs
git lfs install
```

## 3. Clone the Repository

Clone the repository:

```bash
git clone https://github.com/zhukaile5-crypto/visual-reconstruction-outcomes.git
cd visual-reconstruction-outcomes
```

Download all Git LFS files:

```bash
git lfs pull
```

Without Git LFS, large files may appear only as small pointer files instead of the actual data.

## 4. Pull the Latest Changes

Before starting any work, update the local repository:

```bash
git checkout main
git pull origin main
git lfs pull
```

This reduces the chance of merge conflicts and ensures that the local copy is up to date.

## 5. Create a New Branch

For code, data, model, documentation, or structural changes, create a separate branch instead of working directly on `main`.

Use the following naming format:

```text
your-name/short-description
```

Example:

```bash
git checkout -b kaile/update-viewer-guide
```

Other examples:

```text
alice/add-new-scene
bob/update-training-script
charlie/fix-readme
```

## 6. Make Changes

Make the required changes locally.

Before committing, check the repository status:

```bash
git status
```

For large files, confirm that they are tracked by Git LFS.

Example:

```bash
git lfs track "*.ckpt"
git lfs track "*.ply"
git lfs track "*.jpg"
git lfs track "*.png"
git lfs track "*.mp4"
```

After changing Git LFS rules, remember to add `.gitattributes`:

```bash
git add .gitattributes
```

## 7. Stage and Commit Changes

Add the modified files:

```bash
git add .
```

Commit them with a clear message:

```bash
git commit -m "Describe the changes clearly"
```

Examples:

```bash
git commit -m "Add reconstruction results for scene 5"
git commit -m "Update local viewer instructions"
git commit -m "Add exported Gaussian Splat files"
```

## 8. Push the Branch

Push the new branch to GitHub:

```bash
git push origin your-name/short-description
```

Example:

```bash
git push origin kaile/update-viewer-guide
```

## 9. Create a Pull Request

Open the repository on GitHub and create a Pull Request from the new branch into `main`.

The Pull Request description should briefly explain:

- What was changed
- Why the change was made
- Which files or folders were modified
- Whether any large files were added
- Whether the changes were tested locally

Example:

```text
This pull request adds the exported Gaussian Splat model for photo_scene5.

Changes:
- Added the processed dataset
- Added the trained checkpoint
- Added the exported PLY file
- Updated the README

The model was tested locally with Nerfstudio Viewer.
```

## 10. Review and Merge

Major changes should be reviewed before merging into `main`.

Please do not merge a Pull Request until:

- The files are complete
- The branch has no unresolved conflicts
- Large files are correctly managed by Git LFS
- The reconstruction or script has been tested
- The documentation has been updated where necessary

## Repository Structure

The main folders are:

```text
data/custom/
```

Contains processed datasets, including images, camera parameters, poses, and sparse point clouds.

```text
outputs/
```

Contains trained Nerfstudio configurations and model checkpoints.

```text
web_exports/
```

Contains exported Gaussian Splat `.ply` files for browser-based or third-party visualization.

```text
RUN_LOCAL.md
```

Contains instructions for downloading and viewing the trained reconstruction results locally.

```text
view.sh
```

Provides a convenient launcher for the existing reconstruction results.

## Important Notes

- Do not commit major changes directly to `main`.
- Pull the latest version before starting new work.
- Use Git LFS for all large binary files.
- Do not upload private, sensitive, or unauthorized data.
- Do not replace another collaborator's results without discussion.
- Keep scene names and directory structures consistent.
- Add documentation when introducing a new scene, model, script, or workflow.
- Do not delete checkpoints or datasets unless the change has been discussed and approved.
- Test scripts and reconstruction results before creating a Pull Request.

## Updating an Existing Branch

If the remote `main` branch changes while you are working, update your branch with:

```bash
git checkout main
git pull origin main
git checkout your-name/short-description
git merge main
```

Resolve any conflicts, then commit and push again:

```bash
git add .
git commit -m "Resolve merge conflicts"
git push origin your-name/short-description
```

## Local Viewing

To view the existing trained reconstructions, follow:

```text
RUN_LOCAL.md
```

A typical workflow is:

```bash
git lfs pull
conda env create -f environment.yml
conda activate nerfstudio
./view.sh 1
```

Keep the terminal running while using the Nerfstudio Viewer.

## Contact

For questions about repository organization, scene naming, model outputs, or large-file management, please discuss them with the project collaborators before making major changes.
