#!/bin/bash

function shutdown_daemons()
{
 cd ~/ganja > /dev/null 2>&1
 ./ganjacoin-cli stop > /dev/null 2>&1 
 cd ~ > /dev/null 2>&1
}

function remove_olddaemons()
{
 echo -e "Removing old daemons"
 cd ~/ganja > /dev/null 2>&1
 rm -r ganjacoind > /dev/null 2>&1
 rm -r ganjacoin-cli > /dev/null 2>&1
 cd ~ > /dev/null 2>&1
 echo -e "done removing old daemons"
}

function download_daemons()
{
 echo -e "downloading new clients & setting permissions"
 cd ~/ganja > /dev/null 2>&1
 wget https://ganjacoinpro.com/downloads/ganjacoind > /dev/null 2>&1
 wget https://ganjacoinpro.com/downloads/ganjacoin-cli > /dev/null 2>&1
 chmod +x ganjacoin-cli
 chmod +x ganjacoind > /dev/null 2>&1
 cd ~ > /dev/null 2>&1

 echo -e "done downloading & setting permissions"
}

function start_daemons()
{
 cd ~/ganja > /dev/null 2>&1
 ganjacoind -reindex > /dev/null 2>&1
 cd ~ > /dev/null 2>&1

}

function check_daemons()
{
 cd ~/ganja > /dev/null 2>&1
 ganjacoin-cli getinfo

}

function deploy()
{
  shutdown_daemons
  remove_olddaemons
  download_daemons
  start_daemons
  check_daemons
}

deploy
