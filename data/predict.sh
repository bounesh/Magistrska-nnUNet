export OUTPUT_FOLDER_MODEL1="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_raw_data_base/Task501-results_3d_fullres"

export FOLDER_WITH_TEST_CASES="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_raw_data_base/nnUNet_raw_data/Task501_Uterus/ImagesTs"

export PATH="/ceph2/grid/home/mpesek/.local/bin:$PATH"

CUDA_VISIBLE_DEVICES=$1

nnUNet_predict -i FOLDER_WITH_TEST_CASES -o OUTPUT_FOLDER_MODEL1 -tr nnUNetTrainerV2 -ctr nnUNetTrainerV2CascadeFullRes -m 3d_fullres -p nnUNetPlansv2.1 -t Task501_Uterus