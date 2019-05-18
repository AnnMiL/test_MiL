function y=testNestfun(x)
c = 6;    
b = nfun(x);
    
    
    y = 2*b;
    
    
    
    
    
    function v = nfun(x)
        v = x * c;
    end
end