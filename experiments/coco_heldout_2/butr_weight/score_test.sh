#!/bin/bash

DATA_SPLIT="coco_heldout_2"
MODEL_NAME="BOTTOM_UP_TOP_DOWN_RANKING_WEIGHT"
MODEL_SUFF=""
MODEL_ABBR="butr_weight"
SPLIT="test"
heldout_pairs="brown_dog small_cat white_truck big_plane ride_woman fly_bird"

PROJ_DIR="$HOME/projects/syncap"
DATA_DIR="/science/image/nlp-datasets/emanuele/data/syncap"
EXP_DIR="$PROJ_DIR/experiments/$DATA_SPLIT/${MODEL_ABBR}${MODEL_SUFF}"

RES_FN="$EXP_DIR/outputs/${SPLIT}.re_ranking.beam_100.json"
TOP_FN="$EXP_DIR/outputs/${SPLIT}.re_ranking.beam_100.top_5.json"
TGT_FN="$EXP_DIR/outputs/${SPLIT}.targets.json"
OUT_DIR="$EXP_DIR/results"

ANNS_DIR="$DATA_DIR/coco2014/annotations"
OCC_DIR="$DATA_DIR/compgen/concepts/occurrences"

args="""
  --results-fn $RES_FN \
	--top-results-fn $TOP_FN \
	--targets-fn $TGT_FN \
	--output-dir $OUT_DIR \
	--metrics recall coco \
	--annotations-dir $ANN_DIR \
	--annotations-split val2014 \
	--occurrences-dir $OCC_DIR \
	--heldout-pairs $heldout_pairs
"""

source activate /science/image/nlp-datasets/emanuele/envs/syncap

export PYTHONWARNINGS="ignore"

python $PROJ_DIR/code/score.py $args

conda deactivate
