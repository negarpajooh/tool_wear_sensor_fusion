function xN = Normalize_Fcn(x,MinX,MaxX)
% xN = (x - MinX) / (MaxX - MinX) * 2 - 1;
% xN =x ./ abs(MaxX - MinX);
xN =x ./MaxX;
end