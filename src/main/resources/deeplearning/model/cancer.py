#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pickle
import joblib
import sys


modelDir = sys.argv[1]
modelDir_Replaced = modelDir.replace("\\", "/", 10)
logreg = joblib.load(modelDir_Replaced) 

from pandas import Series, DataFrame

row_data = {'radius': [],
            'texture': [],
            'perimeter': [],
            'area': [],
            'smoothness': [],
            'compactness': [],
            'concavity': [],
            'symmetry': [],
            'fractal_dimension': [],
            'age': []}
data = DataFrame(row_data)

# 가져온 데이터 넣어줌
new_data = {'radius': sys.argv[2], 'texture' : sys.argv[3], 'perimeter':sys.argv[4], 'area': sys.argv[5], 'smoothness': sys.argv[6], 'compactness': sys.argv[7],
            'concavity': sys.argv[8], 'symmetry': sys.argv[9], 'fractal_dimension': sys.argv[10], 'age': sys.argv[11]}
x_train3 = data.append(new_data, ignore_index=True)

# 데이터 예측 '0이면 악성, 1이면 양성'
prediction2 = logreg.predict(x_train3)
print(prediction2)

