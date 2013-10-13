function[trueOrFalse] = theSame(vector)
    flag1 = true;
    for x = 2 : length(vector)
        if vector(1) == vector(x)
            flag2 = true;
        else
            flag2 = false;
        end
        flag1 = flag1 && flag2;
    end
    trueOrFalse = flag1;
end