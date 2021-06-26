% 3D Synopsis
% test exp: vocō, vocāre, vocāvī, vocātus
% x: 6tense,'r'
% y: 2voice, 3mood, 'b+','b','b-'
% z: 3person, 2number, 'g+','g-'

% Parameters
clc;clear all;
global x;
global y;
global z; 
x = 0:1:5;
y = 0:1:5;
z = 0:1:5;
    % colors
global blue1; % dark blue
global blue2; % light blue 
global orange1; % dark orange
global orange2; % light orange
blue1 = [0 .4 1];
blue2 = [0.3010 0.745 0.933];%[0.3010 0.745 0.933];
orange1 = [.9 .4 .2];
orange2 = [1 .6 .5]; 
    % axis denometers

% stored by x, i.e. tense; then sequence is y first
% test exp
x1 = {'vocō','vocās','vocat','vocāmus','vocātis','vocant'...
    'vocor','vocāris/vocāre','vocātur','vocāmur','vocāminī','vocantur'};

[X,Y,Z] = meshgrid(x,y,z);
grid on;

% Axes & Indices
axis([0 6 0 6 0 6]);
xticks(0.5:1:5.5)
xticklabels({'act.','pass.','act.','pass.','act.','pass.'})
yticks(0.5:1:5.5)
yticklabels({'futperf','pluperf','perf','fut','imperf','pres'})% 注意因为y从左往右所以顺序是反过来的
zticks(0.5:1:5.5)
zticklabels({3,2,1,3,2,1})% 同理
text(-.5,6.5,4.5,'sing.');
text(-.5,6.5,1.5,'pl.');
text(.8,-.5,-.5,'Indic.');
text(2.85,-.5,-.5,'Subj.');
text(4.9,-.5,-.5,'Imp.');

% Ploting texts
% parts exps:
% 1 'vocō','vocāre','vocāvī','vocātus'
% 2 'moveō','movēre','mōvī','mōtus'
% 3 'regō','regere','rēxī','rēctus'
% 3.5 'capiō','capere','cēpī','captus'
% 4 'audiō','audīre','audīvī','audītus'

conj = 3.5;% 1,2,3,3.5,4(where 3.5 = 3 i-stem)
parts = {'capiō','capere','cēpī','captus'};% 4 'eigenvalue's
    % range: z,y,x (point/range)
    % exp1: fut indic. 1:6;   3; 1:2
    % exp2: 3pl.        6; 1:6; 1:4
k0 = [3,6]; % z, person&number, 6
j0 = 2; % y, tense, 6
i0 = [1,3]; % x, mood&voice, 4(exclude Imp)
Imp_I = 1; % show imperative or not

% Title ('eigenvalues')
Dec = {'1^{st}','2^{nd}','3^{rd}','4^{th}'};
    part = char(join(parts,','));
    tit = {Dec{floor(conj)},part};
    titf = (join(tit,': '));
%title([Dec(floor(conj)),[parts(1),',',parts(2),',',parts(3),',',parts(4)]]);
title(titf,'Fontname','Bodoni');

Declination = present_conjugation(conj,parts,k0,j0,i0,Imp_I);
