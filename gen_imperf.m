function words_imperf = gen_imperf(part_act_short,vc,vs)
    % if conj = 3 or 3.5 or 4, indic. actual stem vowel change

act = {'m','s','t','mus','tis','nt'};
pass = {'r',{'ris','re'},'tur','mur','minī','ntur'};
imperfx = 'bā';
imperf_shortx = 'ba';
s_imperf_act = {'rem','rēs','ret','rēmus','rētis','rent'};
s_imperf_pass = {'rer',{'rēris','rēre'},'rētur','rēmur','rēminī','rentur'};

% INDICTIVE

    % First act. then pass.
    
% Active
for i=1:6 % other than expetions
    if i == 2 || i == 4 || i == 5
        word = [part_act_short,vc,imperfx,char(act(i))]; 
    else
        word = [part_act_short,vc,imperf_shortx,char(act(i))]; % i=1 also here
    end
    if i == 1
        words_imperf = {char(join(word,''))}; % attach, first time
    else
        words_imperf = {words_imperf{1,:},char(join(word,''))};
    end
end

% Passive
for i=1:6
    if i == 2 % merge into one here
        pass2 = pass{2};
        word1 = [part_act_short,vc,imperfx,pass2{1}];
        word2 = [part_act_short,vc,imperf_shortx,pass2{2}];
        word = [word1,'/',word2];
    elseif  i == 1 || i == 6 % note that sequence different from active
        word = [part_act_short,vc,imperf_shortx,char(pass(i))]; 
    else
        word = [part_act_short,vc,imperfx,char(pass(i))];
    end
    words_imperf = {words_imperf{1,:},char(join(word,''))}; % no first-time issue here
    
end

% SUBJUNCTIVE

    % First act. then pass.
    
% Active
for i=1:6 % other than expetions
    if i == 2 || i == 4 || i == 5
        word = [part_act_short,vs,char(s_imperf_act(i))]; 
    else
        word = [part_act_short,vs,char(s_imperf_act(i))]; % i=1 also here
    end
    words_imperf = {words_imperf{1,:},char(join(word,''))};
    
end

% Passive
for i=1:6
    if i == 2 % merge into one here
        pass2 = s_imperf_pass{2};
        word1 = [part_act_short,vs,pass2{1}];
        word2 = [part_act_short,vs,pass2{2}];
        word = [word1,'/',word2];
    elseif  i == 1 || i == 6 % note that sequence different from active
        word = [part_act_short,vs,char(s_imperf_pass(i))]; 
    else
        word = [part_act_short,vs,char(s_imperf_pass(i))];
    end
    words_imperf = {words_imperf{1,:},char(join(word,''))}; % no first-time issue here
    
end

end

