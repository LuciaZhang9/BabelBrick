function words_pluperf = gen_pluperf(part_perf,part_perf_pass)

pluperf_act = {'eram','erās','erat','erāmus','erātis','erant'};
pluperf_pass = {' eram',' erās',' erat',' erāmus',' erātis',' erant'};
s_pluperf_act = {'issem','issēs','isset','issēmus','issētis','issent'};
s_pluperf_pass = {' essem',' essēs',' esset',' essēmus',' essētis',' essent'};

words_pluperf = {[part_perf,char(pluperf_act(1))]}; % initialize

% INDICATIVE

    % First act. then pass.

% Active
for i=2:6
    word = [part_perf,char(pluperf_act(i))]; 
    words_pluperf = {words_pluperf{1,:},char(join(word,''))};
end

% Passive (use m. for now)
for i=1:3
    word = [part_perf_pass,'us',char(pluperf_pass(i))]; 
    words_pluperf = {words_pluperf{1,:},word};
end
for i=4:6
    word = [part_perf_pass,'ī', char(pluperf_pass(i))]; 
    words_pluperf = {words_pluperf{1,:},word};
end

% SUBJUNCTIVE

    % First act. then pass.

% Active
for i=1:6
    word = [part_perf,char(s_pluperf_act(i))]; 
    words_pluperf = {words_pluperf{1,:},char(join(word,''))};
end

% Passive (use m. for now)
for i=1:3
    word = [part_perf_pass,'us',char(s_pluperf_pass(i))]; 
    words_pluperf = {words_pluperf{1,:},word};
end
for i=4:6
    word = [part_perf_pass,'ī', char(s_pluperf_pass(i))]; 
    words_pluperf = {words_pluperf{1,:},word};
end

end

