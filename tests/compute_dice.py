import numpy as np
# import h5py
import nibabel as nib
# import nrrd
import os
import warnings
from medpy.metric import dc
from skimage.measure import label
from contextlib import redirect_stdout

def compute_dice_scores(res, ref):
    mask_res = res > 0
    mask_ref = ref > 0
    if np.sum(mask_res) == 0 and mask_ref.sum() == 0:
        dice = np.nan
    else:
        dice = dc(mask_res, mask_ref)
    return dice, mask_res

def get_largest_CC(seg):
    labels = label(seg)
    assert( labels.max() != 0 ) # assume at least 1 CC
    largestCC = labels == np.argmax(np.bincount(labels.flat)[1:])+1
    return largestCC

folders = ["../data/results_3d_fullres"]
FOLDER = "../data/results_3d_fullres"
GT_FOLDER = "../data/nnUNet_raw_data_base/nnUNet_raw_data/Task503_Uterus/labelsTs"

#for FOLDER in folders:
acc_dice = 0
count = 0
acc_dice_cc = 0

with open(os.path.join(FOLDER,'dice.txt'), 'w') as f:
    with redirect_stdout(f):

        for filename in os.listdir(FOLDER):
            print(filename)
            if filename.endswith(".nii.gz"):
                data_nii = nib.load(os.path.join(FOLDER, filename))
                data = np.array(data_nii.dataobj)
                #segmentation_data, header = nrrd.read('Inner segmentations/seg nrrd/'+filename[:-7]+'.seg.nrrd', "r")
                segmentation_data_nii = nib.load(os.path.join(GT_FOLDER, filename))
                segmentation_data = np.array(segmentation_data_nii.dataobj)
                if segmentation_data.shape != data.shape:
                    warnings.warn("Prediction and ground truth segmentation of {} are not of the same shape.".format(filename[:-15]))
                else:
                    dice, mask_res = compute_dice_scores(data, segmentation_data)
                    mask = mask_res.astype(int)
                    # largest_CC = (get_largest_CC(mask)).astype(int)
                    # nrrd.write(FOLDER + '/' + filename[:-3] + '.seg.nrrd', mask_res.astype(int))
                 #   nrrd.write(FOLDER + '/' + filename[:-3] + '-one-CC.seg.nrrd', largest_CC, header)
                 #    dice_CC, _ = compute_dice_scores(largest_CC, segmentation_data)
                 #    print('{} DICE - {:.4f} - {:.4f}'.format(filename[:-7], dice, dice_CC))
                    print('{} DICE - {:.4f}'.format(filename[:-7], dice))
                    acc_dice += dice
                    # acc_dice_cc += dice_CC
                    count += 1

        # print('AVERAGE DICE {} = {} - {}'.format(FOLDER, acc_dice/count, acc_dice_cc/count))
        print('AVERAGE DICE {} = {}'.format(FOLDER, acc_dice/count))

    # volume_transpose = np.transpose(volume_data,(2,1,0))
    # segmentation_transpose = np.transpose(segmentation_data, (2, 1, 0))
    # # print(volume_data.shape)
    # # print(volume_transpose.shape)
    # # print(segmentation_transpose.shape)
    # # print(segmentation_data.shape)
    #
    # print(filename[:-7])
    # with h5py.File('H5_files/'+filename[:-7]+'.h5', 'w') as hdf:
    #     hdf.create_dataset('data', data=volume_transpose)
    #     hdf.create_dataset('label', data=segmentation_transpose)