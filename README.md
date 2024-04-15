# HuggingFace+DeepSpeedの事前学習，Fine Tuningのコード

※2024/4/16...Mistralのみ実行確認済み


- 環境構築
    - ジョブの確認
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
```
# Minicondaのダウンロード
wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.10.0-1-Linux-x86_64.sh

# ダウンロードしたMinicondaの環境作成
bash Miniconda3-py310_23.10.0-1-Linux-x86_64.sh

# 仮想環境作成
conda create -n myenv python=3.9

# 仮想環境に入る
conda activate myenv

# 必要なものをインストール
# 初回のみ以下を実行
conda install nvidia/label/cuda-11.8.0::cuda-toolkit
pip install -r requirements.txt
pip install flash-attn==2.3.4 --no-build-isolation

# wandbにログイン
wandb login
```

- ジョブの確認
[ジョブについての説明](https://github.com/matsuolab/ucllm_nedo_prod/blob/main/infra/README.md#cancel-a-job)
```
# ジョブが実行されている確認
squeue
```


## 事前学習
### Mistral
```python
sbatch src/pretraining_job_script.sh mistral
```

### Mixtral
```python
sbatch src/pretraining_job_script.sh mixtral
```

### Dense
```python
sbatch src/pretraining_job_script.sh dense
```


## Fine Tuning
### Mistral

```python
sbatch src/finetuning_job_script.sh mistral
```

### Mixtral
```python
sbatch src/finetuning_job_script.sh mixtral
```

### Dense
```python
sbatch src/finetuning_job_script.sh dense
```


## Tokenizerの変換
### SentencePiece形式からHuggingFace形式への変換
```python
python src/utils/sentencepiece_2_huggingface/convert_sentencepiece_2_huggingface.py --input_tokenizer_file /home/ext_ulti4929_gmail_com/huggingface_deepspeed/data/sentencepiece_tokenizer/ja_wiki_train_0_5_vocab_32000.model --output_tokenizer_dir /home/ext_ulti4929_gmail_com/huggingface_deepspeed/data/huggingface_tokenizer/
```


