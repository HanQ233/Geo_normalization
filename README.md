# 常用标准化值、数据集等
## 示例
url = 'https://github.com/HanQ233/Geo_normalization/raw/main/Normal_Value.mat';
websave('Normal_Value.mat', url);
N = load('Normal_Value.mat');
S1=table2array(N.C_REE);%读取REE球粒陨石标准化
