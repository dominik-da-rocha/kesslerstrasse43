#!/bin/bash

file=kesslerstrasse43
echo "$(cat $file.crt)" > kesslerstrasse43.full.crt
echo "$(cat $file.inter.crt)" >> kesslerstrasse43.full.crt
echo "$(cat $file.root-ca.crt)" >> kesslerstrasse43.full.crt
