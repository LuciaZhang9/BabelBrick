function words_perf = gen_perf(part_perf,part_perf_pass)

perf_act = {'ī','istī','it','imus','itis',{'ērunt','ēre'}};
perf_pass = {' sum',' es',' est',' sumus',' estis',' sunt'};
s_perf_act = {'erim','eris','erit','erimus','eritis','erint'};
s_perf_pass = {' sim',' sis','  sit',' sīmus',' sītis',' sint'};

words_perf = {[part_perf,char(perf_act(1))]}; % initialize

% INDICATIVE

    % First act. then pass.

% Active
for i=2:5
    word = [part_perf,char(perf_act(i))]; 
    words_perf = {words_perf{1,:},char(join(word,''))};
end
    perf_act2 = perf_act{6};
    word1 = [part_perf,perf_act2{1}];
    word2 = [part_perf,perf_act2{2}];
    word = [word1,'/',word2]; % i = 6
    words_perf = {words_perf{1,:},char(join(word,''))};

% Passive (use m. for now)
for i=1:3
    word = [part_perf_pass,'us',char(perf_pass(i))]; 
    words_perf = {words_perf{1,:},word};
end
for i=4:6
    word = [part_perf_pass,'ī', char(perf_pass(i))];
    words_perf = {words_perf{1,:},word};
end

% SUBJUNCTIVE

    % First act. then pass.

% Active
for i=1:6
    word = [part_perf,char(s_perf_act(i))]; 
    words_perf = {words_perf{1,:},char(join(word,''))};
end

% Passive (use m. for now)
for i=1:3
    word = [part_perf_pass,'us',char(s_perf_pass(i))]; 
    words_perf = {words_perf{1,:},word};
end
for i=4:6
    word = [part_perf_pass,'ī', char(s_perf_pass(i))];
    words_perf = {words_perf{1,:},word};
end

end

