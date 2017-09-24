function list = visitNode(node, Data)
    errors = 0;
    list = [];
    len = length(Data);
    for row = 1:len(1)
        curNode = node;
        while curNode.value-'1'>0
            i = str2num(curNode.value);
            if Data(row,i-1)
                curNode = curNode.right1;
            else
                curNode = curNode.left0;
            end         
        end
        i = str2num(curNode.value);
        if Data(row,7) ~= i
            errors = errors+1;
            list(errors) = row;
        end
    end

%     if node.value-'1'>0
%         listLeft = list;
%         listRight = list;
%         listLeft(level) = 0;
%         listRight(level) = 1;
%         i = str2num(node.value);
%         distance = 2^(6-level);
%         startpoint = 0;
%         for j = 1:level
%             startpoint = startpoint + listRight(j)*2^(6-j);
%         end
%         if(level == 6)
%             newData(startpoint+1, i-1) = 1;
%         else
%             newData(startpoint+1:startpoint+distance, i-1) = 1;
%         end     
%         newData = visitNode(node.left0,level+1, listLeft, newData);
%         nodetrack = node;
%         nodetrack.right1 = node.right1;
%         nodetrack.left0 = node.left0;
%         newData = visitNode(node.right1,level+1, listRight, newData);      
%     else
%         i = str2num(node.value);
%         startpoint = 0;
%         if level == 7
%             for j = 1:level-1
%                 startpoint = startpoint + list(j)*2^(6-j);
%             end
%             newData(startpoint+1, level) =i;
%         else        
%     end
end