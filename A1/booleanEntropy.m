function entropyResult = booleanEntropy( numberY, numberX )
% calculate the entropy of boolean attribute.
    sum = numberY+numberX;
    if numberX == 0
        leftX =0;
    else
        leftX =(numberX/sum)*log2(numberX/sum);
    end
    if numberY == 0
        RightY =0;
    else
        RightY =(numberY/sum)*log2(numberY/sum);
    end
    
    entropyResult = -RightY- leftX;
end

