function words_fut = gen_fut(part_act_short,vc,vs,vcs,futx,istem_u)

act = {'m','s','t','mus','tis','nt'};
pass = {'r',{'ris','re'},'tur','mur','minī','ntur'};

% INDICTIVE % fut doesen't have subj.

    % First act. then pass.

% initialize
if ~isempty(cell2mat(futx)) % 1,2       % Needs type conversion, else not desired logical value
    futxtemp1 = [vs,'bō'];
    futxtemp2 = [vs,'bor'];
    futx6 = 'bu';
else % 3,4
    futxtemp1 = 'am';
    futxtemp2 = 'ar';
    futx6 = '';
end

% Active
 
word = [part_act_short,istem_u{1},futxtemp1];% initialize
words_fut = {join(word,'')}; % attach, first time
for i=2:6 % other than expetions
    if i == 2 || i == 4 || i == 5
        word = [part_act_short,vc,futx,char(act(i))]; 
    elseif i == 6
        word = [part_act_short,vcs,futx6,char(act(i))];
    else
        word = [part_act_short,vcs,futx,char(act(i))]; % shortened
    end
        words_fut = {words_fut{1,:},char(join(word,''))};
end

% Passive
word = [part_act_short,istem_u{1},futxtemp2];% initialize
word = {join(word,'')};
words_fut = {words_fut{1,:},word{1,:}};
for i=2:6
    if i == 2 && ~isempty(futx) % 1,2,2nd sing.
        pass2 = pass{2};
        word1 = [part_act_short,vc,'be',pass2{1}];
        word2 = [part_act_short,vc,'be',pass2{2}];
        word = [word1,'/',word2];
    elseif i == 2 % 3,4,2nd sing.
        pass2 = pass{2};
        word1 = [part_act_short,vc,pass2{1}];
        word2 = [part_act_short,vc,pass2{2}];
        word = [word1,'/',word2];
    elseif i == 6
        word = [part_act_short,vcs,futx6,char(pass(i))];
    else 
        word = [part_act_short,vc,futx,char(pass(i))]; 
    end
    words_fut = {words_fut{1,:},char(join(word,''))}; % no first-time issue here
    
end

end

