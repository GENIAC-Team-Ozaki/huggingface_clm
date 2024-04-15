# clm_deepspeed
HuggingFaceを利用した事前学習およびFine Tuningの実装コード


- 環境構築
    - ジョブの実行
    - ジョブの確認
    - 各種インストール
- 事前学習
    - Mistral
    - Mixtral
    - Dense
- Fine Tuning
    - Mistral
    - Mixtral
    - Dense
- Tokenizerの変換
    - SentencePiece形式からHuggingFace形式への変換

## 環境構築
- ジョブの実行

```python
srun --partition g2 --nodes=1 --gpus-per-node=1 --time=03:00:00 -c 12 --pty bash -i
```

- ジョブの確認
[ジョブについての説明](https://github.com/matsuolab/ucllm_nedo_prod/blob/main/infra/README.md#cancel-a-job)
```
squeue
```

- 各種インストール
```
wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.10.0-1-Linux-x86_64.sh
bash Miniconda3-py310_23.10.0-1-Linux-x86_64.sh
conda create -n myenv python=3.9
conda activate myenv
conda install nvidia/label/cuda-11.8.0::cuda-toolkit
pip install -r requirements.txt
pip install flash-attn==2.3.4 --no-build-isolation
wandb login
```

## 事前学習
### Mistral
```python
deepspeed --no_local_rank src/mistral/run_clm.py config/pretraining3.json --deepspeed --deepspeed_config config/ds_config_zero3.json --master_port 33333
```

### Mixtral
```python
deepspeed --no_local_rank src/mixtral/run_clm.py config/pretraining3.json --deepspeed --deepspeed_config config/ds_config_zero3.json --master_port 33333
```

### Dense
```python
deepspeed --no_local_rank src/dense/run_clm.py config/pretraining3.json --deepspeed --deepspeed_config config/ds_config_zero3.json --master_port 33333
```


## Fine Tuning
### Mistral

```python
deepspeed --no_local_rank src/mistral/run_clm.py config/fine_tuning.json --deepspeed --deepspeed_config config/ds_config_zero3.json --master_port 33333
```

### Mixtral
```python
deepspeed --no_local_rank src/mixtral/run_clm.py config/fine_tuning.json --deepspeed --deepspeed_config config/ds_config_zero3.json --master_port 33333
```

### Dense
```python
deepspeed --no_local_rank src/dense/run_clm.py config/fine_tuning.json --deepspeed --deepspeed_config config/ds_config_zero3.json --master_port 33333
```


## Tokenizerの変換
### SentencePiece形式からHuggingFace形式への変換
```python
python src/utils/sentencepiece_2_huggingface/convert_sentencepiece_2_huggingface.py --input_tokenizer_file /home/ext_ulti4929_gmail_com/huggingface_deepspeed/data/sentencepiece_tokenizer/ja_wiki_train_0_5_vocab_32000.model --output_tokenizer_dir /home/ext_ulti4929_gmail_com/huggingface_deepspeed/data/huggingface_tokenizer/
```


