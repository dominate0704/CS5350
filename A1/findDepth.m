function depth = findDepth(node, depth)
    if node.value-'1'< 1
        depth = 1;
    else
        depthLeft = findDepth(node.left0, depth)+1;
        depthRight = findDepth(node.right1, depth)+1;
        if depth<depthLeft
            if depthLeft < depthRight
                depth = depthRight;
            else 
                depth = depthLeft;
            end
        end
    end
end