function [ X,V_OUT,M_OUT ] = Boundery_Cell( X,X_IN,S)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%S==1ִ��pivoting ����ִ��non-pivoting
if(S==1)
    if(abs(X_IN)>=abs(X))
        V_OUT=1;
        if(X_IN~=0)
            M_OUT=-X/X_IN;
        else
            M_OUT=0;
        end
        X=X_IN;
    else        
        V_OUT=0;
        M_OUT=-X_IN/X;
    end
else
    V_OUT=0;
    M_OUT=-X_IN/X;
end
 

end

