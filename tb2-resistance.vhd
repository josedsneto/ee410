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
	
	component resistance2
		port(	
		terminal t1, t2 : electrical;
		quantity temp 	: in real);
	end component;

quantity temp1 : real;
quantity t_const: real := 27.0;

terminal a,b,d: electrical;

quantity Vm across d to b;  			 -- tension source
quantity Vs across a to electrical_ref;  -- tension wheatstone
quantity I through a to electrical_ref;

signal pulse: real := 0.0;

begin	
	process
	begin
		pulse <= 27.0;
		wait for 10ns;
		pulse <= 300.0;
		wait for 100ns;
	end process;

	
	r1: resistance
	port map(t1 => a,
			 t2 => d,
			 temp => t_const);
			 
	r3: resistance
	port map(t1 => a,
			 t2 => b,
			 temp => t_const);
			 
	r4: resistance
	port map(t1 => b,
			 t2 => electrical_ref,
			 temp => t_const);
			 
	r2: resistance2					    -- Resistance variee
	port map(t1 => d,
			 t2 => electrical_ref,
			 temp => temp1);
			 
	Vs == 10.0;
	temp1 == pulse'ramp(100.0e-9, 0.0); -- Je crois que 'ramp() prend temp en s
	t_const == 100.0;
	
end architecture;