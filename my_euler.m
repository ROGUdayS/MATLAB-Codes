function[x,y]=my_euler(x0,y0,xn,n)
    h=(xn-x0)/n;
    x=x0:h:xn;
    f=@(x,y) -2*x*y^2;
    y=zeros(1,n);
    y(1)=y0;
    for i=2:n+1
        y(i)=y(i-1)+h*f(x(i-1),y(i-1));
    end
    plot(x,y,'*');
end