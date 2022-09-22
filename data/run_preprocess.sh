export nnUNet_raw_data_base="D:\Dokumenti\Magistrska\Magistrska-nnUNet\data\nnUNet_raw_data_base"
export nnUNet_preprocessed="D:\Dokumenti\Magistrska\Magistrska-nnUNet\data\nnUNet_preprocessed"
export RESULTS_FOLDER="D:\Dokumenti\Magistrska\Magistrska-nnUNet\data\nnUNet_trained_models"
export PATH="/ceph2/grid/home/mpesek/.local/bin:$PATH"

CUDA_VISIBLE_DEVICES=$1

nnUNet_plan_and_preprocess -t 503 --verify_dataset_integrity
