function words_imp = gen_IMP(part_act,part_act_short,part2,v1)

words_imp = part_act; % initial
    word = [part_act_short,v1,'te'];
words_imp = {words_imp,char(join(word,''))};
    word = part2;
words_imp = {words_imp{1,:},char(join(word,''))};
    word = [part_act_short,v1,'minī'];
words_imp = {words_imp{1,:},char(join(word,''))};

end

