clear,clc;
k=2;l=4;%�����������д�������k��n�е�
%������ C_OUT S_OUT X_OUT P �ڵ�·ʵ��ʱӦ��Ϊ�Ĵ���
C_OUT = zeros(k,l);
S_OUT = zeros(k,l);
X_OUT = zeros(k,l);
P     = zeros(k,l);
C_IN = zeros(k,l);
S_IN = zeros(k,l);
X_IN = zeros(k,l);


%�������
A=[4 3; 2 1];
B=eye(k,k);
C=eye(k,k);
D=zeros(k,k);
A=[A,B;-C,D];
A


%�������Ϊ����������ʽ ע��T��������
operation=length(A);
T=zeros(2*operation+10,operation);
for i=1:operation
    T(i:(i+operation-1),i)=A(:,i);
end
A=T


%------------------------------------
for i=1:(5*k-2)

for u=1:l
    X_IN(1,u)=A(i,u);
end
for v=2:k
    for u=v:l
        X_IN(v,u)=X_OUT(v-1,u);
    end
end

for v=1:k
    for u=1:l
        if(u>v)
            S_IN(v,u)=S_OUT(v,u-1);
            C_IN(v,u)=C_OUT(v,u-1);
        end
    end
end

%------------------------------------
%ִ�м������
for m=1:k
    for n=1:l
       operation=1;     
       if(i>k)
           if((m+n+k-1)<=i)
               operation=0;
           end
       end
       
       if(m==n)
            [ P(m,n),S_OUT(m,n),C_OUT(m,n) ] = Boundery_Cell( P(m,n),X_IN(m,n),operation);
       end
       if(n>m)
            [  P(m,n),X_OUT(m,n),S_OUT(m,n),C_OUT(m,n) ] = Internal_Cell( P(m,n),X_IN(m,n),S_IN(m,n),C_IN(m,n),operation);
       end
    end
end

disp(['step:',num2str(i)]);
disp(X_OUT);
%C_OUT,S_OUT,A(i+1,:),X_OUT,P
disp(C_OUT);
end
