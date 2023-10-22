function [y1 y2]=crossover(x1,x2)
      alpha=randn(1,1);
      
      y1=alpha.*x1+(1-alpha).*x2;
      y2=(1-alpha).*x1+alpha.*x2;
end