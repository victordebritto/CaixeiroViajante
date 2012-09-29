function tabu(nCidades,Distancias,z,Maior,Menor)

    Ltabu=zeros(nCidades);%Lista tabu 
    cl=100;%Mantém a melhor soluçao da rota
    menDist=Inf;
    tl=50; %comprimento do tabu
    l1=200;%solução nao pode ser maior do que n*(n-1)/2
    S0=randperm(nCidades);
    S=S0;
    melhorCamin=S0;
    Si=zeros(l1,nCidades);
    nIteracoes= input('Entre com o numero de Iterações desejadas: '); % Número de Iterações
    p=1;
    clf;
    figure(1);

tic % inicia o tempo    
while (p<nIteracoes+1)
    if l1>nCidades*(nCidades)/2
        disp('Numero de soluções possiveis não mais que n*(n-1)/2 o campo inteiro do numero, o sistema automaticamente sairá');
        l1=(nCidades*(nCidades)/2)^.5;
        break;
    end
    ArrS(p)=CalDist(Distancias,S);        
    i=1;
    A=zeros(l1,2);
    while i<=l1        
        M=nCidades*rand(1,2);
        M=ceil(M);
        if M(1)~=M(2)
            m1=max(M(1),M(2));m2=min(M(1),M(2));
            A(i,1)=m1;A(i,2)=m2;
            if i==1
                isdel=0;
            else
                for j=1:i-1
                    if A(i,1)==A(j,1)&&A(i,2)==A(j,2)
                        isdel=1;
                        break;
                    else
                        isdel=0;
                    end
                end
            end
            if ~isdel
                i=i+1;
            else
                i=i;
            end
        else 
            i=i;
        end
    end
    
    for i=1:l1  %tabu
        Si(i,:)=S;
        Si(i,[A(i,1),A(i,2)])=S([A(i,2),A(i,1)]);
        CCL(i,1)=i;
        CCL(i,2)=CalDist(Distancias,Si(i,:));
        CCL(i,3)=S(A(i,1));
        CCL(i,4)=S(A(i,2));   
    end
    [fs fin]=sort(CCL(:,2));
    for i=1:cl
        CL(i,:)=CCL(fin(i),:);
    end
    
    if CL(1,2)<menDist  %Critérios de aspiração
        menDist=CL(1,2);
        S=Si(CL(1,1),:);        
        melhorCamin=S;
        for m=1:nCidades
            for n=1:nCidades
                if Ltabu(m,n)~=0
                    Ltabu(m,n)=Ltabu(m,n)-1;
                end
            end
        end
        Ltabu(CL(1,3),CL(1,4))=tl;
    else
        
        for i=1:cl
            if Ltabu(CL(i,3),CL(i,4))==0
                S=Si(CL(i,1),:);
                for m=1:nCidades
                    for n=1:nCidades
                        if Ltabu(m,n)~=0
                            Ltabu(m,n)=Ltabu(m,n)-1;
                        end
                    end
                end
                Ltabu(CL(i,3),CL(i,4))=tl;
                break;
            end
        end
    end
    
    ArrmenDist(p)=menDist;
    desenha(z,melhorCamin,menDist,p,0,Maior,Menor);
    
    p=p+1;
end   
tempExec=toc; %ler o tempo que passou desde o "tic"
fprintf('O tempo gasto para executar o algoritmo foi %6.5f microsegundos!\n\n',tempExec*1000)

end