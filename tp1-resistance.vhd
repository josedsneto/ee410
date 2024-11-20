library IEEE;
use IEEE.electrical_systems.all;

entity resistance is
generic(
		R0 : real := 1000.0;
		t0 : real := 27.0;
		rconst: real := 0.001
		);
port(	terminal t1, t2 : electrical;
		quantity temp : in real);
end entity;

architecture bhv of resistance is

quantity V across I through t1 to t2;
quantity R : real;

begin
	V == R*I;
	
	R == R0*(1.0 + rconst*(temp-t0));
	
end architecture;