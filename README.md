# clm_deepspeed
HuggingFaceを利用した事前学習およびFine Tuningの実装コード

```python
deepspeed --no_local_rank run_clm.py hf_config.json --deepspeed --deepspeed_config ds_config_zero.json
```


* mistral用に書き換えたものを確認
* 通常版をmistral版に揃える
* fine tuning用のjsonファイルと事前学習用のjsonファイルを確認する


## 事前学習
### Mistral

```python
!deepspeed --no_local_rank clm_deepspeed/src/mistral/run_clm.py clm_deepspeed/config/pretraining2.json --deepspeed --deepspeed_config clm_deepspeed/config/ds_config_zero3.json
```

### GPT



## Fine Tuning
