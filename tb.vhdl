library ieee;
use ieee.std_logic_1164.all;
entity tb is
-- entidade vazia
end tb;
architecture test of tb is
    constant CLK_PERIOD : time := 20 ns;

    component contador is 
    port(
        clk, reset: in std_logic;
        c: out std_logic_vector(2 downto 0)
    );
    end component;
    
    signal sclk : std_logic := '1';
    signal sReset: std_logic;
    signal sZ: std_logic_vector(2 downto 0);
begin

    u_cont: contador port map(sclk, sReset,sZ);
    
    u_teste: process
    begin
        sReset <= '0';

        wait for 20 ns;

        sReset <= '1';

        wait for 20 ns;

        wait for 20 ns;
    
        wait for 20 ns;
    
        wait for 20 ns;

        wait for 20 ns;

        wait for 20 ns;

        wait for 20 ns;

    end process;

    -- process para Clock
    tbp1 : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;


end architecture test;
