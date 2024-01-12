library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity toplevel is
	port (
		CLK                         : in  std_logic:= '0'; --                       clk.clk
		leds : out std_logic_vector(7 downto 0);        -- pio_0_external_connection.export
		RESET                   : in  std_logic:= '0';  --                     reset.reset_n
		BTN   : in  std_logic ;--   btn_external_connection.export
		SWITCHES                  : in  std_logic_vector(7 downto 0) := (others => '0')  --                  switches.export
	);
end entity toplevel;

architecture rtl of toplevel is

	component lab1 is
		port (
			clk_clk                          : in  std_logic:= 'X'; -- clk
			pio_0_external_connection_export : out std_logic_vector(7 downto 0);        -- export
			reset_reset_n                    : in  std_logic:= 'X';  -- reset_n
			btn_external_connection_export   : in  std_logic;                     -- export
			switches_export                  : in  std_logic_vector(7 downto 0) := (others => 'X')  -- export
		);
	end component lab1;
begin

	u0 : component lab1
		port map (
			clk_clk                          => CLK ,                          --clk.clk
			pio_0_external_connection_export => leds, -- pio_0_external_connection.export
			reset_reset_n                    => RESET,                      --reset.reset_n
			btn_external_connection_export   => BTN,    --   btn_external_connection.export
			switches_export                  => SWITCHES                  --                  switches.export
		);

end architecture;