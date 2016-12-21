clearscreen.
stage.
sas on.

lock distance to ship:altitude + ship:body:radius.
lock weight to ship:mass * ship:body:mu / distance / distance.
lock twr to ship:availablethrust / weight.
lock atwr to twr / max(0.00001, cos(vang(ship:facing:vector,ship:up:vector))).
lock vspeed to 5 - alt:radar.

when true then {
    print("alt: " + alt:radar) at (0, 1).
    print("twr: " + twr) at (0, 2).
    print("atwr: " + atwr) at (0, 3).
    preserve.
}

lock throttle to ((vspeed - ship:verticalspeed) + 1) / atwr.

wait until false.