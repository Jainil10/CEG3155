LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity Gate is
	port(x : in STD_LOGIC; y : out STD_LOGIC);
end entity Gate;

architecture basic of Gate is
begin
	y <= x;
end architecture basic;

