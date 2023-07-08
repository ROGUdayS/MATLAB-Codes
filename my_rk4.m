function[x,y]=my_rk4(x0,y0,xn,n)
    f=@(x,y) -2*x*y^2;
    h=(xn-x0)/n;
    x=x0:h:xn;
    y=zeros(1,n);
    y(1)=y0;
    for i=2:n+1
        k1=h*f(x(i-1),y(i-1));
        k2=h*f(x(i-1)+0.5*h,y(i-1)+0.5*k1);
        k3=h*f(x(i-1)+0.5*h,y(i-1)+0.5*k2);
        k4=h*f(x(i-1)+h,y(i-1)+k3);
        y(i)=y(i-1)+(1/6)*(k1+2*k2+2*k3+k4);
    end
    plot(x,y,'o');
end