export nnUNet_raw_data_base="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_raw_data_base"

export nnUNet_preprocessed="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_preprocessed"

export RESULTS_FOLDER="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_trained_models"

export PATH="/ceph2/grid/home/mpesek/.local/bin:$PATH"

CUDA_VISIBLE_DEVICES=$1

nnUNet_train 3d_lowres nnUNetTrainerV2 Task500_FV $2 --npz

