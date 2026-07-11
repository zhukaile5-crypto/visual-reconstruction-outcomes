# Run the Reconstruction Locally

This repository contains trained Nerfstudio Splatfacto reconstruction models,
processed datasets, configuration files, and a local viewer launcher.

## Requirements

- Linux, or Windows 11 with WSL2 Ubuntu
- An NVIDIA GPU
- A compatible NVIDIA driver
- Conda
- Git LFS

## 1. Clone the Repository

Install and initialize Git LFS:

    git lfs install

Clone the repository and download the LFS-managed files:

    git clone https://github.com/zhukaile5-crypto/visual-reconstruction-outcomes.git
    cd visual-reconstruction-outcomes
    git lfs pull

## 2. Create the Conda Environment

    conda env create -f environment.yml
    conda activate nerfstudio

Creating the environment for the first time may take several minutes.

## 3. Launch a Reconstruction

Launch scene 1:

    ./view.sh 1

Launch scene 2:

    ./view.sh 2

Launch scene 3:

    ./view.sh 3

Launch scene 4:

    ./view.sh 4

## 4. Open the Viewer

After launching a scene, the terminal will display a local address such as:

    http://127.0.0.1:7007

Open this address in a web browser to view the reconstruction interactively.

Keep the terminal running while using the viewer.

## Troubleshooting

The first launch may take several minutes because CUDA extensions may need
to be compiled.

If the Git LFS files were not downloaded correctly, run:

    git lfs pull

If ns-viewer cannot be found, make sure the Conda environment is active:

    conda activate nerfstudio
