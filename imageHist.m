function [ h ] = imageHist(f, mode)

switch mode
    case 'n'
        hu = imhist(f);
        MN = size(f);
        h = hu ./ (MN(1) * MN(2));
    case 'u'
        h = imhist(f);
    otherwise
        disp('Not a valid mode. Please input "n" or "u".')
        h = zeros(size(f));
        return;
end
        
end


