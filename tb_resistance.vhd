library IEEE;
use IEEE.electrical_systems.all;

entity tb_resistance is
end entity;

architecture bhv of tb_resistance is
	component resistance
		port(	
		terminal t1, t2 : electrical;
		quantity temp 	: in real);
	end component;

terminal t1: electrical;
quantity temp1 : real;
quantity V across I through t1;
quantity R : real;

signal pulse: real := 0.0;
signal const: real;
--quantity Vin: real;


begin
	
	process
	begin
		pulse <= 100.0;
		-- temperature = 27
		wait for 10ns;
		--  temperature = 28
		pulse  <= 200.0;
		wait for 10ns;
	end process;

	
	dut: resistance
	port map(t1 => t1,
			 t2 => electrical_ref,
			 temp => temp1);
			 
	V == R*I;
	V == 10.0;
	--pulse <=0.0, 20.0 after 10ms, 40.0 after 20ms, 0.0 after 30ms, 20.0 after 50ms, 40.0 after 70ms, 0.0 after 90ms;
	temp1 == pulse'ramp(0.0);
	
end architecture;