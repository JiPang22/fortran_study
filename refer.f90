program deq
implicit none 
integer*8 dum, dum_max
real*8 x_old, x_new, y_old, y_new, dt, om, gam, dx_dt, dy_dt, t
parameter(dum_max = 1.e+5, gam = 0.1, om = 0.1, dt = 0.001)

x_old = 1.
y_old = 1.

do dum = 1, dum_max

t = dum * dt

dx_dt = y_old
dy_dt = -gam * y_old - om * om * x_old

x_new = x_old + dx_dt * dt
y_new = y_old + dy_dt * dt

write(6,*) t, x_old, y_old
x_old = x_new
y_old = y_new

end do

end program
