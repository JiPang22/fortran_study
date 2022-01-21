program damped_oscillator
implicit none
real t, dt, t_max, x0, x1, dx_dt, v0, v1, dv_dt, m, c, k, w0
integer count_num
parameter(dt=0.001, t_max=3000., m=1., k=1.)

!중력 없음, c는 감쇠상수, k는 용수철 상수, w0는 시스템의 각진동수

t = 0. !초기조건
x0 = 1.
v0 = 0.

do count_num = 0, int(t_max/dt)
t = t + dt

dx_dt = v0
dv_dt = -(c/m)*v0 -(k/m)*x0 !이 시스템의 운동방정식

!업데이트 과정
x1 = x0 + dx_dt * dt !선형근사
v1 = v0 + dv_dt * dt

x0 = x1
v0 = v1

open(1,file='x_t.dat') !없는 파일을 하나 만드는 과정
open(2,file='v_t.dat')
open(3,file='v_x.dat')

write(1,*) t, x0 !새로 생긴 파일에 data기록
write(2,*) t, v0
write(3,*) x0, v0

end do

end
