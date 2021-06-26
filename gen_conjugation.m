function words = gen_conjugation(conj,parts)

% Words |  Conjugation; Principal parts
% Cell  |    1 number      4 strings

% % Endings lib
% 
% %   Indic.
%     % as imperf,'ō' as exception
% act = {'m','s','t','mus','tis','nt'};
%     % as imperf,'ō' as exception; 2nd sing: 2 possiblities
% pass = {'r',{'ris','re'},'tur','mur','minī','ntur'};
%     % 3rd pl: 2 possiblities
% perf_act = {'ī','istī','it','imus','itis',{'ērunt','ēre'}};
% pluperf_act = {'eram','erās','erat','erāmus','erātis','erant'};
% futperf_act = {'erō','eris','erit','erimus','eritis','erint'};
%      % the perfs: "add as seperate word"
% perf_pass = {' sum',' es',' est',' sumus',' estis',' sunt'};
% pluperf_pass = {' eram',' erās',' erat',' erāmus',' erātis',' erant'};
% futperf_pass = {' erō',' eris',' erit',' erimus',' eritis',' erunt'};
% 
% %   Subj.      % all(has 4 tenses only), use s denote
%     % (for programming simplicity, dont further decompose)
%     % thus can directly with part_act combine
% s_imperf_act = {'rem','rēs','ret','rēmus','rētis','rent'};
%     % 2nd sing: 2 possiblities
% s_imperf_pass = {'rer',{'rēris','rēre'},'rētur','rēmur','rēminī','rentur'};
% s_perf_act = {'erim','eris','erit','erimus','eritis','erint'};
% s_pluperf_act = {'issem','issēs','isset','issēmus','issētis','issent'};
%     % the perfs: "add as seperate word"
% s_perf_pass = {' sim',' sis','  sit',' sīmus',' sītis',' sint'};
% s_pluperf_pass = {' essem',' essēs',' esset',' essēmus',' essētis',' essent'};
% 
% 
% % Infix lib
% 
% %   Indic.    % use x to denote infix
% imperfx = 'bā';
% fut_12x = 'bi';
% pluperfx = 'erā';
% futperfx = 'eri';
% 
% %   Subj.
% s_perf_actx = 'eri';
% s_pluperf_actx = 'issē';


% 'Stem' extraction

part_1         = parts{1};

part2          = parts{2}; % vocāre
len            = length(part2); % 6
part_act       = part2(1:len-2); % vocā
part_act_short = part2(1:len-3); % voc(both useful)

part3          = parts{3}; % vocāvī
len            = length(part3); % 6
part_perf      = part3(1:len-1); % vocāv

part4          = parts{4}; % vocātus % could use directly, before m/n/f considered
len = length(part4); % 7
part_perf_pass = part4(1:len-2); % vocāt


% Changes @conj
% Conjugation select

    % pres
conjvowel_long = {'ā','ē','i','ī'}; % 3.5 uses 3
conjvowel_short = {'a','e','i','i'}; % 3.5 uses 4
conjvowel_long_subj = {'ē','eā','ā','iā'}; % 3.5 uses 4
conjvowel_short_subj = {'e','ea','a','ia'}; 
istem_u = {{{''},'a'},{'','e'},{'','u'},{'i','iu'}}; % designed for 1st sing & 3rd pl; 3.5 uses 4
    % imperf
stemvowel_change = {'ā','ē','ē','iē'}; % 3.5 uses 4; real change or no change merged
    % fut
futx = {'bi','bi','',''};
stemvowel_change_short = {'ā','ē','e','ie'}; %only for 3,4

v1 = conjvowel_long;
v2 = conjvowel_short; % for programming simplicity
v3 = conjvowel_long_subj;
v4 = conjvowel_short_subj;
vc = stemvowel_change;
vc_short = stemvowel_change_short;
vs = {'ā','ē','e','ī'}; % original stem;  3.5 uses 3

% by Layer yz (except Imp., thus max j = 4)
    % floor: 3.5 -> 3; ceil: 3.5 -> 4
pres    = gen_pres   (part_1,part_act_short,v1(floor(conj)),v2(ceil(conj)),...
                            v3(ceil(conj)),v4(ceil(conj)),istem_u{ceil(conj)},vs(floor(conj)));
imperf  = gen_imperf (part_act_short,vc(ceil(conj)),vs(floor(conj)));
fut     = gen_fut    (part_act_short,vc(ceil(conj)),vs(floor(conj)),...
                      vc_short(ceil(conj)),futx(floor(conj)),istem_u{ceil(conj)});
perf    = gen_perf   (part_perf,part_perf_pass);
pluperf = gen_pluperf(part_perf,part_perf_pass);
futperf = gen_futperf(part_perf,part_perf_pass);
IMP     = gen_IMP    (part_act,part_act_short,part2,v1(floor(conj)));% number prob

words = {pres{1,:},imperf{1,:},fut{1,:},perf{1,:},pluperf{1,:},futperf{1,:},IMP{1,:}};

end

