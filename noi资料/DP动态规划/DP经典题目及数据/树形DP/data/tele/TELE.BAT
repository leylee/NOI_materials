@echo off
if "%1"=="" goto loop
copy tele%1.in tele.in >nul
echo Problem Test
echo Data %1
time<enter
tele
time<enter
fc tele.out tele%1.out
del tele.in
del tele.out
pause
goto end
:loop
for %%i in (1 2 3 4 5 6 7 8 9 10) do call %0 %%i
:end
