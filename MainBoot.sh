#! /bin/bash
bootLogs(){
figlet -f standard "ShaktiMaan"
echo "Press 1 to check last login time"
echo "Press 2 to check last boot time"
echo "Press 3 to check last reboot time"
echo "Press 4 to check last shutdown time"
echo "Press 5 to get the full reboot report"
echo "Press 6 to get the full shutdown report"
echo "Press 7 to exit"
echo
echo "Your input: "
read num
	if [ "$num" -eq 1 ]; then
		echo "Press 1 to check the login history of a specific user"
		echo "Press 2 to check the login history of all users"
		echo "Your input: "
		read var
		if [ "$var" -eq "1" ];then
			echo "Enter the user name: "
			read uname
			figlet -f standard "Login Report Of User:"
			figlet -f standard $uname
			last -f /var/log/wtmp.1 $uname| awk '{print $5 " " $6 " " $7}' 
		elif [ "$var" -eq "2" ];then
			figlet -f standard "Login Report Of All Users:"
			last -f /var/log/wtmp.1 | awk '{print $1 ": " $5 " " $6 " " $7}'
		else
			echo "Please enter a valid input :( "
		fi
	elif [ "$num" -eq 2 ];
	then
		echo "Last Boot time is: "
		who -b
	elif [ "$num" -eq 3 ];
	then
		echo "Last Reboot time is: "
		last reboot | head -1
	elif [ "$num" -eq 4 ];
	then
		echo "Last shutdown time is: "
		last -x | grep shutdown | head -1
	elif [ "$num" -eq 5 ];
	then
		figlet -f standard "Full Reboot Report"
		last reboot
	elif [ "$num" -eq 6 ];
	then
		figlet -f standard "Full Shutdown Report"
		last -x | grep shutdown
	elif [ "$num" -eq 7 ];
	then
		echo "Exiting ......"
		exit 0
	else
		echo "Please enter a valid input from the above options"
	fi
}
bootLogs
echo "Do you want to continue? y/n"
read cont
 if [ "$cont" == "n" ] || [ "$cont" == "N" ];
        then
                echo "Exiting ...... :)"
 fi
while [ "$cont" == "y" ] || [ "$cont" == "Y" ]
do
	bootLogs
	echo "Do you want to continue? y/n"
	read cont
	if [ "$cont" == "n" ] || [ "$cont" == "N" ];
	then
		echo "Exiting ...... :)"
	fi
done
