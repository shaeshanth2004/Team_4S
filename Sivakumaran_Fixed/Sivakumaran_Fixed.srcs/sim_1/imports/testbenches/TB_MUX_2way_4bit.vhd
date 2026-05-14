library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2way_4bit is
end TB_MUX_2way_4bit;

architecture Behavioral of TB_MUX_2way_4bit is
    component MUX_2way_4bit
        Port (loadSel : in STD_LOGIC; ImmedVal, ALUVal : in STD_LOGIC_VECTOR(3 downto 0); OutputVal : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal loadSel : STD_LOGIC := '0';
    signal ImmedVal, ALUVal, OutputVal : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    UUT: MUX_2way_4bit port map(loadSel, ImmedVal, ALUVal, OutputVal);

    process
    begin
        ImmedVal <= "1010"; ALUVal <= "0101"; loadSel <= '0'; wait for 20 ns;
        assert OutputVal = "1010" report "MUX_2way_4bit failed for immediate value" severity error;

        loadSel <= '1'; wait for 20 ns;
        assert OutputVal = "0101" report "MUX_2way_4bit failed for ALU value" severity error;

        report "TB_MUX_2way_4bit completed successfully" severity note;
        wait;
    end process;
end Behavioral;
