function results = analyzePennySurface(Z)
% analyzePennySurface analyzes a 3D penny surface matrix.
%
% Input:
%   Z - matrix containing surface height values
%
% Output:
%   results - structure containing calculated surface information

    results.rows = size(Z, 1);
    results.cols = size(Z, 2);

    results.minHeight = min(Z(:));
    results.maxHeight = max(Z(:));
    results.meanHeight = mean(Z(:));
    results.roughness = std(Z(:));

    % Calculate gradient in x and y directions
    [Gx, Gy] = gradient(Z);

    % Magnitude of gradient
    results.gradientMagnitude = sqrt(Gx.^2 + Gy.^2);

    % Extra useful values
    results.meanGradient = mean(results.gradientMagnitude(:));
    results.maxGradient = max(results.gradientMagnitude(:));
end