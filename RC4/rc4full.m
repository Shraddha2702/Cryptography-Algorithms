function ef = rc4full(pf,ki)
tic();
s = rc4key(ki);
disp(s);
%s = uint8(s);
j0 = 0;
i0 = 0;
r = prga(s, pf);
disp(r);
v = uint8(pf);
C = bitxor(v,r);
disp(C);
data_show =dec2hex(C);
ef = data_show;

function sc=rc4key(key)
for i0 = 0:255
    sc(i0+1) = i0+1;
end
j0 = 0;
for i0 = 0:255
    j0 = mod(j0 + sc(i0+1) + key(mod(i0, length(key)) + 1), 256);
    tmp = sc(i0+1);
    sc(i0+1) = sc(j0+1);
    sc(j0+1) = tmp;
end

function r = prga(sc, data)
i0=0; j0=0; x=[]; t=[];
for x=0:length(data)-1
    i0 = mod( (i0+1), 256);
    j0 = mod( j0 + sc(i0+1), 256);
    tmp = sc(i0+1);
    sc(i0+1) = sc(j0+1);
    sc(j0+1) = tmp;
    r(x+1) = sc(mod( sc(i0+1) + sc(j0+1), 256)+1);
end
time = toc();
printf("\nComplete Time taken for rc4 : %d",time);