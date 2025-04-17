# -*- coding: utf-8 -*-
"""
Created on Wed Apr 16 22:30:43 2025

@author: QH
"""

import numpy as np
from scipy import stats

def Linear_fit(X, Y, confidence=0.95, num_points=100):
    """
    对输入数据进行线性拟合并返回置信带。
    
    参数：
        X, Y: 输入的一维数组
        confidence: 置信水平（如 0.95）
        num_points: x_fit 的点数（默认100）
        
    返回：
        x_fit, y_fit, slope, intercept, r_value, (y_lower, y_upper)
    """
    X = np.array(X)
    Y = np.array(Y)
    
    # 线性回归
    slope, intercept, r_value, p_value, std_err = stats.linregress(X, Y)
    
    # 拟合点
    x_fit = np.linspace(np.min(X), np.max(X), num_points)
    y_fit = intercept + slope * x_fit

    # 置信区间
    N = len(X)
    residuals = Y - (slope * X + intercept)
    s_err = np.sqrt(np.sum(residuals**2) / (N - 2))
    mean_x = np.mean(X)
    t = stats.t.ppf((1 + confidence) / 2., df=N - 2)
    conf_interval = t * s_err * np.sqrt(1/N + (x_fit - mean_x)**2 / np.sum((X - mean_x)**2))
    
    y_upper = y_fit + conf_interval
    y_lower = y_fit - conf_interval

    return x_fit, y_fit, slope, intercept, r_value, (y_lower, y_upper)