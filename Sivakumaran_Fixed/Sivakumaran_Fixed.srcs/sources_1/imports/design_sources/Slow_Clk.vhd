library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Slow_Clk is
    Port (
        Clk_in  : in  STD_LOGIC;
        Reset   : in  STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end Slow_Clk;

architecture Behavioral of Slow_Clk is
    signal count : unsigned(27 downto 0) := (others => '0');
    signal slow  : STD_LOGIC := '0';

    -- Slightly faster than original
    constant MAX_COUNT : unsigned(27 downto 0) :=
        to_unsigned(125000000, 28);

begin
    process(Clk_in, Reset)
    begin
        if Reset = '1' then
            count <= (others => '0');
            slow <= '0';

        elsif rising_edge(Clk_in) then
            if count = MAX_COUNT then
                count <= (others => '0');
                slow <= not slow;
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    Clk_out <= slow;

end Behavioral;