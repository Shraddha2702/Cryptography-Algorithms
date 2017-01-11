function C = DES(P,Key)
% C = DES(P,Key) 
% Inputs: P = 64 bit (plaintext) vector P, Key =  a 64 bit vector
% that serves as an admissible DES key.  
% Output: C = the 64 bit (ciphertext) vector that corresponds to the
% output of the DES encryption algorithm.  
% If the key is not admissible (i.e., if the parity check bits do not
% satisfy the required properties) the program will produce an error message.

%First we check if the parity check bits are correct.
id0 = tic();

id1 = tic();
for i = 8:8:64
    if mod(Key(i)+sum(Key(i-7:i-1)),2)==0
        error('Key fails parity bit requirement of DES, use another key and try again.'), return
    end
end
time1 = toc(id1);
printf("\nTo check if the Parity bit is correct : %d",time1);

%We generate the 16 round keys; the ith row of the following matrix is the
%ith round key (of 48 bits)
id2 = tic();
RoundKeys = DESRoundKeys(Key);
time2 = toc(id2);
printf("\nTo generate the 16 round Keys, Time taken : %d",time2);

%Step 1:  Initial Permutation
id3 = tic();
PIP = InitPerm(P);
L = PIP(1:32); R = PIP(33:64);
time3 = toc(id3);
printf("\nTime taken for Initial Permutation : %d",time3);


%Step 2:  16 Round Feistel Cipher
id4 = tic();
for round = 1:16
    RoundKey = RoundKeys(round,:);
    Lnew = R;
    Rnew = xor(L,DESRoundKeyFunction(R,RoundKey));
    L = Lnew; R = Rnew;
end
time4 = toc(id4);
printf("\nTime taken for 16 Round Feistel Cipher : %d", time4);

%Step 3: Left/Right switch, and then apply inverse of initial permutation
%to get the ciphertext
id5 = tic();
C = InvInitPerm([R L]);
time5 = toc(id5);
printf("\nTime taken for applying Inverse of initial Permutation : %d",time5);


time6 = toc(id0);
printf("Time taken for complete Encryption of 64 bit Plain Text: %d",time6);