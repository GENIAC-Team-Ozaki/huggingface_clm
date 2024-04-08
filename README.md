# clm_deepspeed
HuggingFaceを利用した事前学習およびFine Tuningの実装コード

```python
deepspeed --no_local_rank run_clm.py hf_config.json --deepspeed --deepspeed_config ds_config_zero.json
```
