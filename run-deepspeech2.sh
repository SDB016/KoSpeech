# -*- coding: utf-8 -*-
# Soohwan Kim, Seyoung Bae, Cheolhwang Won.
# @ArXiv : KoSpeech: Open-Source Toolkit for End-to-End Korean Speech Recognition
# This source code is licensed under the Apache 2.0 License license found in the
# LICENSE file in the root directory of this source tree.

ARCHITECTURE='deepspeech2'
DATASET='kspon'
DATASET_PATH='your_dataset_path'
TRANSCRIPTS_PATH='../data/transcripts.txt'
OUTPUT_UNIT='character'
OPTIMIZER='adam'
AUDIO_EXTENSION='pcm'
BATCH_SIZE=32
NUM_WORKERS=4
NUM_EPOCHS=70
HIDDEN_DIM=1024
DROPOUT=0.3
NUM_ENCODER_LAYERS=5
RNN_TYPE='gru'
MAX_LEN=400
MAX_GRAD_NORM=400
WEIGHT_DECAY=1e-05
INIT_LR=3e-04
PEAK_LR=3e-04
FINAL_LR=1e-06
INIT_LR_SCALE=0.01
FINAL_LR_SCALE=0.05
WARMUP_STEPS=0
FRAME_LENGTH=20
FRAME_SHIFT=10
SAMPLE_RATE=16000
N_MELS=80
FEATURE_EXTRACT_BY='kaldi'        # You can set 'librosa', 'torchaudio'
TRANSFORM_METHOD='fbank'          # Support feature : spect, mel, mfcc, fbank
ACTIVATION='hardtanh'             # Support activation : ReLU, ELU, Hardtanh, GELU, LeakyReLU
FREQ_MASK_PARA=18
TIME_MASK_NUM=4
FREQ_MASK_NUM=2
SAVE_RESULT_EVERY=1000
CHECKPOINT_EVERY=5000
PRINT_EVERY=10
MODE='train'

# shellcheck disable=SC2164
cd bin
echo "KoSpeech: Open-Source Toolkit for End-to-End Korean Speech Recognition =="

python ./main.py --batch_size $BATCH_SIZE --num_workers $NUM_WORKERS --num_epochs $NUM_EPOCHS --use_bidirectional \
--transcripts_path $TRANSCRIPTS_PATH --dataset $DATASET --audio_extension $AUDIO_EXTENSION --output_unit $OUTPUT_UNIT \
--optimizer $OPTIMIZER --spec_augment --use_cuda --hidden_dim $HIDDEN_DIM --dropout $DROPOUT \
--transform_method $TRANSFORM_METHOD --architecture $ARCHITECTURE \
--num_encoder_layers $NUM_ENCODER_LAYERS --rnn_type $RNN_TYPE \
--sample_rate $SAMPLE_RATE --frame_length $FRAME_LENGTH --frame_shift $FRAME_SHIFT --n_mels $N_MELS --normalize --del_silence \
--feature_extract_by $FEATURE_EXTRACT_BY --freq_mask_para $FREQ_MASK_PARA \
--time_mask_num $TIME_MASK_NUM --freq_mask_num $FREQ_MASK_NUM --save_result_every $SAVE_RESULT_EVERY \
--checkpoint_every $CHECKPOINT_EVERY --print_every $PRINT_EVERY \
--init_lr $INIT_LR --final_lr $FINAL_LR --peak_lr $PEAK_LR --init_lr_scale $INIT_LR_SCALE --final_lr_scale $FINAL_LR_SCALE \
--mode $MODE --dataset_path $DATASET_PATH \
--max_grad_norm $MAX_GRAD_NORM --warmup_steps $WARMUP_STEPS --max_len $MAX_LEN \
--weight_decay $WEIGHT_DECAY --activation $ACTIVATION
