#!/bin/bash
nano temptweet.txt
t update "`cat temptweet.txt`"
rm -f temptweet.txt
