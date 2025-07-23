class ifx_dig_INT_ST extends ifx_dig_testbase;

    `uvm_component_utils(ifx_dig_INT_ST)

    function new(string name = "ifx_dig_INT_ST", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `TEST_INFO("Run phase started")
    endtask
    string fields[$];
    int ireg;

    task main_phase(uvm_phase phase);
        phase.raise_objection(this);

        super.main_phase(phase); 

        `TEST_INFO("Main phase started")

    for (int addr=0; addr < 2**`AWIDTH; addr++) begin

            `TEST_INFO($sformatf("Write all 1's to address %b", addr))
            data_bus_write_seq.address = addr;
            data_bus_write_seq.data = 8'hFF;
            data_bus_write_seq.start(dig_env.data_bus_uvc_agt.sequencer);
            
            `WAIT_NS(20)

            `TEST_INFO($sformatf("Read from address %b", addr))
            data_bus_read_seq.address = addr;
            data_bus_read_seq.start(dig_env.data_bus_uvc_agt.sequencer);
    end

            write_reg_fields(
                .reg_name($sformatf("INT_STATUS%0d", ireg)),
                .fields_names({fields}),
                .fields_values({1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}),
                .read_after_write(1)
            );
            phase.drop_objection(this);
    endtask
endclass