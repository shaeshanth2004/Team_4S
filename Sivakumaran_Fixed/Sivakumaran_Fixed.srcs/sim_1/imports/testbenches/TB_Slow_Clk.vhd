library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Slow_Clk is
end TB_Slow_Clk;

architecture Behavioral of TB_Slow_Clk is
    component Slow_Clk
        Port (Clk_in, Reset : in STD_LOGIC; Clk_out : out STD_LOGIC);
    end component;

    signal Clk_in, Reset : STD_LOGIC := '0';
    signal Clk_out : STD_LOGIC;
begin
    UUT: Slow_Clk port map(Clk_in => Clk_in, Reset => Reset, Clk_out => Clk_out);

    clk_process: process
    begin
        Clk_in <= '0'; wait for 5 ns;
        Clk_in <= '1'; wait for 5 ns;
    end process;

    process
    begin
        Reset <= '1'; wait for 20 ns;
        assert Clk_out = '0' report "Slow clock reset failed" severity error;
        Reset <= '0';

        -- This checks compile/reset behavior only. Hardware divider is intentionally large.
        wait for 200 ns;
        report "TB_Slow_Clk completed. To see toggling quickly, temporarily reduce the counter width/divider for simulation." severity note;
        wait;
    end process;
end Behavioral;
