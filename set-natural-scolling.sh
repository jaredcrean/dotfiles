#!/bin/bash

device_name="GameBall"
input_num=`xinput list|grep -i ${device_name}|grep pointer|awk '{print $5}'|awk -F = '{print $2}'`

if [ "${input_num}" != '0' ];then
  echo "Setting Natural Scrolling Enabled"
  xinput --set-prop "${input_num}" "libinput Natural Scrolling Enabled" 1
else
  echo "No Device found"
fi
