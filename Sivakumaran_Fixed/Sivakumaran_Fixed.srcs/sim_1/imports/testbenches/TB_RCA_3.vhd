library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_RCA_3 is
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is
    component RCA_3
        Port (A, B : in STD_LOGIC_VECTOR(2 downto 0); S : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal A, B, S : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
    UUT: RCA_3 port map(A => A, B => B, S => S);

    process
    begin
        A <= "000"; B <= "001"; wait for 20 ns;
        assert S = "001" report "RCA_3 failed: 0 + 1" severity error;

        A <= "001"; B <= "001"; wait for 20 ns;
        assert S = "010" report "RCA_3 failed: 1 + 1" severity error;

        A <= "010"; B <= "011"; wait for 20 ns;
        assert S = "101" report "RCA_3 failed: 2 + 3" severity error;

        A <= "111"; B <= "001"; wait for 20 ns;
        assert S = "000" report "RCA_3 failed: 7 + 1 modulo 8" severity error;

        report "TB_RCA_3 completed successfully" severity note;
        wait;
    end process;
end Behavioral;
