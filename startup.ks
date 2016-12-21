clearscreen.


lock throttle to 1.0. 

print "counting down:".
from {local countdown is 10.} until countdown = 0 step {set countdown to countdown - 1.} do {
    print "..." + countdown.
    wait 1.
}

when maxthrust = 0 then {
    print "staging" at(0,20).	
    stage.
    wait 1.
    print "        " at(0,20).
    preserve.
}.
 
set mysteer to heading(90,90).
set myspeed to ship:velocity:surface:mag.
set targetoribit to 100000.
set speedchange to 17.
set degree to 90.

lock steering to mysteer. 

until ship:apoapsis > 100000 { 

    if ship:velocity:surface:mag < 100 {
        set myspeed to ship:velocity:surface:mag.

    } else if ship:velocity:surface:mag - myspeed >= speedchange and degree > 10{
        set degree to degree - 1.
        set mysteer to heading(90,degree).
        set myspeed to ship:velocity:surface:mag.
        print "pitching to " + degree +" degrees" at(0,15).
        print round(ship:apoapsis,0) at (0,16).
	}
}.

rcs on.

panels on.

lock steering to prograde.

lock throttle to 0.

wait until eta:apoapsis < 30.

lock throttle to 1.
wait until alt:apoapsis - alt:periapsis < 1000.
lock throttle to 0.

sas on.
set sasmode to "radialin".