-- Range_module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity range_module is
    Port (

        max_value   : in  UNSIGNED(3 downto 0);
        min_value   : in  UNSIGNED(3 downto 0);

        range_value : out UNSIGNED(3 downto 0)

    );
end range_module;

architecture Behavioral of range_module is

begin

    range_value <= max_value - min_value;

end Behavioral;
