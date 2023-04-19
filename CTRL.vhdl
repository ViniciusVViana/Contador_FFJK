library ieee;
use ieee.std_logic_1164.all;

entity CTRL is
    port(
        Q : in std_logic_vector(2 downto 0);
        J : out std_logic_vector(2 downto 0);
        K : out std_logic_vector(2 downto 0)
    );
end entity;

architecture CONTROLAR of CTRL is
begin
    J(2) <= Q(1) and not(Q(0));
    J(1) <= Q(0);
    J(0) <= '1';

    K(2) <= not(Q(0)) or Q(1);
    K(1) <= not(Q(0)) or Q(2);
    K(0) <= not(Q(2)) and Q(1);
end architecture;