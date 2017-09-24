function b=  haveMiddleName( LastName, Name2, len, b )
% if this column has middleName then return 1.
    for n = 1: len
        if strcmp(LastName(n,1),Name2(n,1)) == 0
                b(n,3) = 1;
        end
    end
end
