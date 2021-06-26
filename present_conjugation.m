function words = present_conjugation(conj,parts,k0,j0,i0,Imp_I)

%Conjugation; Principal parts; Position/Range
%  1 number      4 strings         3 lists

global x;
global y;
global z; 
global blue1; % dark blue
global blue2; % light blue 
global orange1; % dark orange
global orange2; % light orange

words = gen_conjugation(conj,parts);% generate all, present a few; total 120+4

% Total declination number,accumulative
Layer = [0,24,48,60,84,108,120]; % without imperative; total 120

    % grid ploted in main, already
for j=j0 % y, tense ('biggest' unit,i.e.layer)
    for i=i0 % x, mood&voice
        for k=k0 % z, person&number
            %num = num +1;
            num = Layer(j)+6*(i-1)+k;
                i1 = (mod((k-1),3)+2.1)/8; % intensity of dark color; vice versa
                i2 = (mod((j-1),3)+2.1)/8;
                
            if mod(i,2) % passive
                color = blue1*i1 + blue2*i2;
            else
                color = orange1*i1 + orange2*i2;
            end
            
            if (i == 3 || i == 4) && j == 3
                break;
            end
            
            text(x(i)+.5,5.5-y(j),5.5-z(k),words{num},'Color',color,...
                'FontSize',15,'Fontname','Bodoni');
            
            if num > 119
                break;
            end
            
        end
        
        if num > 119
                break;
        end
        
    end
    
    if num > 119
                break;
    end
    
end

Imp_position = [4.5 5.5 4.5
                4.5 5.5 1.5
                5.5 5.5 4.5
                5.5 5.5 1.5];
Imp_color = [blue1;blue2;orange1;orange2];

if Imp_I %imperative, 4
    for num = 1:4
        text(Imp_position(num,1),Imp_position(num,2),Imp_position(num,3),words{num+120},...
            'Color',Imp_color(num,:),'FontSize',15,'Fontname','Bodoni');
    end
end

end

