#!/bin/bash
#SBATCH --job-name=vpic_cali
#SBATCH --output=test_cali.txt
#SBATCH --time=8:00:00

./build_and_run_vpic
module load use.own
source run_test/bashrc.modules
#Dave's VPIC stuff
prob=lpi

export OMPI_MCA_btl="^openib"

xpre='./'

aprun='srun'

vtime=''
voc=''

cpu_list_rpc2_56_socket_0="0,56,1,57,2,58,3,59,4,60,5,61,6,62,7,63,8,64,9,65,10,66,11,67,12,68,13,69,14,70,15,71,16,72,17,73,18,74,19,75,20,76,21,77,22,78,23,79,24,80,25,81,26,82,27,83"
cpu_list_rpc2_56_socket_1="28,84,29,85,30,86,31,87,32,88,33,89,34,90,35,91,36,92,37,93,38,94,39,95,40,96,41,97,42,98,43,99,44,100,45,101,46,102,47,103,48,104,49,105,50,106,51,107,52,108,53,109,54,110,55,111"

cpu_list_rpc2_32_socket_0="0,56,1,57,2,58,3,59,4,60,5,61,6,62,7,63,8,64,9,65,10,66,11,67,12,68,13,69,14,70,15,71"
cpu_list_rpc2_32_socket_1="28,84,29,85,30,86,31,87,32,88,33,89,34,90,35,91,36,92,37,93,38,94,39,95,40,96,41,97,42,98,43,99"

cpu_list_rpc2_16_socket_0="0,56,1,57,2,58,3,59,4,60,5,61,6,62,7,63"
cpu_list_rpc2_16_socket_1="28,84,29,85,30,86,31,87,32,88,33,89,34,90,35,91"

cpu_list_rpc2_08_socket_0="0,56,1,57,2,58,3,59"
cpu_list_rpc2_08_socket_1="28,84,29,85,30,86,31,87"

cpu_list_rpc2_04_socket_0="0,56,1,57"
cpu_list_rpc2_04_socket_1="28,84,29,85"

cpu_list_rpc2_02_socket_0="0,56"
cpu_list_rpc2_02_socket_1="28,84"

cpu_list_rpc2_01_socket_0="0,56"
cpu_bind_rpc2_56="--cpu_bind=map_cpu:${cpu_list_rpc2_56_socket_0},${cpu_list_rpc2_56_socket_1}"
cpu_bind_rpc2_32="--cpu_bind=map_cpu:${cpu_list_rpc2_32_socket_0},${cpu_list_rpc2_32_socket_1}"
cpu_bind_rpc2_16="--cpu_bind=map_cpu:${cpu_list_rpc2_16_socket_0},${cpu_list_rpc2_16_socket_1}"
cpu_bind_rpc2_08="--cpu_bind=map_cpu:${cpu_list_rpc2_08_socket_0},${cpu_list_rpc2_08_socket_1}"
cpu_bind_rpc2_04="--cpu_bind=map_cpu:${cpu_list_rpc2_04_socket_0},${cpu_list_rpc2_04_socket_1}"
cpu_bind_rpc2_02="--cpu_bind=map_cpu:${cpu_list_rpc2_02_socket_0},${cpu_list_rpc2_02_socket_1}"
cpu_bind_rpc2_01="--cpu_bind=map_cpu:${cpu_list_rpc2_01_socket_0}"

cpu_list_rpc1_56_socket_0="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27"
cpu_list_rpc1_56_socket_1="28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55"

cpu_list_rpc1_32_socket_0="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"
cpu_list_rpc1_32_socket_1="28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43"

cpu_list_rpc1_16_socket_0="0,1,2,3,4,5,6,7"
cpu_list_rpc1_16_socket_1="28,29,30,31,32,33,34,35"

cpu_list_rpc1_08_socket_0="0,1,2,3"
cpu_list_rpc1_08_socket_1="28,29,30,31"

cpu_list_rpc1_04_socket_0="0,1"
cpu_list_rpc1_04_socket_1="28,29"

cpu_list_rpc1_02_socket_0="0"
cpu_list_rpc1_02_socket_1="28"

cpu_list_rpc1_01_socket_0="0"

cpu_bind_rpc1_56="--cpu_bind=map_cpu:${cpu_list_rpc1_56_socket_0},${cpu_list_rpc1_56_socket_1}"
cpu_bind_rpc1_32="--cpu_bind=map_cpu:${cpu_list_rpc1_32_socket_0},${cpu_list_rpc1_32_socket_1}"
cpu_bind_rpc1_16="--cpu_bind=map_cpu:${cpu_list_rpc1_16_socket_0},${cpu_list_rpc1_16_socket_1}"
cpu_bind_rpc1_08="--cpu_bind=map_cpu:${cpu_list_rpc1_08_socket_0},${cpu_list_rpc1_08_socket_1}"
cpu_bind_rpc1_04="--cpu_bind=map_cpu:${cpu_list_rpc1_04_socket_0},${cpu_list_rpc1_04_socket_1}"
cpu_bind_rpc1_02="--cpu_bind=map_cpu:${cpu_list_rpc1_02_socket_0},${cpu_list_rpc1_02_socket_1}"
cpu_bind_rpc1_01="--cpu_bind=map_cpu:${cpu_list_rpc1_01_socket_0}"




