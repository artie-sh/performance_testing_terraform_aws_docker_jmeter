#!/bin/bash

ssh-keygen -t rsa -b 4096 -f $PWD/qa_load_keypair -N ""
chmod 400 $PWD/qa_load_keypair
