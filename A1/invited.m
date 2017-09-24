function b = invited( invited,b ,length )
% if '+', then set as 1.
    for n = 1: length(1)
        if invited(n) == '+'
             b(n,1) = 1;
        end
    end
end

