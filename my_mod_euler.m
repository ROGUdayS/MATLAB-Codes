function[x,y]=my_mod_euler(x0,y0,xn,n)
    f=@(x,y) -2*x*(y^2);
    h=(xn-x0)/n;
    x=x0:h:xn;
    y=zeros(1,n);
    maxit=10;
    y(1)=y0;
    s(:,:)=zeros(n,maxit);
    for i=2:n+1
        y(i)=y(i-1)+h*f(x(i-1),y(i-1));
        s(i,1)=y(i);
        for j=1:maxit
            s(i,j+1)=y(i-1)+(h/2)*(f(x(i-1),y(i-1))+f(x(i),s(i,j)));
            if abs(s(i,j+1)-s(i,j))<10^-6
                y(i)=s(i,j+1);
                break
            end
        end
    end
    plot(x,y,'*');
end