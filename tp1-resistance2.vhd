library IEEE;
use IEEE.electrical_systems.all;

entity resistance2 is
generic(
		tc1: real := 3.9e-3;
		tc2: real := 5.77e-7;
		R0 : real := 1000.0;
		t0 : real := 27.0;
		rconst: real := 0.001
		);
port(	terminal t1, t2 : electrical;
		quantity temp : in real);
end entity;

architecture bhv of resistance2 is

quantity V across I through t1 to t2;
quantity R : real;

begin
	V == R*I;
	
	R == R0 + R0*( tc1*(temp-t0) + tc2*(temp-t0)*(temp-t0) );
	
end architecture;