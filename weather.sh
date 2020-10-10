#!/bin/sh

set -eux

CITY=xian
LANGUAGE="zh-CN"
UNIT=m
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36"

curl \
  -H "Accept-Language: $LANGUAGE" \
  -H "User-Agent: $UA" \
  -o result.html \
  wttr.in/$CITY?format=3\&$UNIT

pwd
cmd=`cat result.html`
result=`$cmd`
echo ${#result}
var=$($cmd|tr -cd "[0-9]")
var="西安天气:"$var"度"
cms="curl https://sc.ftqq.com/SCU74130T5810c8803a0fde3ad8e07301a58a26ff5e096d2e5c44a.send?text=$var"
result=`$cms`


