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
col = client[db]['students']
col.insert_one({'test': 'testtest'})

id=""
date=""
dir=""
cmd=""
res=[]

pattern = r"\^\[\]0\;"

file = open('cmd.log', 'r')  
logs = file.readlines()

for string in logs:
    match = re.match(pattern , string)
    if match:
	col = client[db]['students']
        col.insert_one({'id': id, 'date': date, 'dir': dir, 'cmd': cmd, 'res': res })
	word = string.split(" ", 3)
	date=word[0][len(word[0])-19:]
	id=word[1][len(word[1])-5:]
	dir=word[2][:1]
	cmd=word[3][:-4]
	res=[]
    else:
	res.append(string) 
    string = file.readline()
