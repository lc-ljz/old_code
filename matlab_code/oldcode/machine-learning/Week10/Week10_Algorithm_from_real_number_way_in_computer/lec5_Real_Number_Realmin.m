clear; close all; clc;
% realmin 比realmax要简单一些
help realmin
% 注意说明： 最小标准正浮点数
2^(-1022) == realmin
% 非标准正浮点数， 就是E(y) = 0的时候， 见实数2.png
% 所以最小的实数是 
fprintf("最小的实数并非realmin, 而是realmin*2^(-52)\n");
fprintf("最小的实数: %.20e\n", realmin*2^(-52));
% 你可以改变 15e中的15, 但前面 . 注意保留
% 比如改变成 128, 312，还有 %.e, %.e你看到0， 但实际不是0
% 证明: realmin*2^(-52) == 0 看返回什么
% 尝试输出 realmin*2^(-53)
% 再尝试确认  realmin*2^(-53) == 0