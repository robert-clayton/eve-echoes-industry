#!/bin/bash

py -3.9 -m venv .venv
cd .venv/Scripts
. activate
cd ../..
pip install -r requirements.txt
