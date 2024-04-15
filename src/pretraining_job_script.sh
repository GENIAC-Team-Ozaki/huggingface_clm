#!/bin/bash
#SBATCH --partition=g2
#SBATCH --nodes=1
#SBATCH --gpus-per-node=8
#SBATCH --time=06:00:00
#SBATCH --cpus-per-task=12
#SBATCH --job-name=deepspeed_clm_training
#SBATCH --output=/home/ext_ulti4929_gmail_com/huggingface_deepspeed/logs/%j-output-${1}.out
#SBATCH --error=/home/ext_ulti4929_gmail_com/huggingface_deepspeed/logs/%j-error-${1}.err

model_name=$1

# DeepSpeedを使用したトレーニングを開始します
deepspeed --no_local_rank src/${model_name}/run_clm.py config/pretraining.json --deepspeed --deepspeed_config config/ds_config_zero3.json --master_port 33333
