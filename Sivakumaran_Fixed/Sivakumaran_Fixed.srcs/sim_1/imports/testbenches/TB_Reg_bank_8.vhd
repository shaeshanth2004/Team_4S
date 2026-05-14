library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Reg_bank_8 is
end TB_Reg_bank_8;

architecture Behavioral of TB_Reg_bank_8 is
    component Reg_bank_8
        Port (
            RegSel : in STD_LOGIC_VECTOR(2 downto 0);
            Clk, Reset : in STD_LOGIC;
            Input : in STD_LOGIC_VECTOR(3 downto 0);
            Out_0, Out_1, Out_2, Out_3, Out_4, Out_5, Out_6, Out_7 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal RegSel : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Clk, Reset : STD_LOGIC := '0';
    signal Input : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Out_0, Out_1, Out_2, Out_3, Out_4, Out_5, Out_6, Out_7 : STD_LOGIC_VECTOR(3 downto 0);
begin
    UUT: Reg_bank_8 port map(RegSel, Clk, Reset, Input, Out_0, Out_1, Out_2, Out_3, Out_4, Out_5, Out_6, Out_7);

    clk_process: process
    begin
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;
    end process;

    process
    begin
        Reset <= '1'; wait for 20 ns;
        assert Out_0 = "0000" and Out_1 = "0000" and Out_7 = "0000" report "Register bank reset failed" severity error;

        Reset <= '0';
        RegSel <= "001"; Input <= "1010"; wait for 20 ns;
        assert Out_1 = "1010" report "Register bank failed to write R1" severity error;

        RegSel <= "010"; Input <= "0011"; wait for 20 ns;
        assert Out_2 = "0011" report "Register bank failed to write R2" severity error;

        RegSel <= "111"; Input <= "0110"; wait for 20 ns;
        assert Out_7 = "0110" report "Register bank failed to write R7" severity error;

        RegSel <= "000"; Input <= "1111"; wait for 20 ns;
        assert Out_0 = "0000" report "R0 must stay hardwired to 0000" severity error;

        report "TB_Reg_bank_8 completed successfully" severity note;
        wait;
    end process;
end Behavioral;
