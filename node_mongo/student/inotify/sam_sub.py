#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import subprocess
cmd = "ls -lt | head -n 5"
subprocess.call( cmd, shell=True  ) 
