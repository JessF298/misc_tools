#!/bin/bash
#$1 is the name ofthe run"
#$2 is the memory i.e. 2G
#$3 is the number of threads
#$4 is the email address - change the email domain below.
#$5 is the partition

if [ "$#" -ne 5 ]; then
    echo "subheader.sh - a generic script to print out a Slurm submission file. "
    echo "Script usage:"
    echo "subheader.sh <Run Name> <Max Memory in GB> <Number of Threads> <Email/User> <partition>"
    echo ""
    echo "i.e. subheader.sh my_amazing_job 10 8 jess.friedersdorff amd"
else
    mydir=$(pwd)
    echo "#!/bin/bash --login"
    echo "#SBATCH --error=${mydir}/${1}_%J.err"
    echo "#SBATCH --output=${mydir}/${1}_%J.output"
    echo "#SBATCH --partition=${5}"
    echo "#SBATCH --nodes=1"
    echo "#SBATCH --ntasks=1"
    echo "#SBATCH --cpus-per-task=${3}"
    echo "#SBATCH --job-name=${1}"
    echo "#SBATCH --mail-type=END,FAIL"
    echo "#SBATCH --mail-user=${4}@email.com"
    echo "#SBATCH --mem=${2}gb"
    #echo "#SBATCH --account=hpcuser"

 fi
