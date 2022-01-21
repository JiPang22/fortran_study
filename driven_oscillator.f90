program Driven_oscillator 
implicit none
real*8 t, dt, x0, x1, v0, v1, dx_dt, dv_dt, k, m, c, a, w
complex*8 i
integer*8 start, t_max
parameter(t_max = 500, dt = 0.01, k = 1., m = 1., c = 0.1, a = 1., w = 10., i = complex(0., 1.)) !k는 용수철 상수, m은 질량, c는 감쇠상수

t = 0
x0 = 1. !초기조건
v0 = 0.

open(1, file = "x_t.dat")
open(2, file = "v_t.dat")
open(3, file = "v_x.dat")

do start = 0, int(t_max/dt) !t_max/dt는 반복횟수

	t = t + dt !시간의 흐름을 표현

	dx_dt = v0 !처음에는 초기조건을 쓰고 이후 루프에서부터 업데이트 
	dv_dt = -(k/m) * x0 - (c/m) * v0 + (a/m) * exp(i * w * t) !운동방정식

	write(1,*) t, x0
	write(2,*) t, v0
	write(3,*) x0, v0

	x1 = x0 + dx_dt * dt !선형근사로 업데이트
	v1 = v0 + dv_dt * dt

	x0 = x1 !업데이트 
	v0 = v1

	print*, t, '/', t_max

end do

end
