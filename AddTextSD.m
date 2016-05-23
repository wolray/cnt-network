function AddTextSD(coor,size,str)
source=text(coor(1)-2,(coor(3)+coor(4))/2,'Source');
drain=text(coor(2)+.5,(coor(3)+coor(4))/2,'Drain');
txt=text(coor(1)+.475*(coor(2)-coor(1)),coor(3)-.05*(coor(4)-coor(3)),str);
set(source,'fontsize',size)
set(drain,'fontsize',size)
set(txt,'fontsize',size)
