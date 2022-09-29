CUDA_VISIBLE_DEVICES=$1

nnUNet_train 2d nnUNetTrainerV2 503 $2 -c --npz