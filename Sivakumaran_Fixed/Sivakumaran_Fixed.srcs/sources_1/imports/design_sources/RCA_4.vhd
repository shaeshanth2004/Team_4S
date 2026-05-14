library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
    Port (
        A        : in  STD_LOGIC_VECTOR (3 downto 0);
        B        : in  STD_LOGIC_VECTOR (3 downto 0);
        mode     : in  STD_LOGIC;  -- 0 = add, 1 = subtract
        S        : out STD_LOGIC_VECTOR (3 downto 0);
        c_out    : out STD_LOGIC;
        overflow : out STD_LOGIC
    );
end RCA_4;

architecture Behavioral of RCA_4 is
    component FA
        Port (A, B, C_in : in STD_LOGIC; S, C_out : out STD_LOGIC);
    end component;

    signal Bm : STD_LOGIC_VECTOR(3 downto 0);
    signal C  : STD_LOGIC_VECTOR(4 downto 0);
begin
    Bm <= B xor (mode & mode & mode & mode);
    C(0) <= mode;

    FA0: FA port map(A(0), Bm(0), C(0), S(0), C(1));
    FA1: FA port map(A(1), Bm(1), C(1), S(1), C(2));
    FA2: FA port map(A(2), Bm(2), C(2), S(2), C(3));
    FA3: FA port map(A(3), Bm(3), C(3), S(3), C(4));

    c_out <= C(4);
    overflow <= C(3) xor C(4);
end Behavioral;
