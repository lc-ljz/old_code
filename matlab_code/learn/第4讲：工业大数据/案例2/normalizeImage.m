function res = normalizeImage(img,varargin)
 
if (length(varargin) >= 1) range = [0,varargin{1}];
else range = [0,1]; end
 
if ((range(1) == 0) && (range(2) == 0))
  res = img;
  return;
end
 
mx = max(img(:));
mn = min(img(:));
 
if (mx == mn)
  res = img - mx + 0.5*sum(range);
else
  res = (img - mn) / (mx - mn) * abs(range(2)-range(1)) + min(range);
end