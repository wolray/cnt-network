function AddText(coor,str,size)
txt=text(coor(1)+.475*(coor(2)-coor(1)),coor(3)+.075*(coor(4)-coor(3)),str);
set(txt,'fontsize',size)
