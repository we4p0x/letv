#!/bin/bash
#Power by xwt
#Last edit 2014-08-08 11:10:15
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/root/bin

####避免雪崩效应做一个sleep操作

sleep $((RANDOM%1800+1))

#重启前校验nginx配置是否正确
if /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf -t >/dev/null 2>&1;then

killall -9 nginx
killall -9 nginx
nc -z -r 127.0.0.1 80 >/dev/null

  if [ $? -ne 0 ]
  then
	livemem_mount_type="`mount |grep livemem |awk '{print $5}'`"
	livemem_type="tmpfs"
	
	if [ "$livemem_mount_type" != "$livemem_type"  ]
	then
			killall -9 nginx
			killall -9 watchdog 
			sleep 2
			umount /livemem
			umount /livemem
       			if [ ! -d /livemem ]
        		then
                	mkdir  /livemem
        		fi
			mount |grep livemem 2>&1 >/dev/null	
			if [ $? -eq 0 ]
			then
			if [ ! -d /livemem/live/live_temp ]
                        then
                        mkdir -p /livemem/live/live_temp
                        fi
			else
			mount -t tmpfs -o size=$(cat /proc/meminfo|grep MemTotal|awk '{printf"%d",$2/1000000-10}')G,mode=0755 tmpfs /livemem
       			if [ ! -d /livemem/live/live_temp ]
        		then
               		mkdir -p /livemem/live/live_temp 
        		fi
			fi
		/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
	else
                while `ps aux |grep '/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf' |grep -qv grep `
                do
                        killall -9 nginx
                        sleep 2
                done
                while `ps aux |grep '/usr/local/sbin/watchdog' |grep -qv grep `
                do
                        killall -9 watchdog
                        sleep 2
                done
                if [ ! -d /livemem/live/live_temp ]
                then
                mkdir -p /livemem/live/live_temp
                fi
		/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf;/usr/local/sbin/watchdog
	fi
else
        livemem_mount_type="`mount |grep livemem |awk '{print $5}'`"
        livemem_type="tmpfs"

        if [ "$livemem_mount_type" != "$livemem_type"  ]
        then
                while `ps aux |grep '/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf' |grep -qv grep `
		do
                        killall -9 nginx
                        killall -9 watchdog
                        sleep 2
                        umount /livemem
                        umount /livemem
                        if [ ! -d /livemem ]
                        then
                        mkdir  /livemem
                        fi
                        mount |grep livemem 2>&1 >/dev/null
                        if [ $? -eq 0 ]
                        then
                        if [ ! -d /livemem/live/live_temp ]
                        then
                        mkdir -p /livemem/live/live_temp
                        fi
                        else
			mount -t tmpfs -o size=$(cat /proc/meminfo|grep MemTotal|awk '{printf"%d",$2/1000000-10}')G,mode=0755 tmpfs /livemem
                        if [ ! -d /livemem/live/live_temp ]
                        then
                        mkdir -p /livemem/live/live_temp
                        fi
                        fi
		done
                /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
        else
	echo "nginx  runing!"
        fi
  fi
fi
/etc/init.d/puppetd restart &> /dev/null