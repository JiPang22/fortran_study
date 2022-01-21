program SHM
implicit none
real*8 t, dt, x0, x1, v0, v1, dif_x, dif_v, k, m
integer*8 i, i_max
parameter(i_max = 100000, dt = 0.001, k = 1., m = 1. )
! Dimentionless
! ma + kx = 0 운동 방정식
! dif_v = -(k/m) * x

x0 = 1.
v0 = 0
open(1, file = "data.dat")
do i = 0, i_max 
	t = t + dt

	f = x + y

!	dif_x = v0 
!	dif_v = -(k/m) * x0
!
!	x1 = x0 + dif_x * dt
!	v1 = v0 + dif_v * dt

	write(1,*) t, x0

	x0 = x1
	v0 = v1
end do

end
