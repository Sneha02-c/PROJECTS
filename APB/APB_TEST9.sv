
class apb_test9 extends uvm_test;
`uvm_component_utils(apb_test9)
apb_env env;
apb_seq seq;

function new(string name="apb_test9",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=apb_env::type_id::create("env",this);
seq=apb_seq::type_id::create("seq",this);
set_config_string("env.a1.seqr","cfg","WR");
set_config_string("env.a1.seqr","data_type","decrement");
set_config_string("env.a1.seqr","addr_type","increment");
endfunction

task run_phase(uvm_phase phase);
begin
phase.raise_objection(this,"start of test");
seq.start(env.a1.seqr);
#20;
phase.drop_objection(this,"end of test");
end
endtask
endclass
