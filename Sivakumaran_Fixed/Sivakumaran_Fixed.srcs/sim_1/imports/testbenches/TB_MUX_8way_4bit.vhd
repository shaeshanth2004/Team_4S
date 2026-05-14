library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_8way_4bit is
end TB_MUX_8way_4bit;

architecture Behavioral of TB_MUX_8way_4bit is
    component MUX_8way_4bit
        Port (R0, R1, R2, R3, R4, R5, R6, R7 : in STD_LOGIC_VECTOR(3 downto 0); RegSel : in STD_LOGIC_VECTOR(2 downto 0); RegVal : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR(3 downto 0);
    signal RegSel : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal RegVal : STD_LOGIC_VECTOR(3 downto 0);
begin
    UUT: MUX_8way_4bit port map(R0, R1, R2, R3, R4, R5, R6, R7, RegSel, RegVal);

    process
    begin
        R0 <= "0000"; R1 <= "0001"; R2 <= "0010"; R3 <= "0011";
        R4 <= "0100"; R5 <= "0101"; R6 <= "0110"; R7 <= "0111";

        RegSel <= "000"; wait for 20 ns; assert RegVal = "0000" report "MUX8 failed for R0" severity error;
        RegSel <= "001"; wait for 20 ns; assert RegVal = "0001" report "MUX8 failed for R1" severity error;
        RegSel <= "010"; wait for 20 ns; assert RegVal = "0010" report "MUX8 failed for R2" severity error;
        RegSel <= "011"; wait for 20 ns; assert RegVal = "0011" report "MUX8 failed for R3" severity error;
        RegSel <= "100"; wait for 20 ns; assert RegVal = "0100" report "MUX8 failed for R4" severity error;
        RegSel <= "101"; wait for 20 ns; assert RegVal = "0101" report "MUX8 failed for R5" severity error;
        RegSel <= "110"; wait for 20 ns; assert RegVal = "0110" report "MUX8 failed for R6" severity error;
        RegSel <= "111"; wait for 20 ns; assert RegVal = "0111" report "MUX8 failed for R7" severity error;

        report "TB_MUX_8way_4bit completed successfully" severity note;
        wait;
    end process;
end Behavioral;
