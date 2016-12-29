
%clc;
id1 = tic();

disp('\nImplementation of RSA Algorithm');
%clear all; close all;
id = tic();
p = input('\nEnter the value of p: ');
q = input('\nEnter the value of q: ');
[Pk,Phi,d,e] = intialize(p,q);
M = input('Enter the message: ','s');
x=length(M);
c=0;
for j= 1:x
    for i=0:122
        if strcmp(M(j),char(i))
            c(j)=i;
        end
    end
end
disp('ASCII Code of the entered Message:');
disp(c); 
time = toc(id);
printf("\nInitial Time : %d",time);

% % %Encryption
id2 = tic();
for j= 1:x
   cipher(j)= crypt(c(j),Pk,e); 
end
disp('Cipher Text of the entered Message:');
disp(cipher);
time2 = toc(id2);
printf("\nTime taken for Encryption : %d",time2);

% % %Decryption
id3 = tic();
for j= 1:x
   message(j)= crypt(cipher(j),Pk,d); 
end
disp('Decrypted ASCII of Message:');
disp(message);
%disp(['Decrypted Message is: ' message]);
time3 = toc(id3);
printf("\nTime taken for Decryption : %d",time3);

time1 = toc(id1);
printf("\nComplete time taken for Encrytion and Decryption : %d",time1);