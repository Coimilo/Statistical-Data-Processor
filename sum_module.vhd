-- Sum_module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sum_module is
    Port (

        num1      : in  UNSIGNED(3 downto 0);
        num2      : in  UNSIGNED(3 downto 0);
        num3      : in  UNSIGNED(3 downto 0);
        num4      : in  UNSIGNED(3 downto 0);
        num5      : in  UNSIGNED(3 downto 0);

        count     : in  UNSIGNED(2 downto 0);

        sum_value : out UNSIGNED(6 downto 0)

    );
end sum_module;

architecture Behavioral of sum_module is

begin

    process(num1, num2, num3, num4, num5, count)

        variable temp_sum : UNSIGNED(6 downto 0);

    begin

        temp_sum := (others => '0');

        if count > 0 then
            temp_sum := temp_sum + resize(num1, 7);
        end if;

        if count > 1 then
            temp_sum := temp_sum + resize(num2, 7);
        end if;

        if count > 2 then
            temp_sum := temp_sum + resize(num3, 7);
        end if;

        if count > 3 then
            temp_sum := temp_sum + resize(num4, 7);
        end if;

        if count > 4 then
            temp_sum := temp_sum + resize(num5, 7);
        end if;

        sum_value <= temp_sum;

    end process;

end Behavioral;