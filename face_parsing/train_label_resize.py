import os
from PIL import Image

# リサイズ対象のフォルダ
input_dir = "./Data_preprocessing/train_label"
output_dir = "./Data_preprocessing/train_label_resized"
os.makedirs(output_dir, exist_ok=True)

# リサイズ後のサイズ
new_size = (64, 64)

# フォルダ内のすべての *.png ファイルを処理
for filename in os.listdir(input_dir):
    if filename.endswith(".png"):
        input_path = os.path.join(input_dir, filename)
        output_path = os.path.join(output_dir, filename)

        # 画像を開いてリサイズ
        with Image.open(input_path) as img:
            resized_img = img.resize(new_size, Image.NEAREST)
            resized_img.save(output_path)

        print(f"Resized {filename} to {new_size}")