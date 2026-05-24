-- Max_module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity max_module is
    Port (

        num1      : in  UNSIGNED(3 downto 0);
        num2      : in  UNSIGNED(3 downto 0);
        num3      : in  UNSIGNED(3 downto 0);
        num4      : in  UNSIGNED(3 downto 0);
        num5      : in  UNSIGNED(3 downto 0);

        count     : in  UNSIGNED(2 downto 0);

        max_value : out UNSIGNED(3 downto 0)

    );
end max_module;

architecture Behavioral of max_module is

begin

    process(num1, num2, num3, num4, num5, count)

        variable temp_max : UNSIGNED(3 downto 0);

    begin

        temp_max := num1;

        if count > 1 then
            if num2 > temp_max then
                temp_max := num2;
            end if;
        end if;

        if count > 2 then
            if num3 > temp_max then
                temp_max := num3;
            end if;
        end if;

        if count > 3 then
            if num4 > temp_max then
                temp_max := num4;
            end if;
        end if;

        if count > 4 then
            if num5 > temp_max then
                temp_max := num5;
            end if;
        end if;

        max_value <= temp_max;

    end process;

end Behavioral;