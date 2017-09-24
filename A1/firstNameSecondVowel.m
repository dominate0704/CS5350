function b = firstNameSecondVowel( FirstName, b )
% Is the second letter of their first name a vowel
vowel = ['a','e','i','o','u'];
    for n = 1: length(b)
        str = FirstName(n,1);
        c = char(str);
       if  length(c)>1 && sum(ismember(c(2),vowel)) 
           b(n,6) = 1;
       end
    end
end