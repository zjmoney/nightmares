library verilog;
use verilog.vl_types.all;
entity leavingUranus_testbench is
    generic(
        CLOCK_PERIOD    : integer := 100;
        ONE_SEC         : integer := 390625
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of ONE_SEC : constant is 1;
end leavingUranus_testbench;
