program pendulum
implicit none
integer*8 i, i_max
real*8 t, dt, th0, th1, dif_th, w0, w1, dif_w, g, l, s
parameter (dt = 0.001, i_max = 1000, g = 10., l = 1.)

!	i = count number
!	th0 = initial angular displacement
!	w0 = initial angular velocity
!	dif_ = differential operator
!	g = gravitational acceleration
!	l = pendulum length

th0 = 1. ! initial condition
w0 = 0.

open(1, file = 'data.dat')
do i = 0, int(i_max/dt) ! i를 i_max까지 반복
	t = t + dt
	s = sin(th0)

	dif_th = w0 ! 초기조건 대입
	dif_w = -(g/l) * s ! 운동방정식 대입(사인항을 세타로 근사)

	th1 = th0 + dif_th * dt ! 선형 근사
	w1 = w0 + dif_w * dt

	write(1, *) t, th0, w0 ! print => t, th0, om0

	th0 = th1
	w0 = w1

end do
end



