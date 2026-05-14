library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_counter is
    Port (
        Mux_out : in  STD_LOGIC_VECTOR (2 downto 0);
        Clk     : in  STD_LOGIC;
        Res     : in  STD_LOGIC;
        Q       : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Program_counter;

architecture Behavioral of Program_counter is
    signal RegPC : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
    process(Clk, Res)
    begin
        if Res = '1' then
            RegPC <= "000";
        elsif rising_edge(Clk) then
            RegPC <= Mux_out;
        end if;
    end process;
    Q <= RegPC;
end Behavioral;
