#! /bin/bash
MAINPATH=$(pwd)
cd medusa-store-admin
git pull origin main
cd $MAINPATH
cd medusa-store-frontend
git pull origin main 
