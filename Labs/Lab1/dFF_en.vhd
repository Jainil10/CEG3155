	LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dFF_en IS
	PORT(
		i_d : IN STD_LOGIC;
		i_clock : IN STD_LOGIC;
		i_en : IN STD_LOGIC;
		o_q, o_qBar : OUT STD_LOGIC);
END dFF_en;

ARCHITECTURE rtl OF dFF_en IS

	SIGNAL int_input_d : STD_LOGIC;
	SIGNAL int_input_1 : STD_LOGIC;
	SIGNAL int_input_2 : STD_LOGIC;
	SIGNAL int_i_en_Bar : STD_LOGIC;
	SIGNAL int_o_q : STD_LOGIC;

	COMPONENT dFF
	PORT(
		c_i_d : IN STD_LOGIC;
		c_i_clock : IN STD_LOGIC;
		c_o_q, c_o_qBar : OUT STD_LOGIC);
END COMPONENT;	

	COMPONENT Gate
	PORT(
		c_x : IN STD_LOGIC;
		c_y : OUT STD_LOGIC);
END COMPONENT;

BEGIN
	--Component Instantiation
	dFlipFlop: dFF
	PORT MAP ( 
		c_i_d => int_input_d,
		c_i_clock => i_clock,
		c_o_q => int_o_q,
		c_o_qBar => o_qBar);

	bridge : Gate
	PORT MAP ( 
		c_x => int_o_q,
		c_y => o_q);
	
	--Concurrent Signal Assignment
	int_i_en_Bar <= not(i_en);
	int_input_1 <= 	i_d AND i_en;
	int_input_2 <=  int_i_en_Bar  AND int_o_q;
	int_input_d <=  int_input_1 OR int_input_2;

END rtl;
