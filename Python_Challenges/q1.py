#!/bin/usr/env python3


# Open a file
datafile=open("../DataFiles/hosts.real")

# Read the file line by line
counter=1
for line in datafile:
    if(line=='\n'):
        continue
    # if(line[-1]=='EOF'):
    #     print(str(counter)+": "+line.rstrip(),end='')
    
    print(str(counter)+": "+line.rstrip())
    wordlist=line.split()
    print(wordlist)
    new_line = '\t'.join(wordlist)
    print(new_line)
    # print(str(counter)+": "+line,end='')
    counter+=1
    break 

datafile.close()