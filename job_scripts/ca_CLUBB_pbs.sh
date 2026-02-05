#!/bin/bash
# ==============================================================================
# SUBMISSION NOTE: This job MUST be submitted from a Casper login node.
# Step 1: ssh casper.ucar.edu
# Step 2: qsub this_script.pbs
# ==============================================================================

#PBS -N scm_gpu_casper
#PBS -A NAML0001
#PBS -q casper
#PBS -j oe
#PBS -o /dev/null
### Specify the output file name and path
#PBS -o CLUBB_results_%j.log
#PBS -l walltime=01:00:00
#PBS -l select=1:ncpus=4:ngpus=1:gpu_type=v100
LOG=/glade/u/home/ilinck/clubb_release/output/CLUBB_results_${PBS_JOBID}.log
exec > "$LOG" 2>&1

### Set OpenMP threads
export OMP_NUM_THREADS=4

### Step 1: Compile
## Note: Don’t compile inside this batch job unless you must. 
## Compiling on compute nodes burns allocation time and often causes avoidable queue contention. 
## Compile once (login node or an interactive job if required), then run in batch.
## /glade/u/home/ilinck/clubb_release/compile/compile.bash -c /glade/u/home/ilinck/clubb_release/compile/config/linux_x86_64_nvhpc_gpu_openacc.bash

### Step 2: Run
/glade/u/home/ilinck/clubb_release/run_scripts/run_scm.bash -e arm