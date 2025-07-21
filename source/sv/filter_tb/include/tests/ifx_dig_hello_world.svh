/******************************************************************************
 * (C) Copyright 2025 All Rights Reserved
 *
 * MODULE:
 * DEVICE:
 * PROJECT: SUMMER_SCHOOL_2025
 * AUTHOR:
 * DATE:
 * FILE:
 * REVISION:
 *
 * FILE DESCRIPTION:
 *
 *******************************************************************************/

class ifx_dig_hello_world extends ifx_dig_testbase;

    `uvm_component_utils(ifx_dig_hello_world)


 

    function new(string name = "ifx_dig_hello_world", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        `TEST_INFO("Run phase started")
    endtask

    task main_phase(uvm_phase phase);
        phase.raise_objection(this);

        super.main_phase(phase); // call default main phase, contains reset

        `TEST_INFO("Main phase started")

        #100us;

        drive_reset(.use_clock_cycle(1), .numb_of_clocks(20));

        #100us;

        // TODO: go through the filters and test them as described in requirement
        


        phase.drop_objection(this);
    endtask

endclass