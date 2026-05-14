library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    Port (
        D     : in  STD_LOGIC_VECTOR (3 downto 0);
        En    : in  STD_LOGIC;
        Clk   : in  STD_LOGIC;
        Reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Reg;

architecture Behavioral of Reg is
    signal data : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(Clk, Reset)
    begin
        if Reset = '1' then
            data <= "0000";
        elsif rising_edge(Clk) then
            if En = '1' then
                data <= D;
            end if;
        end if;
    end process;
    Q <= data;
end Behavioral;
