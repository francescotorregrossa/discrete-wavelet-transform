function out = dwt(img)

img = single(img);
[h, w] = size(img);
outw = [];
outh = [];

low = img;
for i = 1:log2(w)
    
    high = (low(1:end, 1:2:end) - low(1:end, 2:2:end)) / 2;
    low = (low(1:end, 1:2:end) + low(1:end, 2:2:end)) / 2;
    outw = [high outw];
    
end
outw = [low outw];

low = outw';
for i = 1:log2(h)
    
    high = (low(1:end, 1:2:end) - low(1:end, 2:2:end)) / 2;
    low = (low(1:end, 1:2:end) + low(1:end, 2:2:end)) / 2;
    outh = [high outh];
    
end
out = [low outh];
out = out';
