function [  X,X_OUT,V_OUT,M_OUT ] = Internal_Cell( X,X_IN,V_IN,M_IN,S)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%S==1ִ��pivoting ����ִ��non-pivoting
if(S==1)
    if(V_IN==1)
        X_OUT=X+M_IN*X_IN;
        X=X_IN;
    else
        X_OUT=X_IN+M_IN*X;
    end
else 
        X_OUT=X_IN+M_IN*X;
end

V_OUT=V_IN;
M_OUT=M_IN;

end

