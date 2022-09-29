CUDA_VISIBLE_DEVICES=$1

nnUNet_train 3d_fullres nnUNetTrainerV2 Task503_Uterus $2 -c --npz