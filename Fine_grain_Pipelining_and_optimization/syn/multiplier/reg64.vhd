library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use WORK.all;
----simple register-----------
entity reg64 is
	port(
		clock: in std_logic;
		i : in  std_logic_vector(63 downto 0);
		o : out std_logic_vector(63 downto 0)
	);
end reg64;

architecture behavioral of reg64 is
	signal temp : std_logic_vector(63 downto 0);

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
