#!/bin/bash
curPath=$(pwd)
cd $curPath/../hadi2f244/free_me/
source .venv/bin/activate
echo "Packaging hadi2f244.freeme collection ..."
targzFile=$(make fbuild | sed -n 's/.* \([^ ]*\.tar\.gz\).*/\1/p')
echo "Copying" $(echo $targzFile|grep -oP '[^/]+\.tar\.gz')
cp $targzFile $curPath
cd $curPath
deactivate
source .venv/bin/activate
echo "Force installing hadi2f244.freeme collection ..."
ansible-galaxy collection install -f $targzFile -p ./collections