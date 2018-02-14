#!/usr/bin/env python3 
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
col = client[db]['cmds']

id=""
date=""
dir=""
cmd=""
res=[]
flag=0

pattern1 = r"\^\[\]0\;"
pattern2 = r"*vim*" 
pattern3 = r"\^H\^\[\[K"
pattern4 = r"\^H"
 
file = open('/inotify/cmd.log', 'r') 
string = file.readline() 
while string:
	match1 = re.match(pattern1, string)
	if match1: 
		#match2 = re.search(pattern2, string)
		#if not match2:
		col.update_many({'id': id, 'date': date, 'dir': dir, 'cmd': cmd, 'res': res },{'$setOnInsert':{'id': id, 'date': date, 'dir': dir, 'cmd': cmd, 'res': res }},upsert=True)
		word=string.split(' ', 3)
		if len(word) == 4:
			id = word[1][len(word[1])-5:]
			date = word[0][len(word[0])-19:]
			dir = word[2][:-1]
			cmd = word[3][:-1]
			match3 = re.search(pattern3, cmd)
			match4 = re.search(pattern4, cmd)
			while match3:
				cmd = cmd.replace(cmd[match3.start()-1:match3.end()], "")
				match3 = re.search(pattern3, cmd) 
		res = []
	else:
		res.append(string)
	string = file.readline()
