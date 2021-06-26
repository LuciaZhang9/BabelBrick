function words_pres = gen_pres(part_1,part_act_short,conjvowel_long,conjvowel_short,...
                                conjvowel_long_subj,conjvowel_short_subj,istem_u,vs)
    % if conj = 3 or 3.5 or 4, indic. actual stem vowel change
    
act = {'m','s','t','mus','tis','nt'};
pass = {'r',{'ris','re'},'tur','mur','minī','ntur'};

% INDICATIVE

    % First act. then pass.

% Active
words_pres = part_1; % initialize
for i=2:6 % other than expetions
    if i == 2 || i == 4 || i == 5
        word = [part_act_short,conjvowel_long,char(act(i))]; 
    elseif i == 6
        word = [part_act_short,istem_u{2},char(act(i))];
    else
        word = [part_act_short,conjvowel_short,char(act(i))];
    end
    if i == 2
        words_pres = {words_pres,char(join(word,''))}; % attach, first time
    else
        words_pres = {words_pres{1,:},char(join(word,''))};
    end
end

% Passive
for i=1:6
    if i == 2 % merge into one here
        pass2 = pass{2};
        word1 = [part_act_short,vs,pass2{1}];
        word2 = [part_act_short,vs,pass2{2}];
        word = [word1,'/',word2];
    elseif i == 1
        word = [part_act_short,istem_u{1},'o',char(pass(i))]; 
    elseif i == 6 % note that sequence different from active
        word = [part_act_short,istem_u{2},char(pass(i))]; 
    else
        word = [part_act_short,conjvowel_long,char(pass(i))];
    end
    words_pres = {words_pres{1,:},char(join(word,''))}; % no first-time issue here
    
end

% SUBJUNCTIVE

    % First act. then pass.

% Active
for i=1:6 
    if i == 2 || i == 4 || i == 5
        word = [part_act_short,conjvowel_long_subj,char(act(i))]; 
    else
        word = [part_act_short,conjvowel_short_subj,char(act(i))];
    end
    words_pres = {words_pres{1,:},char(join(word,''))};
    
end

% Passive
for i=1:6
    if i == 2 % merge into one here
        pass2 = pass{2};
        word1 = [part_act_short,conjvowel_long_subj,pass2{1}];
        word2 = [part_act_short,conjvowel_long_subj,pass2{2}];
        word = [word1,'/',word2];
    elseif  i == 1 || i == 6 % note that sequence different from active
        word = [part_act_short,conjvowel_short_subj,char(pass(i))]; 
    else
        word = [part_act_short,conjvowel_long_subj,char(pass(i))];
    end
    words_pres = {words_pres{1,:},char(join(word,''))}; % no first-time issue here
    
end

end

