# ベースイメージとしてPython 3.6を使用（PyTorch 0.4.1と互換性あり）
FROM python:3.6-slim

# 作業ディレクトリを設定
WORKDIR /app/face_parsing

# 必要なシステムライブラリをインストール
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1-mesa-glx \
    build-essential \
    cmake \
    && apt-get clean

# pipのバージョンを最新にアップグレード
RUN pip install --upgrade pip

# Pythonの依存関係をインストール
RUN pip install --no-cache-dir \
    torch==0.4.1 \
    torchvision==0.2.1 \
    -f https://download.pytorch.org/whl/torch_stable.html \
    numpy \
    pillow \
    opencv-python \
    tensorboardX

# 必要なファイルをコピー
COPY . /app

# デフォルトの実行コマンドを設定（必要に応じて変更）
CMD ["python", "main.py"]