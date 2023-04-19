library ieee;
use ieee.std_logic_1164.all;

entity TB is
end entity;

architecture TESTE of TB is
    constant CLK_PERIOD : time := 20 ns;
    component CONTADOR is
        port(
            clk, reset : in std_logic;
            z : out std_logic_vector(2 downto 0)
        );
    end component;
    signal sclk : std_logic := '1';
    signal sreset : std_logic;
    signal sz : std_logic_vector(2 downto 0);
begin
    u_CONTADOR : CONTADOR port map(sclk, sreset, sz);

    u_teste: process
    begin
        sreset <= '0';
        wait for CLK_PERIOD;
        sreset <= '1';
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
    end process;

    u_clk : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;

end architecture;