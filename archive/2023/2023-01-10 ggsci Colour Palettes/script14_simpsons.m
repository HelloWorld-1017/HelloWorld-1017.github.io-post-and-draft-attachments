clc, clear, close all

mypal = ["FED439"; "709AE1"; "8A9197";
    "D2AF81"; "FD7446"; "D5E4A2"; "197EC0"; "F05C3B";
    "46732E"; "71D0F5"; "370335"; "075149"; "C80813";
    "91331F"; "1A9993"; "FD8CC1"];

mypal = arrayfun(@(x)hex2rgb(x), mypal, 'UniformOutput', false);
mypal = cat(1, mypal{:});

figure
axes
surf(peaks(37))
colormap(mypal)
colorbar

mypal