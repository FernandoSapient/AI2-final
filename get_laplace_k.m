function [ k ] = get_laplace_k
% get_laplace_k - Get laplacian smoothing parameter k

    global laplace_k
    
    if isempty(laplace_k)
        k = 0;
    else
        k = laplace_k;
    end
end

