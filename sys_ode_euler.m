function[x,y]=sys_ode_euler(x0,y0,z0,xn,n)
    h=(xn-x0)/n;
    x=x0:h:xn;
    f=@(x,y,z) 1+x*z;
    g=@(x,y,z) -x*y;
    y=zeros(1,n);
    z=zeros(1,n);
    y(1)=y0;
    z(1)=z0;
    for i=2:n+1
        y(i)=y(i-1)+h*f(x(i-1),y(i-1),z(i-1));
        z(i)=z(i-1)+h*g(x(i-1),y(i-1),z(i-1));
    end
    plot(x,y,'r*');
    hold on
    plot(x,z,'b*');
end