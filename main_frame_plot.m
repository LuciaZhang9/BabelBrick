function main_frame_plot(conj,parts)
global x;
global y;
global z;
figure()
meshgrid(x,y,z);
% [caz,cel] = view([-5 -5 6]); % camera angle
grid on;

axis([0 6 0 6 0 6]);
xticks(0.5:1:5.5)
xticklabels({'act.','pass.','act.','pass.','act.','pass.'})
yticks(0.5:1:5.5)
yticklabels({'futperf','pluperf','perf','fut','imperf','pres'})
zticks(0.5:1:5.5)
zticklabels({3,2,1,3,2,1})
text(-.5,6.5,4.5,'sing.');
text(-.5,6.5,1.5,'pl.');
text(.8,-.5,-.5,'Indic.');
text(2.85,-.5,-.5,'Subj.');
text(4.9,-.5,-.5,'Imp.');

Dec = {'1^{st}','2^{nd}','3^{rd}','4^{th}'};
part = char(join(parts,','));
tit = {Dec{floor(conj)},part};
titf = (join(tit,': '));
title(titf,'Fontname','Bodoni');
end