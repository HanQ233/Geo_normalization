import matplotlib.pyplot as plt

plt.rcParams.update({  # 用.update可以一次设置很多参数。
#figure
    'figure.dpi': 100.0,  # 放大倍数，不要动
    'figure.autolayout': False,
    'figure.constrained_layout.h_pad': 0.2,
    'figure.constrained_layout.hspace': 0.02,
    'figure.constrained_layout.w_pad': 0.2,
    'figure.constrained_layout.wspace': 0.02,
    'figure.subplot.hspace': 0.01,
    'figure.subplot.wspace': 0.18,
    'figure.subplot.left': 0.05,
    'figure.subplot.right': 0.97,
    'figure.subplot.top': 1,
    'figure.subplot.bottom': 0.03,
#Pdf 矢量文字
    'pdf.fonttype': 42,
    'ps.fonttype': 42,  
#字体
    'font.family': ['Arial'],
    'font.size': 10,
#坐标轴
    "axes.linewidth": 0.5,
    'axes.labelsize': 20,
    "lines.linewidth": 0.5, #控制scatter描边粗细，太细显示的不好看
    "lines.markersize": 15,
    "lines.markeredgewidth": 0.5,
    "xtick.minor.visible": True,
    "ytick.minor.visible": True,
    "xtick.major.size": 8,
    "ytick.major.size": 8,
    "xtick.minor.size": 4,
    "ytick.minor.size": 4,
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

