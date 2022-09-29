CUDA_VISIBLE_DEVICES=$1

nnUNet_train 3d_cascade_fullres nnUNetTrainerV2CascadeFullRes Task503_Uterus $2 --npz

