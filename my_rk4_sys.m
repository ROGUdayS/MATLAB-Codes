function [x,y]=my_rk4_sys(x0,y0,z0,xn,n)
    f=@(x,y,z) 1+x*z;
    g=@(x,y,z) -x*y; 
    h=(xn-x0)/n;
    x=x0:h:xn;
    y=zeros(1,n);
    z=zeros(1,n);
    y(1)=y0;
    z(1)=z0;
    for i=2:n+1
        k1=h*f(x(i-1),y(i-1),z(i-1));
        l1=h*g(x(i-1),y(i-1),z(i-1));
        k2=h*f(x(i-1)+0.5*h,y(i-1)+0.5*k1, z(i-1)+0.5*l1);
        l2=h*g(x(i-1)+0.5*h,y(i-1)+0.5*k1, z(i-1)+0.5*l1);
        k3=h*f(x(i-1)+0.5*h,y(i-1)+0.5*k2, z(i-1)+0.5*l2);
        l3=h*g(x(i-1)+0.5*h,y(i-1)+0.5*k2, z(i-1)+0.5*l2);
        k4=h*f(x(i-1)+ h,y(i-1)+k3, z(i-1)+l3);
        l4=h*g(x(i-1)+ h,y(i-1)+k3, z(i-1)+l3);
        y(i)=y(i-1)+(1/6)*(k1+2*k2+2*k3+k4); 
        z(i)=z(i-1)+(1/6)*(l1+2*l2+2*l3+l4);
    end
    hold on
    plot(x,y,'o');
    plot(x,z,'o');
end