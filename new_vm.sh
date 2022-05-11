#!/bin/bash

name="$1"
pat="/home/op/vms/$name"

mkdir -p "$pat"
cd "$pat"

vagrant init axiom-local
vagrant up 
