function [B,info]=matrix_secondary_stats(XX)



Z=zeros(12,5);
T=Z; %define a zero matrix

% XX(7:12,:)=[]
% Z=zeros(6,5);
% T=Z; %define a zero matrix
% Y(7:12)=[]

s=1.0;


h=1; %secondary stat weights;

for l=1:16 %for loop for IL-2, which can activate all the stats also
    for n=1:2 %for loop for IL-21, which can activate S1 also
        for m=1:2 %for loop  for IL-18, which can activate S3 also
            
            

                        
            %Old Mode ready
            for i=1:length(XX)
                   Z(i,:)=zeros(1,5);
                for j=1
                    %S1 S3 S4 S5 NFkb
                    
                    if XX(i,1)==1 %IL-2 presence
                        
                        if (l==1)
                            Z(i,4) = 1.0;%STAT5 is present
                            %-----------------------------
                        elseif (l==2)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,1)= h;%STAT1 is present
                        elseif (l==3)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,2)= h;%STAT3 is present
                        elseif (l==4)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,3)=h;%STAT4 is present
                        elseif (l==5)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,5)=h;%NFkb is present
                            %------------------------------
                        elseif (l==6)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,1)=h;%STAT1 is present
                            Z(i,2)=h;%STAT3 is present
                        elseif (l==7)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,1)=h;%STAT1 is present
                            Z(i,3)= h;%STAT4 is present  
                        elseif (l==8)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,1)=h;%STAT1 is present
                            Z(i,5)=h;%NFkb is present
                        elseif (l==9)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,2)=h;%STAT3 is present
                            Z(i,3)=h;%STAT4 is present 
                        elseif (l==10)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,2)=h;%STAT3 is present
                            Z(i,5)=h;%NFkb is present  
                        elseif (l==11)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,3)=h;%STAT4 is present
                            Z(i,5)= h;%NFkb is present 
                         %------------------------------
                         elseif (l==12)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,1)=h;%STAT1 is present
                            Z(i,2)=h;%STAT3 is present
                            Z(i,3)=h;%STAT4 is present 
                             
                         elseif (l==13)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,1)=h;%STAT1 is present
                            Z(i,2)=h;%STAT3 is present
                            Z(i,5)=h;%NFkb is present
                            
                         elseif (l==14)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,2)=h;%STAT3 is present
                            Z(i,3)=h;%STAT4 is present 
                            Z(i,5)=h;%NFkb is present 
                            
                         elseif (l==15)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,3)=h;%STAT4 is present 
                            Z(i,5)=h;%NFkb is present   
                            Z(i,1)=h;%STAT1 is present
                            %------------------------------
                          elseif (l==16)
                            Z(i,4)=1.0;%STAT5 is present
                            Z(i,1)=h;%STAT1 is present
                            Z(i,2)=h;%STAT3 is present
                            Z(i,3)= h;%STAT4 is present 
                            Z(i,5)= h;%NFkb is present   
                              
                            
                        end
                        
                    end
                    
                    
                    if XX(i,2)== 1 %IL-12 presence
                        Z(i,3)=Z(i,3)+ 1.0; %only STAT-4 is present
                    end
                    
                    if XX(i,3)==1 %IL-15 presence
                        Z(i,4)=Z(i,4)+1.0; %Only STAT5 is present
                    end
                    
                    if XX(i,4)==1 %IL-18 presence
                        Z(i,5)=Z(i,5)+1.0;
                        if m==1
                            Z(i,2)=Z(i,2)+0.0;
                        elseif m==2
                            Z(i,2)=Z(i,2)+h;
                        end
                         
                    end
                    
                    if XX(i,5)==1 %IL-21 presence
                        Z(i,2)=   Z(i,2)+1.0;
                        if (n==1)
                            Z(i,1)=Z(i,1)+0.0;
                        elseif (n==2)
                            Z(i,1)=Z(i,1)+h;
                        end
                   
                    end
                
                end
                
                
                
            end
            l;
            n;
            m;
            Z;
            
            info(s,:)=[l,n,m];
            
            B(:,:,s)=Z; % Model number
            s=s+1;
            Z=T;
        end %end of m loop IL-18 loop
        
        
    end %end of n loop Il-21 loop
    
end % l loop ends IL-2 loop



s;

B;

end

% if (l==1)
%                             Z(i,4) = Z(i,4)+1.0;%STAT5 is present
%                             %-----------------------------
%                         elseif (l==2)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,1)= Z(i,1)+h;%STAT1 is present
%                         elseif (l==3)
%                             Z(i,4)=Z(i,4)+ 1.0;%STAT5 is present
%                             Z(i,2)= Z(i,2)+h;%STAT3 is present
%                         elseif (l==4)
%                             Z(i,4)=Z(i,4)+ 1.0;%STAT5 is present
%                             Z(i,3)=Z(i,3)+h;%STAT4 is present
%                         elseif (l==5)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,5)=Z(i,5)+h;%NFkb is present
%                             %------------------------------
%                         elseif (l==6)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,1)=Z(i,1)+h;%STAT1 is present
%                             Z(i,2)=Z(i,2)+h;%STAT3 is present
%                         elseif (l==7)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,1)=Z(i,1)+h;%STAT1 is present
%                             Z(i,3)= Z(i,3)+h;%STAT4 is present  
%                         elseif (l==8)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,1)=Z(i,1)+h;%STAT1 is present
%                             Z(i,5)=Z(i,5)+h;%NFkb is present
%                         elseif (l==9)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,2)=Z(i,2)+h;%STAT3 is present
%                             Z(i,3)=Z(i,3)+h;%STAT4 is present 
%                         elseif (l==10)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,2)=Z(i,2)+h;%STAT3 is present
%                             Z(i,5)= Z(i,5)+h;%NFkb is present  
%                         elseif (l==11)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,3)=Z(i,3)+h;%STAT4 is present
%                             Z(i,5)= Z(i,5)+h;%NFkb is present 
%                          %------------------------------
%                          elseif (l==12)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,1)=Z(i,1)+h;%STAT1 is present
%                             Z(i,2)=Z(i,2)+h;%STAT3 is present
%                             Z(i,3)=Z(i,3)+h;%STAT4 is present 
%                              
%                          elseif (l==13)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,1)=Z(i,1)+h;%STAT1 is present
%                             Z(i,2)=Z(i,2)+h;%STAT3 is present
%                             Z(i,5)=Z(i,5)+h;%NFkb is present
%                             
%                          elseif (l==14)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,2)=Z(i,2)+h;%STAT3 is present
%                             Z(i,3)=Z(i,3)+h;%STAT4 is present 
%                             Z(i,5)=Z(i,5)+h;%NFkb is present 
%                             
%                          elseif (l==15)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,3)=Z(i,3)+h;%STAT4 is present 
%                             Z(i,5)=Z(i,5)+h;%NFkb is present   
%                             Z(i,1)=Z(i,1)+h;%STAT1 is present
%                             %------------------------------
%                           elseif (l==16)
%                             Z(i,4)=Z(i,4)+1.0;%STAT5 is present
%                             Z(i,1)=Z(i,1)+h;%STAT1 is present
%                             Z(i,2)=Z(i,2)+h;%STAT3 is present
%                             Z(i,3)= Z(i,3)+h;%STAT4 is present 
%                             Z(i,5)= Z(i,5)+h;%NFkb is present   
%                               
%                             
%                         end