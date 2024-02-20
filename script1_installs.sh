#!/bin/env bash


echo "run this by using source NOT ./script1_installs.sh"

#read -p "Please provide the server host (e.g. zlinsco@pc533.emulab.net): " user

# Update, htop, and screen install
echo "Updating... Additionally, installing htop and screen"
sudo apt-get update
sudo install htop
sudo install screen

# Install miniconda
echo "Installing miniconda."
mkdir -p ~/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh

bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

rm -rf ~/miniconda3/miniconda.sh

echo 'export PATH="~/miniconda/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

source ~/miniconda3/etc/profile.d/conda.sh

# Ask user for environment name they want
read -p "Enter the name for the conda env: " name
read -p "Enter the python version to use: " ver
conda create --name $name python=$ver
conda activate $name

# Jupyter Notebook install
echo "Time to install jupyter notebook."
conda install -c conda-forge notebook
conda install -c conda-forge nb_conda_kernels
conda install nb_conda

conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cpuonly -c pytorch
# Future implementation:

#ssh -X zlinsco@node0
#while true; 
#do

#read -p "Do you wish to start a Jupyter Notebook? [y,n] " yn
#case "$yn" in
#        Y|y )   cmd1="jupyter notebook --no-browser --port=5910"
#                cmd2="ssh -L 5555:localhost:5910 $user"
#                cmd3="xterm -hold -e $cmd2"
#                readarray -t lines < <($cmd)
#                for line in "${lines[@]}";
#                do
#                        echo $line
#                        if [[ $line = *"localhost:"* ]];
#                        then
#                                echo $line
#                                jup_link=$line
#
#                       fi
#                done

#                bash -c $cmd3;;

#        N|n )   echo "Cool, see ya later..."
#                break;;
#esac

#done       

# run this by using source
#  pip uninstall traitlets
# pip install traitlets==5.9.0
# if running python 3.9

