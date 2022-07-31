
v=1-exp(-1);
v=v+1e-8;
j=20;
for i=1:j
    v=1-i*v;
end
v
