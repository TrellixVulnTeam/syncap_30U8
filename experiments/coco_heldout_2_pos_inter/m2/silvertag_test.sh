#!/bin/bash

DATA_SPLIT="coco_heldout_2_pos_inter"
MODEL_NAME="m2_transformer"
MODEL_ABBR="m2"
MODEL_SUFF=""
SPLIT="test"

PROJ_DIR="$HOME/projects/syncap"
DATA_DIR="$/data/syncap/coco2014"
CAPS_DIR="/data/syncap/compgen/datasets/$DATA_SPLIT"
EXP_DIR="$PROJ_DIR/experiments/$DATA_SPLIT/${MODEL_ABBR}${MODEL_SUFF}"

TOP_FN="$EXP_DIR/outputs/${SPLIT}.beam_100.top_5.json"
OUT_DIR="$EXP_DIR/results"

args="""
  --results-fn $TOP_FN \
	--output-dir $OUT_DIR
"""

source activate /envs/syncap

export PYTHONWARNINGS="ignore"

python $PROJ_DIR/code/tag_results.py $args

conda deactivate
