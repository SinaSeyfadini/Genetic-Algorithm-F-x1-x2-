cac
%% Problem difenition
numitr=20;               %number of itration

z=@(x1,x2) objfu(x1,x2);  %objective function

npop=30;                  %main parameters
pc=0.9;
pm=0.5;
nc=2*round(pc*npop/2);
nm=round(pm*npop);
sigma=1;
%% Engine
for i=1:npop
    
    pop1(i)=unifrnd(-30,0,1,1);
    
    pop2(i)=unifrnd(-30,130,1,1);
   
end
pop=[pop1;pop2;z(pop1,pop2)];
c=z(pop1,pop2);
[v,ov]=sort(c);
pop=[pop1(ov);pop2(ov);v];
%Crossover & Mutation

for i=1:numitr
    %Crossover
    for k=1:nc/2
        i1=randi([1 npop]);
        p1=pop(:,i1);
        
        i2=randi([1 npop]);
        p2=pop(:,i2);
    
        
        [y1(:,k) y2(:,k)]=crossover(p1,p2);
        popc=[y1 y2];
        popc(3,:)=z(popc(1,:),popc(2,:));
    end
    %Mutation
        
        for k=1:nm
        i=randi([1 npop]);
        p=pop(:,i);
        
        popm(:,k)=mutate(p,sigma);
        popm(3,:)=z(popm(1,:),popm(2,:));
        
        end
        %% Obtimization Core
        pop=[pop popc popm];
        Z=pop(3,:);
        [V, OV]=sort(Z);
        pops1=pop(1,:);
        pops2=pop(2,:);
        pop=[pops1(OV);pops2(OV);V];
    
end
%% Results
r=pop(:,1);
Xf=[r(1);r(2)]
Objective=r(3)
