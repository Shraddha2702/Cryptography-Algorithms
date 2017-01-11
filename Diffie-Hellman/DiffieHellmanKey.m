function K = DiffieHellmanKey(p,g,B,a)
tic();
%  K = DiffieHellmanKey(p,g,B,a)
K = FastExp(B,a,p);
time= toc();
printf("\nTime taken to generate Key : %d",time);