library ieee;
use ieee.std_logic_1164.all;

entity FFJK is

    port(

        j, k   : in std_logic;
        clock  : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic

    );

end;

architecture FF of FFJK is

    signal s_snj , s_snk    : std_logic;
    signal s_sns , s_snr    : std_logic;
    signal s_sns2 , s_snr2  : std_logic;
    signal s_eloS , s_eloR  : std_logic;
    signal s_eloQ , s_elonQ : std_logic;
    signal s_nClock         : std_logic;

begin

    s_nClock <= not clock;

    --s_snj
    s_snj <= not(j and clock and s_elonQ);

    --s_snk
    s_snk <= not(k and clock and s_eloQ);

    --s_sns
    s_sns <= not(s_snj and pr and s_eloR);

    --s_snr
    s_snr <= not(s_snk and cl and s_eloS);

    --s_sns2
    s_sns2 <= s_sns nand s_nClock;

    --s_snr2
    s_snr2 <= s_snr nand s_nClock;

    --s_eloS
    s_eloS <= not(s_snj and pr and s_eloR);

    --s_eloR
    s_eloR <= not(s_snk and cl and s_eloS);

    --s_eloQ
    s_eloQ <= not(s_sns2 and s_elonQ and pr);

    --s_elonQ
    s_elonQ <= not(s_eloQ and s_snr2 and cl);

    --Q ~Q
    q <= not(s_sns2 and s_elonQ and pr);
    nq <= not(s_eloQ and s_snr2 and cl);

end architecture;