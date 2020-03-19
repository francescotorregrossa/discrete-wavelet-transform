function out = idwt(img)

img = single(img);
[h, w] = size(img);

i = 1;
outw = ones([h, w]) .* img(1:end, i);
length = w;
for l = 1:log2(w)
    
    sub_length = length / 2;
    range = 1:length;

    row = [ones([h, sub_length]) -ones([h, sub_length])];
    for shift = (0:(w/length)-1) * length
        i = i + 1;
        outw(1:end, shift+range) = outw(1:end, shift+range) + row .* img(1:end, i);
    end
    
    length = sub_length;
    
end

i = 1;
outw = outw';
out = ones([h, w]) .* outw(1:end, i);
length = h;
for l = 1:log2(h)
    
    sub_length = length / 2;
    range = 1:length;

    row = [ones([h, sub_length]) -ones([h, sub_length])];
    for shift = (0:(h/length)-1) * length
        i = i + 1;        
        out(1:end, shift+range) = out(1:end, shift+range) + row .* outw(1:end, i);
    end
    
    length = sub_length;
    
end
out = out';

end
