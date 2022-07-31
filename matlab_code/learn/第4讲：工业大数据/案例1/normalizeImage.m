% function res = normalizeImage(img,varargin)
function res = normalizeImage(img) 
% if (length(varargin) >= 1)
%     range = varargin{1};
% else range = [0,1]; end
%  
% if ((range(1) == 0) && (range(2) == 0))
%   res = img;
%   return;
% end
img1=img(:);
mx = max(img1);
mn = min(img1);
 
% if (mx == mn)
%   res = img - mx + 0.5*sum(range);
% else
%   res = (img - mn) / (mx - mn) * abs(range(2)-range(1)) + min(range);
res = (img - mn) / (mx - mn);
end

