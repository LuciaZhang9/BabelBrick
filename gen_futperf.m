function words_futperf = gen_futperf(part_perf,part_perf_pass)

futperf_act = {'erō','eris','erit','erimus','eritis','erint'};
futperf_pass = {' erō',' eris',' erit',' erimus',' eritis',' erunt'};

words_futperf = {[part_perf,char(futperf_act(1))]}; % initialize

% INDICATIVE

    % First act. then pass.

% Active
for i=2:6
    word = [part_perf,char(futperf_act(i))]; 
    words_futperf = {words_futperf{1,:},char(join(word,''))};
end

% Passive (use m. for now)
for i=1:3
    word = [part_perf_pass,'us',char(futperf_pass(i))]; 
    words_futperf = {words_futperf{1,:},word};
end
for i=4:6
    word = [part_perf_pass,'ī', char(futperf_pass(i))]; 
    words_futperf = {words_futperf{1,:},word};
end


end

