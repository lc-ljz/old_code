import torch

# Model
model = torch.hub.load('ultralytics/yolov5', 'yolov5x')# or yolov5m, yolov5l, yolov5x, custom

# Images
# or file, Path, PIL, OpenCV, numpy, list
img = r'F:\pythonProject\DeblurGAN\results\experiment_name\test_latest\images\803_fake_B.png'

# Inference
results = model(img)

# Results
results.print()