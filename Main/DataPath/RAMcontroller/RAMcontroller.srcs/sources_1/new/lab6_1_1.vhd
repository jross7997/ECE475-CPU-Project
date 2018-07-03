library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab6_1_1 is
    Port (  Clk     : in STD_LOGIC;
            D       : in STD_LOGIC_VECTOR(3 downto 0);
            reset   : in STD_LOGIC;
            load    : in STD_LOGIC;
            Q       : out STD_LOGIC_VECTOR(3 downto 0)
            );
end lab6_1_1;

architecture Behavioral of lab6_1_1 is
    
    signal Dsig : std_logic_vector(3 downto 0);
    signal Qsig : std_logic_vector(3 downto 0);

    begin
    process (clk)
        begin
        Dsig <= D;
        if rising_edge(clk) then
            if (reset = '1') then
                Qsig <= "0000";
                Q <= Qsig;
            elsif (load = '1') then
                Qsig <= Dsig;
                Q <= Qsig;
            end if;
        end if;
    end process;

end Behavioral;
