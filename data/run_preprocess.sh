export nnUNet_raw_data_base="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_raw_data_base"

export nnUNet_preprocessed="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_preprocessed"

export RESULTS_FOLDER="/ceph2/grid/home/mpesek/cell/nnunet/nnUNet_trained_models"

export PATH="/ceph2/grid/home/mpesek/.local/bin:$PATH"

CUDA_VISIBLE_DEVICES=$1

nnUNet_plan_and_preprocess -t 503 --verify_dataset_integrity
