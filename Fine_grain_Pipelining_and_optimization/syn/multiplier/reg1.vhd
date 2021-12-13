library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use WORK.all;
----simple register-----------
entity reg1 is
	port(
		clock: in std_logic;
		i : in  std_logic;
		o : out std_logic
	);
end reg1;

architecture behavioral of reg1 is
	signal temp : std_logic;

begin
	process (clock)
	begin
		if(clock = '1' and clock'event)then
				temp <= i;
		end if;
	end process;

	o <= temp;
	
end behavioral;


--configuration CFG_reg of reg is
 --- for behavioral
--  end for;
--end CFG_reg;
