#!/bin/bash
# Set bash to 'debug' mode, it will exit on :
# -e 'error', -u 'undefined variable', -o ... 'error in pipeline', -x 'print commands',
set -e
set -u
set -o pipefail

train_set="validated_en"
valid_set="dev_en"
test_set="test_en"

av_hubert_model="large" #select large or base

./asr.sh \
    --lang en \
    --train_set ${train_set} \
    --valid_set ${valid_set} \
    --test_sets ${test_set} \
    --feats_type raw \
    --local_data_opts ${av_hubert_model} \
    --token_type bpe \
    --nbpe 1000 \
    --bpe_train_text "data/${train_set}/text" \
    --use_lm false \
    --asr_config conf/train_avsr_avhubert_${av_hubert_model}.yaml \
    --ngpu 1  "$@"
