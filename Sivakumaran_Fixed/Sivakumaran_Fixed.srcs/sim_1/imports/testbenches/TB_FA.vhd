library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_FA is
end TB_FA;

architecture Behavioral of TB_FA is
    component FA
        Port (A, B, C_in : in STD_LOGIC; S, C_out : out STD_LOGIC);
    end component;

    signal A, B, C_in : STD_LOGIC := '0';
    signal S, C_out   : STD_LOGIC;
begin
    UUT: FA port map(A => A, B => B, C_in => C_in, S => S, C_out => C_out);

    process
    begin
        A <= '0'; B <= '0'; C_in <= '0'; wait for 20 ns;
        assert S = '0' and C_out = '0' report "FA failed for 000" severity error;

        A <= '0'; B <= '0'; C_in <= '1'; wait for 20 ns;
        assert S = '1' and C_out = '0' report "FA failed for 001" severity error;

        A <= '0'; B <= '1'; C_in <= '0'; wait for 20 ns;
        assert S = '1' and C_out = '0' report "FA failed for 010" severity error;

        A <= '0'; B <= '1'; C_in <= '1'; wait for 20 ns;
        assert S = '0' and C_out = '1' report "FA failed for 011" severity error;

        A <= '1'; B <= '0'; C_in <= '0'; wait for 20 ns;
        assert S = '1' and C_out = '0' report "FA failed for 100" severity error;

        A <= '1'; B <= '0'; C_in <= '1'; wait for 20 ns;
        assert S = '0' and C_out = '1' report "FA failed for 101" severity error;

        A <= '1'; B <= '1'; C_in <= '0'; wait for 20 ns;
        assert S = '0' and C_out = '1' report "FA failed for 110" severity error;

        A <= '1'; B <= '1'; C_in <= '1'; wait for 20 ns;
        assert S = '1' and C_out = '1' report "FA failed for 111" severity error;

        report "TB_FA completed successfully" severity note;
        wait;
    end process;
end Behavioral;
