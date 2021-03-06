function [list, errors] = visitNode(tree, data)
    errors = 0;
    list = [];
    len = length(data);
    len_tree = length(tree);
    for row = 1:len
        x = data(row).line;
        x_len = length(x);
        x_new = zeros(1,70000);
        y = x(1);
        if x_len >1
            for j = 2:x_len
                x_new(x(j)) = 1;     
            end
        end
        vote = 0;
        for t = 1:len_tree
            curNode = tree(t).node;
            while curNode.value >1
                i = curNode.value;
                if x_new(i-1)
                    curNode = curNode.right1;
                else
                    curNode = curNode.left0;
                end         
            end
            i = curNode.value;
            if i
                vote = vote+1;
            end
        end
        y_predict = -1;
        if vote >(len_tree/2)
            y_predict = 1;
        end
        if y ~= y_predict
            errors = errors+1;
            list(errors) = row;
        end 
    end
end