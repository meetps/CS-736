function [ out ] = getPrior( X, x, i, j, M, beta)
    diff_count = 0;
    if M(i - 1, j) == 1
        diff_count = diff_count + (X(i - 1, j) ~= x);
    end;
    if M(i + 1, j) == 1
        diff_count = diff_count + (X(i + 1, j) ~= x);
    end;
    if M(i, j - 1) == 1
        diff_count = diff_count + (X(i, j - 1) ~= x);
    end;
    if M(i, j + 1) == 1
        diff_count = diff_count + (X(i, j + 1) ~= x);
    end;

    out = exp(-diff_count * beta);
end

