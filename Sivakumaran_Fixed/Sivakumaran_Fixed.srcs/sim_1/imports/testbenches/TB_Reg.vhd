library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Reg is
end TB_Reg;

architecture Behavioral of TB_Reg is
    component Reg
        Port (D : in STD_LOGIC_VECTOR(3 downto 0); En, Clk, Reset : in STD_LOGIC; Q : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal D : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal En, Clk, Reset : STD_LOGIC := '0';
    signal Q : STD_LOGIC_VECTOR(3 downto 0);
begin
    UUT: Reg port map(D => D, En => En, Clk => Clk, Reset => Reset, Q => Q);

    clk_process: process
    begin
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;
    end process;

    process
    begin
        Reset <= '1'; wait for 15 ns;
        assert Q = "0000" report "Reg reset failed" severity error;

        Reset <= '0'; En <= '0'; D <= "1010"; wait for 20 ns;
        assert Q = "0000" report "Reg should not load when En=0" severity error;

        En <= '1'; D <= "1010"; wait for 20 ns;
        assert Q = "1010" report "Reg failed to load 1010" severity error;

        En <= '0'; D <= "0101"; wait for 20 ns;
        assert Q = "1010" report "Reg changed while En=0" severity error;

        Reset <= '1'; wait for 20 ns;
        assert Q = "0000" report "Reg reset after load failed" severity error;

        report "TB_Reg completed successfully" severity note;
        wait;
    end process;
end Behavioral;
