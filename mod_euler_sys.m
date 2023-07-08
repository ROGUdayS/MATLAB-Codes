function[x,y]=mod_euler_sys(x0,y0,z0,xn,n)
    f=@(x,y,z) 1+x*z;
    g=@(x,y,z) -x*y;
    h=(xn-x0)/n;
    x=x0:h:xn;
    y=zeros(1,n);
    z=zeros(1,n);
    maxit=10;
    s(:,:)=zeros(n,maxit);
    u(:,:)=zeros(n,maxit);
    y(1)=y0;
    z(1)=z0;
    for i=2:n+1
        y(i)=y(i-1)+h*f(x(i-1),y(i-1),z(i-1));
        z(i)=z(i-1)+h*g(x(i-1),y(i-1),z(i-1));
        s(i,1)=y(i);
        u(i,1)=z(i);
        for j=1:maxit
            s(i,j+1)=y(i-1)+(h/2)*(f(x(i-1),y(i-1),z(i-1))+f(x(i),s(i,j),u(i,j)));
            u(i,j+1)=z(i-1)+(h/2)*(g(x(i-1),y(i-1),z(i-1))+g(x(i),s(i,j),u(i,j)));
            if abs(s(i,j+1)-s(i,j))<10^-6
                y(i)=s(i,j+1);
                break
            end
            if abs(u(i,j+1)-u(i,j))<10^-6
                z(i)=u(i,j+1);
                break
            end
        end
    end
    hold on 
    plot(x,y,'r*')
    plot(x,z,'b*')