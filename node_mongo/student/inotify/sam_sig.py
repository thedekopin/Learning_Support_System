#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import signal
import time
import subprocess

def task1():
    cmd = "/inotify/cmd.sh"
    subprocess.call( cmd, shell=True  )

def task2():
    cmd = "/inotify/t.py"
    subprocess.call( cmd, shell=True )

def task(arg1,arg2):
    task1()
    task2()

signal.signal(signal.SIGALRM, task)
signal.setitimer(signal.ITIMER_REAL, 0.1, 10)

while True:
    time.sleep(1)
