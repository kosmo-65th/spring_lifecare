#!/usr/bin/env python
# coding: utf-8

# In[2]:


import tensorflow as tf
import keras
import numpy as np
from matplotlib import pyplot as plt
from keras.preprocessing.image import ImageDataGenerator
import sys


# In[4]:

modelDir = sys.argv[1]
modelDir_Replaced = modelDir.replace("\\", "/", 10)
model = tf.keras.models.load_model(modelDir_Replaced)
#model = tf.keras.models.load_model(r'D:\pythonWorkspace\COVID_DATA\COVID-test\model/nasNet4.h5')

TestImgDir = sys.argv[2]
TestImgDir_Replaced = TestImgDir.replace("\\", "/", 10)

img = keras.preprocessing.image.load_img(
    TestImgDir_Replaced, target_size=(224, 224)
)

input_arr = keras.preprocessing.image.img_to_array(img)
input_arr = np.array([input_arr])/255  # Convert single image to a batch.

#print(input_arr)

# 이미지 제대로 들어갔는지 확인
#plt.imshow(input_arr[0])

predictions=model.predict(input_arr)
print(predictions)


# In[ ]:




