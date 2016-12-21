// orbit circularization. 
function circularization {
    parameter targetorbit.

    notify("Coasting to apoapsis.").

    lock steering to prograde.

    wait until eta:apoapsis < 30.

    set neweta to eta:apoapsis. 

    wait 0.1.

    notify("Circularizing...").

    until periapsis > targetorbit {
      if (eta:apoapsis - 100) > neweta {
          lock throttle to 1.
          lock steering to heading (90, 5).
        } 


        else {        
           if eta:apoapsis < neweta {
              lock throttle to 1.
              lock steering to prograde.
          }



          if eta:apoapsis > neweta {
              lock throttle to 0.
              lock steering to prograde.
              wait 1.
            }


            set neweta to eta:apoapsis.
            check_stage_circ().
            wait 0.1.
        }
    lock throttle to 0. 
    wait 5.
    notify("Orbit achieved!").
}
