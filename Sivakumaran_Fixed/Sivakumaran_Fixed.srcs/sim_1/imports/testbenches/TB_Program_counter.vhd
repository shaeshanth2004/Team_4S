library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Program_counter is
end TB_Program_counter;

architecture Behavioral of TB_Program_counter is
    component Program_counter
        Port (Mux_out : in STD_LOGIC_VECTOR(2 downto 0); Clk, Res : in STD_LOGIC; Q : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal Mux_out, Q : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Clk, Res : STD_LOGIC := '0';
begin
    UUT: Program_counter port map(Mux_out, Clk, Res, Q);

    clk_process: process
    begin
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;
    end process;

    process
    begin
        Res <= '1'; Mux_out <= "101"; wait for 20 ns;
        assert Q = "000" report "PC reset failed" severity error;

        Res <= '0'; Mux_out <= "001"; wait for 20 ns;
        assert Q = "001" report "PC failed to load 001" severity error;

        Mux_out <= "010"; wait for 20 ns;
        assert Q = "010" report "PC failed to load 010" severity error;

        Res <= '1'; wait for 20 ns;
        assert Q = "000" report "PC async reset failed" severity error;

        report "TB_Program_counter completed successfully" severity note;
        wait;
    end process;
end Behavioral;
