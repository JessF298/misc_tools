#!/bin/bash
#$1 is the name ofthe run"
#$2 is the memory i.e. 2G
#$3 is the number of threads
#$4 is the email address - change the email domain below.
#$5 is the partition

if [ "$#" -ne 5 ]; then
    echo "subheader.sh - a generic script to print out a Slurm submission file." 
    echo "Use sinfo (with --all or --partition) to find information about the partitions."
    echo "Script usage:"
    echo "subheader.sh <Run Name> <Max Memory in GB> <Number of Threads> <Email/User> <partition>"
    echo ""
    echo "i.e. subheader.sh my_amazing_job 10 8 jess.friedersdorff amd"
else
    mydir=$(pwd)
    echo "#!/bin/bash --login"  # Tell slurm how to run the script below - set to bash, can also set to shell or zsh.
    echo "#SBATCH --error=${mydir}/${1}_%J.err"  # Set name of stderr, will use job id. 
    echo "#SBATCH --output=${mydir}/${1}_%J.output"  # Set name of stdout, will use job id. 
    echo "#SBATCH --partition=${5}"  # Select the partition - use sinfo on the CL to find info about this. 
    echo "#SBATCH --nodes=1"  # Number of nodes
    echo "#SBATCH --ntasks=1"  # Number of CPUs but not necessairly on the same node - for OMP. 
    echo "#SBATCH --cpus-per-task=${3}"  # Number of CPUs on same node - for multithreading. 
    echo "#SBATCH --job-name=${1}"  # Job name - you choose. 
    echo "#SBATCH --mail-type=END,FAIL"  # Set to email on end and fail. [NONE, BEGIN, END, FAIL, REQUEUE, ALL]
    echo "#SBATCH --mail-user=${4}@email.com"  # Change this to correct email address.
    echo "#SBATCH --mem=${2}gb"  # Integer number of gb of memory. 
    #echo "#SBATCH --account=hpcuser"

 fi
