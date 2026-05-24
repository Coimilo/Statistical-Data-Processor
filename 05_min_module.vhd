-- Min_module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity min_module is
    Port (

        num1      : in  UNSIGNED(3 downto 0);
        num2      : in  UNSIGNED(3 downto 0);
        num3      : in  UNSIGNED(3 downto 0);
        num4      : in  UNSIGNED(3 downto 0);
        num5      : in  UNSIGNED(3 downto 0);

        count     : in  UNSIGNED(2 downto 0);

        min_value : out UNSIGNED(3 downto 0)

    );
end min_module;

architecture Behavioral of min_module is

begin

    process(num1, num2, num3, num4, num5, count)

        variable temp_min : UNSIGNED(3 downto 0);

    begin

        temp_min := num1;

        if count > 1 then
            if num2 < temp_min then
                temp_min := num2;
            end if;
        end if;

        if count > 2 then
            if num3 < temp_min then
                temp_min := num3;
            end if;
        end if;

        if count > 3 then
            if num4 < temp_min then
                temp_min := num4;
            end if;
        end if;

        if count > 4 then
            if num5 < temp_min then
                temp_min := num5;
            end if;
        end if;

        min_value <= temp_min;

    end process;

end Behavioral;
