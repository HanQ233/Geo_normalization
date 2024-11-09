import matplotlib.pyplot as plt

plt.rcParams.update({  # 用.update可以一次设置很多参数。
#figure
    'figure.dpi': 100.0,  # 放大倍数，不要动
    'figure.autolayout': True,
    'figure.constrained_layout.h_pad': 0.2,
    'figure.constrained_layout.hspace': 0.02,
    'figure.constrained_layout.w_pad': 0.2,
    'figure.constrained_layout.wspace': 0.02,
#字体
    'font.family': ['Arial'],
    'font.size': 10,
#坐标轴
    "axes.linewidth": 0.5,
    'axes.labelsize': 20,
    "lines.linewidth": 0.5,
    "lines.markersize": 15,
    "lines.markeredgewidth": 0.5,
    "xtick.minor.visible": True,
    "ytick.minor.visible": True,
    "xtick.major.size": 5,
    "ytick.major.size": 5,
    "xtick.major.pad": 7,  # 间距
    "ytick.major.pad": 7,  # 间距
    "xtick.labelsize": 20,
    "ytick.labelsize": 20,
    "xtick.direction": 'in',
    "ytick.direction": 'in',
    "xtick.major.width": 0.5,
    "ytick.major.width": 0.5,
    "xtick.minor.width": 0.5,
    "ytick.minor.width": 0.5
#图例
})

