#!/bin/bash --login
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J activate-conda
#SBATCH -o /home/bonese/log/activate-conda-%J.out
#SBATCH -e /home/bonese/log/activate-conda-%J.err
#SBATCH --mail-type=ALL
#SBATCH --time=24:00:00
#SBATCH --mem=8GB
#SBATCH --gres=gpu:1
#SBATCH --constraint=[gpu]

# define some environment variables
PROJECT_DIR="$PWD"
ENV_PREFIX="$PROJECT_DIR"/env

# activate the conda environment
module purge
conda init "$ENV_PREFIX"

# conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
# pip install -e .