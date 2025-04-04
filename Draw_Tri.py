import matplotlib.pyplot as plt
#默认边长side=1, 高high = √3/2 = 0.866
vertices = {'Top': (0, 0.866), 'Left': (-0.5, 0), 'Right': (0.5, 0)}
#三角座标归一化，并转换xy坐标
def Ternary_to_xy(P_Top, P_Left, P_Right): #顺序为Top Left Right
    P_Top_norm = P_Top / (P_Top+P_Left+P_Right)
    P_Left_norm = P_Left / (P_Top+P_Left+P_Right)
    P_Right_norm = P_Right / (P_Top+P_Left+P_Right)
    x = 0.5 * (P_Right_norm - P_Left_norm) # ​x = (Ca-Na)*0.5  
    y = P_Top_norm * 0.866 # y= K*√3/2 即0.866 
    return x, y # 引用时用 x1,y1 = Ternary_to_xy(xxx,xxx,xxx) 按Top Left Right给三个数即可，不用先归一化

def Draw_K_Na_Ca(ax):
    triangle = plt.Polygon([vertices['Top'],vertices['Left'],vertices['Right']], edgecolor='k', linewidth = 0.5,fill=None)
    ax.add_patch(triangle)    
    pointstexts = [(0, 0.9, 'K'),(-0.53, 0.02, 'Na'),(0.53, 0.02, 'Ca')]
    for x, y, label in pointstexts:
        ax.text(x, y, label, fontsize=20, ha='center', va='center')
    ax.set(xlim=(-0.5,0.5), ylim=(-0.01,1), box_aspect=1)
    ax.axis('off') 
    
def Draw_An_Ab_Or(ax):
    triangle = plt.Polygon([vertices['Top'],vertices['Left'],vertices['Right']], edgecolor='k', linewidth = 0.5,fill=None)
    ax.add_patch(triangle)
    field_bound = {'P1':(30,70,0),'P2':(20,60,20),'P3':(33.33,46.67,20),'P4':(17.65,57.65,24.71),
                        'P5':(15.24,50.01,34.75),'P6':(27.08,37.92,35),'P7':(0,70,30),} #字典：An Ab Or的值
    Points = ['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P7']
    coords = {p: Ternary_to_xy(*field_bound[p]) for p in Points} #前面加*变显式
    X1, Y1 = coords['P1']; X2, Y2 = coords['P2'];X3, Y3 = coords['P3']
    X4, Y4 = coords['P4'];X5, Y5 = coords['P5'];X6, Y6 = coords['P6']; X7, Y7 = coords['P7']
    ax.plot([X1,X4],[Y1,Y4],'k',[X4,X5],[Y4,Y5],'k',[X5,X6],[Y5,Y6],'k',[X2,X3],[Y2,Y3],'k',[X4,X7],[Y4,Y7],'k',)
    ax.text(-0.35,0.02,'trondhjemite', fontsize=20, rotation=0,ha='center', va='center') 
    ax.text(-0.25,0.32,'tonalite', fontsize=20, rotation=60,ha='center', va='center')
    ax.text(-0.08,0.28,'granodiorite', fontsize=20, rotation=60,ha='center', va='center')            
    pointstexts = [(0, 0.9, 'An'),(-0.53, 0.02, 'Ab'),(0.53, 0.02, 'Or'),(0.25,0.15,'granite')]
    for x, y, label in pointstexts:
        ax.text(x, y, label, fontsize=20, ha='center', va='center')
    
    ax.set(xlim=(-0.5,0.5), ylim=(-0.01,1), box_aspect=1)
    ax.axis('off') 