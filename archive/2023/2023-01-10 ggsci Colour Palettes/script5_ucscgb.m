clc, clear, close all

mypal = ["FF0000"; "FF9900"; "FFCC00"; "00FF00"; "6699FF";
    "CC33FF"; "99991E"; "999999"; "FF00CC"; "CC0000";
    "FFCCCC"; "FFFF00"; "CCFF00"; "358000"; "0000CC";
    "99CCFF"; "00FFFF"; "CCFFFF"; "9900CC"; "CC99FF";
    "996600"; "666600"; "666666"; "CCCCCC"; "79CC3D";
    "CCCC99"];

mypal = arrayfun(@(x)hex2rgb(x), mypal, 'UniformOutput', false);
mypal = cat(1, mypal{:});

figure
axes
surf(peaks(37))
colormap(mypal)
colorbar

mypal
