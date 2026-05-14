library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_Rom is
    Port (
        address     : in  STD_LOGIC_VECTOR (2 downto 0);
        instruction : out STD_LOGIC_VECTOR (11 downto 0)
    );
end Program_Rom;

architecture Behavioral of Program_Rom is
    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR (11 downto 0);

    -- Program for lab task: total of integers 1 to 3, final answer in R7.
    -- 0: MOVI R7, 1
    -- 1: MOVI R2, 2
    -- 2: ADD  R7, R2
    -- 3: MOVI R2, 3
    -- 4: ADD  R7, R2
    -- 5: JZR  R0, 5  -> stop by looping forever at address 5
    -- Final R7 = 0110 = 6
    constant ROM : rom_type := (
        0 => "101110000001",
        1 => "100100000010",
        2 => "001110100000",
        3 => "100100000011",
        4 => "001110100000",
        5 => "110000000101",
        6 => "110000000101",
        7 => "110000000101"
    );
begin
    instruction <= ROM(to_integer(unsigned(address)));
end Behavioral;
