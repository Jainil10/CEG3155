entity displayRegister8 is
	port( d0, d1, d2, d3, d4, d5, d6, d7, en, clk: in bit;	
              q0, q1, q2, q3, q4, q5, q6, q7: out bit);
end displayRegister8;

architecture behav of displayRegister8 is
begin
	storage : process is
		variable stored_d0, stored_d1, stored_d2, stored_d3, stored_d4, stored_d5, stored_d6, stored_d7 : bit;
	begin
		if en = '1' and clk = '1' then
			stored_d0 := d0;
			stored_d1 := d1;
			stored_d2 := d2;
			stored_d3 := d3;
			stored_d4 := d4;
			stored_d5 := d5;
			stored_d6 := d6;
			stored_d7 := d7;
		end if;
		q0 <= stored_d0 after 5 ns;
		q1 <= stored_d1 after 5 ns;
		q2 <= stored_d2 after 5 ns;
		q3 <= stored_d3 after 5 ns;
		q4 <= stored_d4 after 5 ns;
		q5 <= stored_d5 after 5 ns;
		q6 <= stored_d6 after 5 ns;
		q7 <= stored_d7 after 5 ns;
		wait on d0, d1, d2, d3, d4, d5, d6, d7, en, clk;
	end process storage;
end architecture behav;

