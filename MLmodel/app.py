import os
import numpy as np
import pandas as pd
import os
from glob import glob
from PIL import Image

from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/') 
def hello_world():
    return 'Hello, World!'

import pickle
import wget
import requests # request img from web
import shutil # save img locally
import urllib.request

@app.route('/predictcancer/<path:imgpath>')
def predict_cancer(imgpath):
    imgpath = requests.get(imgpath, stream = True)
    with open(imgpath,'wb') as f:
        shutil.copyfileobj(imgpath.raw, f)
    pickled_model = pickle.load(open('model.pkl', 'rb'))   
    test_image = np.asarray(Image.open(imgpath).resize((224,224)).convert("RGB"))
    test_image = test_image/255.
    test_image = np.array([test_image])
    res = pickled_model.predict(test_image.reshape(test_image.shape[0],-1))
    if res == 0:
        res = "Negative"
    else:
        res = "Positive"
    return jsonify({'res':res,'file':imgpath})

