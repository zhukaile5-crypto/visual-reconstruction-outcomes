# Visual Reconstruction Outcomes

This repository stores the outcomes of our 3D/4D visual reconstruction research conducted within the BlendED project.

At the current preparation stage, the repository contains reconstruction results generated with the Nerfstudio framework, mainly using the Splatfacto method.

## Repository Structure

### `data/custom/`

This folder contains the processed datasets used for reconstruction.

Each scene folder may include:

- Original and downsampled images
- `transforms.json` containing camera parameters and poses
- `sparse_pc.ply` generated during COLMAP preprocessing

### `outputs/`

This folder contains the trained Nerfstudio reconstruction results for each scene.

Each result folder includes:

- `config.yml`
- Trained checkpoint files
- Experiment information

### `web_exports/`

This folder contains Gaussian Splatting models exported as `.ply` files.

These files can be opened with Gaussian Splatting viewers such as SuperSplat for browser-based interactive visualization.

Note that the default camera orientation may differ between viewers. After loading a `.ply` file, rotate the camera until the scene is upright and viewed from the intended direction.

## Run Locally

Detailed instructions for downloading the repository and viewing the trained Nerfstudio models locally are provided in:

[`RUN_LOCAL.md`](RUN_LOCAL.md)

## Online Viewing

The exported `.ply` files in `web_exports/` can be downloaded and opened in a compatible Gaussian Splatting web viewer.

Recommended viewer:

- SuperSplat Editor

## Current Scenes

- `photo_scene1`
- `photo_scene2`
- `photo_scene3`
- `photo_scene4`

## Notes

Git LFS is used to manage large files such as checkpoints, images, point clouds, and exported Gaussian Splatting files.

When cloning the repository, make sure Git LFS is installed and run:

```bash
git lfs pull
