function [g] = histEqual(f)
    hn= imageHist(f, 'n');
    
    g = histeq(f, hn);
end