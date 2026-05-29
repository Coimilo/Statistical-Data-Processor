-- Binary_to_bcd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binary_to_bcd is
    Port (

        binary_value : in  UNSIGNED(6 downto 0);
        error        : in STD_LOGIC;

        tens         : out UNSIGNED(3 downto 0);
        unit_s        : out UNSIGNED(3 downto 0)

    );
end binary_to_bcd;

architecture Behavioral of binary_to_bcd is

begin

    process(binary_value, error)

        variable temp_int : integer;

        variable t : integer;
        variable u : integer;

    begin
        
        if error = '1' then
        
        tens <= "1100";

        unit_s <= "1111";
        
        else
        
        temp_int := to_integer(binary_value);

        t := temp_int / 10;

        u := temp_int mod 10;

        tens <= to_unsigned(t, 4);

        unit_s <= to_unsigned(u, 4);
        
        end if;
        
    end process;

end Behavioral;
