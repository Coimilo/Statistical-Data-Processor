-- Seven_segment_driver
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_segment_driver is
    Port (

        bcd_in   : in  UNSIGNED(3 downto 0);

        segments : out STD_LOGIC_VECTOR(6 downto 0);
        dp       : out STD_LOGIC

    );
end seven_segment_driver;

architecture Behavioral of seven_segment_driver is

begin
    
    dp <= '1';
    process(bcd_in)

    begin

        case bcd_in is

            -------------------------------------------------
            -- abcdefg
            -------------------------------------------------

            when "0000" =>  -- 0
                segments <= "0000001";

            when "0001" =>  -- 1
                segments <= "1001111";

            when "0010" =>  -- 2
                segments <= "0010010";

            when "0011" =>  -- 3
                segments <= "0000110";

            when "0100" =>  -- 4
                segments <= "1001100";

            when "0101" =>  -- 5
                segments <= "0100100";

            when "0110" =>  -- 6
                segments <= "0100000";

            when "0111" =>  -- 7
                segments <= "0001111";

            when "1000" =>  -- 8
                segments <= "0000000";

            when "1001" =>  -- 9
                segments <= "0000100";
                
            when "1100" => -- E
                segments <= "1001111";
                
            when "1111" => -- r
                segments <= "0111001";

            when others =>

                segments <= "1111111";

        end case;

    end process;

end Behavioral;