#export CALI_CONFIG_FILE=$CALI_DIR/configs/papi_base.conf
#export CALI_CONFIG_FILE=$CALI_DIR/configs/papi_mpi.conf

#declare -a metrics=("PAPI_TOT_CYC")

declare -a metrics=(\
                    "UOPS_EXECUTED:CORE" \
                    "ARITH:DIVIDER_ACTIVE" \
                    "UOPS_DISPATCHED_PORT:PORT_0" \
                    "UOPS_DISPATCHED_PORT:PORT_1" \
                    "UOPS_DISPATCHED_PORT:PORT_2" \
                    "UOPS_DISPATCHED_PORT:PORT_3" \
                    "UOPS_DISPATCHED_PORT:PORT_4" \
                    "UOPS_DISPATCHED_PORT:PORT_5" \
                    "UOPS_DISPATCHED_PORT:PORT_6" \
                    "UOPS_DISPATCHED_PORT:PORT_7" \
                    "PARTIAL_RAT_STALLS:SCOREBOARD" \

     "IDQ_UOPS_NOT_DELIVERED:CORE"\
     "INST_RETIRED:PREC_DIST"\
     "IDQ:MS_UOPS"\
     "FP_ARITH_INST_RETIRED:SCALAR_SINGLE"\
     "FP_ARITH_INST_RETIRED:128B_PACKED_SINGLE"\
     "FP_ARITH_INST_RETIRED:256B_PACKED_SINGLE"\
     "FP_ARITH_INST_RETIRED:512B_PACKED_SINGLE"\

                    "PAPI_TOT_CYC" \
                    "IDQ_UOPS_NOT_DELIVERED:CORE"\
                    "UOPS_ISSUED:ANY"\
                    "UOPS_RETIRED:RETIRE_SLOTS"\
                    "INT_MISC:RECOVERY_CYCLES"\
                    "CYCLE_ACTIVITY:STALLS_MEM_ANY"\
                    "RESOURCE_STALLS:SB"\
                    "UOPS_EXECUTED:CORE_CYCLES_GE_1" \
                    "UOPS_EXECUTED:CORE_CYCLES_GE_2" \
                    "UOPS_EXECUTED:CORE_CYCLES_GE_3" \
		    "UOPS_EXECUTED:CORE_CYCLES_GE_4" \
		    "EXE_ACTIVITY:BOUND_ON_STORES" \
		    "EXE_ACTIVITY:EXE_BOUND_0_PORTS" \
                    "CYCLE_ACTIVITY:STALLS_L1D_MISS" \
                    "CYCLE_ACTIVITY:STALLS_L2_MISS" \
                    "CYCLE_ACTIVITY:STALLS_L3_MISS" \
                    "PAPI_STL_CCY" \

                    "RS_EVENTS:EMPTY_CYCLES" \
                    "CYCLE_ACTIVITY:STALLS_TOTAL"\
                    "CYCLE_ACTIVITY:CYCLES_MEM_ANY" \
                    "RESOURCE_STALLS:ALL" \
                    "RESOURCE_STALLS:ANY" \
                   )




#out_dir=cali_test
#out_dir=cali_avx512_flags
#out_dir=cali_no_vec
out_dir=cali_vpic
#exe="./run_vpic_int_sky_28_scaling_strong_srun_mpi"

#version=v1_none
#version=v4_port
#version=v8_port
#version=v16_port

#version=v1_none_nosort
#version=v4_port_nosort
#version=v8_port_nosort
#version=v16_port_nosort
#
#version=v4_avx2
version=v8_avx2
#version=v16_avx512
#
#version=v4_avx2_nosort
#version=v8_avx2_nosort
#version=v16_avx512_nosort


dir_rpc2=cali_vpic_${version}_2rpc
dir_rpc1=cali_vpic_${version}_1rpc

mkdir ${dir_rpc2}
mkdir ${dir_rpc1}

export OMP_PROC_BIND=close
export OMP_PLACES=cores

export CALI_SERVICES_ENABLE=trace,event,papi,mpi,mpireport

cd run_test
for metric in "${metrics[@]}"
do    
    export CALI_MPIREPORT_CONFIG="SELECT *,sum(papi.${metric}) GROUP BY prop:nested,mpi.rank FORMAT json"
    export CALI_PAPI_COUNTERS=${metric}
    
    export CALI_MPIREPORT_FILENAME=../${dir_rpc2}/cali_${metric}.json
    ${aprun} -n 112 -N 1 ${cpu_bind_rpc2_56} ${voc} ${vtime} ${xpre}${prob}_ddr_nn_0001_nppn_112_ntpp_001.Linux --tpp 1 >& ${prob}_ddr_nn_0001_nppn_112_nrpc_002.log

    export CALI_MPIREPORT_FILENAME=../${dir_rpc1}/cali_${metric}.json
    ${aprun} -n  56 -N 1 ${cpu_bind_rpc1_56} ${voc} ${vtime} ${xpre}${prob}_ddr_nn_0001_nppn_056_ntpp_001.Linux --tpp 1 >& ${prob}_ddr_nn_0001_nppn_056_nrpc_001.log
    

done
cd ..




