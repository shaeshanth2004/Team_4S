library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2way_3bit is
end TB_MUX_2way_3bit;

architecture Behavioral of TB_MUX_2way_3bit is
    component MUX_2way_3bit
        Port (JumpFlag : in STD_LOGIC; JumpAdd, SeqAdd : in STD_LOGIC_VECTOR(2 downto 0); NextPC : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal JumpFlag : STD_LOGIC := '0';
    signal JumpAdd, SeqAdd, NextPC : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
    UUT: MUX_2way_3bit port map(JumpFlag, JumpAdd, SeqAdd, NextPC);

    process
    begin
        JumpAdd <= "101"; SeqAdd <= "010"; JumpFlag <= '0'; wait for 20 ns;
        assert NextPC = "010" report "MUX_2way_3bit failed for sequential address" severity error;

        JumpFlag <= '1'; wait for 20 ns;
        assert NextPC = "101" report "MUX_2way_3bit failed for jump address" severity error;

        report "TB_MUX_2way_3bit completed successfully" severity note;
        wait;
    end process;
end Behavioral;
