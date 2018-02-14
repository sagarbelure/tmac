#!/bin/bash
########################################################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
########################################################################
# Contact:		Sagar Belure (sagar [at] belure [dot] com)
# Blog:			http://blog.belure.com/
#
# Program Name:	TMAC for Linux
# Purpose:		Change MAC address of Network Interface Cards in Linux systems
# Version:		1.0
# Dependencies: 	Bash shell
#
########################################################################

if [ "$0" = sudo ] && [ "$1" = bash ]
then
	{
	param1="$2"
	param2="$3"
	param3="$4"
	}
elif [ "$0" = bash ]
then
	{
	param1="$1"
	param2="$2"
	param3="$3"
	}
else
	{
	param1="$0"
	param2="$1"
	param3="$2"
	}
fi

if [ -z "$param2" ] || [ "$param2" = -h ]
then
	{
		echo "Usage: $param1 [-a] [-h] [-l] [-R device-name ] [-v]"
		echo -e "\nOptions:"
		echo -e "\t-a\tList all available MAC-vendor list"
		echo -e "\t-h\tShow help and exit"
		echo -e "\t-l\tList MAC addresses associated with system devices"
		echo -e "\t-R\tAssign a random MAC address from known MAC-vendor list"
		echo -e "\t\t(This option requires root privileges)"
		echo -e "\t-v\tShow version and exit"
		echo -e "\nExamples:"
		echo -e "\t./tmac.sh -a"
		echo -e "\t./tmac.sh -l"
		echo -e "\t./tmac.sh -R wlan0"
		echo -e "\nReport bugs to sagar@belure.com"
	}
elif [ "$param2" = -a ]
then
	{
		echo -n "This can be enormously longer. See it anyway?(y/n)"
		read u
		if [ "$u" = y ]
		then
			{
				grep '(hex)' oui.txt
				exit
			}
		else
		exit
		fi							
	}
elif [ "$param2" = -l ]
then
	{
		echo
		n=$(ifconfig |grep HWaddr |wc -l)
		hws=$(ifconfig |grep HWaddr |awk {'print $1'})
		hw_macs=$(ifconfig |grep HWaddr |awk {'print $5'})

		i=1
		while [ $i -le $n ] ; do
		{
			hwi=$(echo -n $hws |cut -d' ' -f$i)
			hwmi=$(echo -n $hw_macs |cut -d' ' -f$i)
			echo -e "$hwi has mac address \t$hwmi"
			let "i+=1"
		}
		done
	}
elif [ "$param2" = -R ]
then
	{
		if [ -z $param3 ]
		then
			{
				echo -e "Unrecognized network device:$param3\n"
				echo "Type $param1 -h for options"
				exit
			}
		else
			{
			mac1()
				{
					a=$(echo $RANDOM % 100000 |bc)
					if [ $a -le 13621 ]
					then
					{
						grep '(hex)' oui.txt |head -n $a |tail -n 1 |cut -d' ' -f1 |awk -F- {'print$1":"$2":"$3'}
						exit
					}
					else
					{
						b=$(echo $a % 10000 |bc)
						grep '(hex)' oui.txt |head -n $b |tail -n 1 |cut -d' ' -f1 |awk -F- {'print$1":"$2":"$3'}
						exit
					}
					fi
				}
			
			mac2()
				{
					m()
					{
						a=$(echo $RANDOM % 100 |bc)
						b=$(echo "obase=16; $a" | bc)
						if [ $a -le 15 ];
						then
							{
								echo 0$b
								exit
							}
						fi
						echo $b
					}
					j=$(m)
					k=$(m)
					l=$(m)
					echo "$j":"$k":"$l"
				}

				m1=$(mac1)
				m2=$(mac2)
				random_mac=$(echo "$m1":"$m2")				
				erro=$(sudo ifconfig $param3 hw ether $random_mac 2>&1)
				if [ -z "$erro" ]
				then
					{
					echo -e "\nMAC address of $param3 has been successfully changed to $random_mac"
					exit
					}
				else
					{
					echo -e "\n$erro"
					exit
					}
				fi
			}
		fi
	}
elif [ "$param2" = -v ]
then
	{
		echo -e "\vTMAC for Linux : Version 1.0\nReport bugs to sagar@belure.com"
	}
else
	{
		echo -e "\nInvalid option '$1'"
		echo "Type $param1 -h for options"
		exit
	}
fi