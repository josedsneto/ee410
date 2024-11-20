library IEEE;
use IEEE.electrical_systems.all;

entity resistance is
generic(tc1 : real := 3.9e-3;
		tc2 : real := -5.77e-7;
		R0 : real := 1000.0;
		t0 : real := 300.0);
port(	terminal t1, t2 : electrical;
		quantity temp : in real);
end entity;

architecture bhv of resistance is

quantity V across I through t1 to t2;
quantity R : real;
begin
	V == R*I;
	
	R == R0 + R0*(tc1*(temp-t0)+tc2*(temp-t0)**2);
	
end architecture;
	