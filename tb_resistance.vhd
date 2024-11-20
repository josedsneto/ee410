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
quantity temp : real;
quantity V across I through t1;
quantity R : real;

signal temp_pulse: real;

begin
	
	process
	begin
		v_const <= 1.0;
		temp_pulse <= 27.0;
		wait for 10ns;
		temp_pulse  <= 28.0;
		wait for 10ns;
	end process;

	
	dut: resistance
	port map(t1 => t1,
			 t2 => electrical_ref,
			 temp => temp);
			 
	V == R*I;
	V == v_const'ramp(0.0, 0.0);    	-- tension constante egale a 1
	temp == temp_pulse'ramp(0.0, 0.0);
	
end architecture;