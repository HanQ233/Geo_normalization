# -*- coding: utf-8 -*-
"""
Created on Thu Mar 27 15:44:33 2025

@author: QH
"""

import pandas as pd

# 读取 Excel 文件中的 Sheet1
df = pd.read_excel("标准化值.xlsx", sheet_name="Python读取", index_col=0)

# 保存为 pickle 文件
df.to_pickle("标准化值.pkl")

# 读取 pickle 文件（以后使用）
df = pd.read_pickle("标准化值.pkl")

# 显示前几行数据
print(df.head())