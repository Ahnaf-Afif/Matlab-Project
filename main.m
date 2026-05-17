clc;
clear;
close all;

fprintf("Penny Surface Analyzer\n");
fprintf("======================\n\n");

% Load MATLAB official example dataset
data = load("penny.mat");
fieldNames = fieldnames(data);
Z = double(data.(fieldNames{1}));

% Analyze the penny surface
results = analyzePennySurface(Z);

% Create results folder
if ~exist("results", "dir")
    mkdir("results");
end

% Display basic results
fprintf("Surface size: %d x %d\n", results.rows, results.cols);
fprintf("Minimum height: %.2f\n", results.minHeight);
fprintf("Maximum height: %.2f\n", results.maxHeight);
fprintf("Mean height: %.2f\n", results.meanHeight);
fprintf("Surface roughness: %.2f\n\n", results.roughness);

% 3D surface plot
figure;
surf(Z);
shading interp;
colormap parula;
title("3D Surface View of MATLAB Penny Dataset");
xlabel("X Position");
ylabel("Y Position");
zlabel("Height");
colorbar;
exportgraphics(gcf, "results/penny_3d_surface.png", "Resolution", 300);

% 2D heatmap
figure;
imagesc(Z);
axis image;
colormap parula;
title("2D Height Map of Penny Surface");
xlabel("X Position");
ylabel("Y Position");
colorbar;
exportgraphics(gcf, "results/penny_height_map.png", "Resolution", 300);

% Surface gradient map
figure;
imagesc(results.gradientMagnitude);
axis image;
colormap parula;
title("Surface Gradient Magnitude");
xlabel("X Position");
ylabel("Y Position");
colorbar;
exportgraphics(gcf, "results/penny_gradient_map.png", "Resolution", 300);

% Height histogram
figure;
histogram(Z(:), 30);
title("Height Distribution of Penny Surface");
xlabel("Height Value");
ylabel("Frequency");
grid on;
exportgraphics(gcf, "results/penny_height_histogram.png", "Resolution", 300);

fprintf("Analysis complete.\n");
fprintf("Plots saved inside the results folder.\n");