

UVM_TC_NAME   = 
pl             =UVM_MEDIUM
SIM_ARGE       = -verbosity $(pl)

BUILD_ARGS     = -kdb -2step -vcsop ""-debug_accessall" -vcsop -error=no0PD
COV_ARGS      = -cov -vcsop '"-cm_hier ./testbench/sctripts/hier.f"'
SUBMIT         = $(notdir $(CURDIR))
QUEUE          =
DUMP_FILE      =dump_wave.tcl

BSUB_ARGS      = -Is -q $(QUEUE) 
TARGET_ARGS    = $(UVM_TC_NAME)
wave           ?=0
init           ?=1

ifdef seed
   SEED = $(seed)`
   BUILD_ARGS += -seed $(seed)
endif

ifdef ($(debug,1))
   SIM_ARGS =  -simop +DEBUG 
endif


ifdef tc
  UVM_TC_NAME = $(tc)
endif 

ifdef ($(init,1))
  BUILD_ARGS += -vcsop +vcs +initreg+random
  SIM_ARGS   += -simop -report=xprop(+exit)
endif

build: bsub $(BSUB_ARGS) bv build -s $(SUBMIT) $(BUILD_ARGS) $(COV_AGEGS)

sim  : bsub $(BSUB_ARGS) bv sim -s $(SUBMIT) $(COV_AGES) $(SIM_ARGS) -simop +UVM_TESTNAME=$(UVM_TC_NAME) -t $(TARGET_ARGS)

run: build sim

clean:

