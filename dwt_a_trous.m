function out = dwt_a_trous(img, k)

img = single(img);
[h, w] = size(img);

out = zeros([h, w, k+1]);
idx = [1, 2, 3];
I = img;
for i = 2:k+1
    
    rows = vect_dwtat(I, idx);
    columns = vect_dwtat(rows', idx);    
    res = padarray(columns, [2^(i-2) 2^(i-2)], 'replicate');
    I_next = (res ./ 16)';
    out(:, :, i-1) = I - I_next;
    I = I_next;
    
    idx = [1, idx(3), 2 * idx(3) - 1];
    
end
out(:, :, end) = I;

end


function W = vect_dwtat(in, idx)

% [~, w] = size(in);
% idx = idx + (0:w-idx(3))';
% W = in(:, idx(:, 1)) + 2 * in(:, idx(:, 2)) + in(:, idx(:, 3));
W = in(:, idx(1):end+1-idx(3)) + 2 * in(:, idx(2):end+1-idx(2)) + in(:, idx(3):end);

end