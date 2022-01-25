program rk4
implicit none
real:: x,y,xp,h,m1,m2,m3,m4,f
integer:: n,int,i

write(*,*)'input values of x and y'
read(*,*)x,y
write(*,*)'input value of x at which y is required'
read(*,*)xp
write(*,*)'input size h'
read(*,*)h

!Compute number of steps
n=int((xp-x)/h)
write(*,*) n

do i=1,n
m1=h*f(x,y)
m2=h*f(x+0.5*h,y+0.5*m1)
m3=h*f(x+0.5*h,y+0.5*m2)
m4=h*f(x+h,y+m3)

x=x+h
y=y+(m1+2.0*m2+2.0*m3+m4)*(1/6.0)

write(*,*) i,x,y

end do

!final value of y
write(*,*)'value of y at x=',x,'is',y

end program

!define your function here
real function f(x,y)
real:: x,y
f=x+y

end function
