FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# requirements.txtをコンテナ内のワークディレクトリにコピー
COPY requirements.txt .

# pip を使ってrequirements.txtに記載されたパッケージをインストール
RUN pip install --no-cache-dir -r requirements.txt
