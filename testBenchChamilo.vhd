library IEEE;
use IEEE.Electrical_systems.ALL;
use IEEE.Thermal_systems.ALL;
use IEEE.std_logic_1164.ALL;

entity tb_res is
end entity;

architecture bh of tb_res is

	component resistance
		port(	
		terminal t1, t2 : electrical;
		quantity temp 	: in real);
	end component;

	terminal t1: electrical;
	--terminal m1, m2: thermal;
	quantity V across I through t1;
	signal Temp : real := 0.0;
	quantity temp_q : real;
	
begin
		resistor: resistance
		--generic map(1.0,1.0,1.0)
		port map(
		t1 => t1,
		t2 => electrical_ref,
		temp => temp_q);
		
	V == 10.0;
	Temp <= 0.0, 20.0 after 10ms, 40.0 after 20ms, 0.0 after 30ms, 20.0 after 50ms, 40.0 after 70ms, 0.0 after 90ms;
	temp_q == temp'ramp(10.0e-3, 10.0e-3);
end architecture;