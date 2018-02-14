#############################################################

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Author: Sagar Belure / sagar [at] belure [dot] com

#############################################################
About

This tool attempts to change the MAC address of Network Inteface Cards 
(NIC) in Linux systems by choosing a randomly-generated MAC address. 

The chosen MAC address is randomised in following way:
-It chooses it's first 3 octets needed for MAC address from a list of 
MAC vendors list provided from IEEE.
-The rest 3 octets are a set of complete randomly-generated hexadecimal 
numbers obtained with help of Psuedo-random-generator system variable.

#############################################################
Requirements

A Linux system with BASH environment.

#############################################################
Usage: ./tmac.sh <options> [device]

Options:
	-a	List all available MAC-vendor list
	-h	Show help and exit
	-l	List MAC addresses associated with system devices
	-R	Assign a random MAC address from known MAC-vendor list
		(This option requires root privileges)
	-v	Show version and exit

#############################################################
Examples

./tmac.sh -l
./tmac.sh -a
./tmac.sh -R eth0
./tmac.sh -R wlan0

