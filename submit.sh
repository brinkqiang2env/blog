#!/bin/bash
printf "提交备注:";
read remark;
git add . && git commit -m "$remark" && git pull origin master && git push origin master
