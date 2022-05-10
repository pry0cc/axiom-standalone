#!/bin/bash

vagrant up
vagrant package
vagrant box add -f package.box --name axiom-local
vagrant destroy

echo "Image built and saved"
