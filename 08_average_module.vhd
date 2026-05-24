-- Average_module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity average_module is
    Port (

        sum_value     : in  UNSIGNED(6 downto 0);

        count         : in  UNSIGNED(2 downto 0);

        average_value : out UNSIGNED(3 downto 0)

    );
end average_module;

architecture Behavioral of average_module is

begin

    process(sum_value, count)

        variable temp_avg : UNSIGNED(3 downto 0);

    begin

        temp_avg := (others => '0');

        if count /= 0 then

            temp_avg := resize(sum_value / count, 4);

        end if;

        average_value <= temp_avg;

    end process;

end Behavioral;
