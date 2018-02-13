#!/usr/bin/env python
# -*- coding:utf-8 -*-

import pymongo
import sys
import re

host = 'db'
port = 27017
db = 'test'
user = 'teacher'
pwd = 'rehcaet'
client = pymongo.MongoClient(host, port)
client[db].authenticate(user, pwd)
col = client[db]['cmd']

id=""
date=""
dir=""
cmd=""
res=[]
flag=0

pattern1 = r"m*0\;"
pattern2 = r"vi *" 

file = open('cmd.log', 'r')  
logs = file.readlines()
for string in logs:
    match1 = re.match(pattern1 , string)
    if match1:
	col = client[db]['cmd']
        col.insert_one({'id': id, 'date': date, 'dir': dir, 'cmd': cmd, 'res': res })
	word = string.split(" ", 3)
	date = word[0][len(word[0])-19:]
	id = word[1][len(word[1])-5:]
	print id
	dir = word[2][:-1]
	print dir 
	cmd = word[3][:-1]
	print cmd 
        res=[]
    else:
	res.append(string) 
    logs = file.readlines()
