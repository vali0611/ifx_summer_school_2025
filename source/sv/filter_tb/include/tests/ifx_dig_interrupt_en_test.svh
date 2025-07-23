class ifx_dig_interrupt_en_test extends ifx_dig_testbase;
    `uvm_component_utils(ifx_dig_interrupt_en_test)
    int filter_list[$];

function new(string name = "ifx_dig_interrupt_en_test", uvm_component parent);
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
        super.main_phase(phase);

        `TEST_INFO("Main phase started")



    for(int ifilt = 1; ifilt <= `FILT_NB; ifilt++) begin
            filter_list.push_back(ifilt);
        end
        filter_list.shuffle();

        foreach(filter_list[ifilt]) begin

            `TEST_INFO($sformatf("Testing filter: %0d. Configure randomly the filter, except the filter type and interrupt enable", filter_list[ifilt]))
            configure_filter(
                .filt_idx(filter_list[ifilt]),
                .int_en(`RAND_1BIT)
            );
        `TEST_INFO($sformatf("Drive a valid pulse length on filter: %0d", filter_list[ifilt]))
            pin_filter_valid_pulse_seq.start(dig_env.v_seqr.p_pin_filter_uvc_seqr[filter_list[ifilt] - 1]);
            `WAIT_NS(20)
        read_filter_status(0);
            clear_filter_status(filter_list[ifilt]);
            `WAIT_NS(100)
        end
            `WAIT_NS(100)

    phase.drop_objection(this);
    endtask
endclass