#############################################################<br />
<br />
This program is free software: you can redistribute it and/or modify<br />
it under the terms of the GNU General Public License as published by<br />
the Free Software Foundation, either version 3 of the License, or<br />
(at your option) any later version.<br />
<br />
This program is distributed in the hope that it will be useful,<br />
but WITHOUT ANY WARRANTY; without even the implied warranty of<br />
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the<br />
GNU General Public License for more details.<br />
<br />
You should have received a copy of the GNU General Public License<br />
along with this program.  If not, see <http://www.gnu.org/licenses/>.<br />
<br />
Author: Sagar Belure / sagar [at] belure [dot] com<br />
<br />
#############################################################<br />
About<br />
<br />
This tool attempts to change the MAC address of Network Inteface Cards <br />
(NIC) in Linux systems by choosing a randomly-generated MAC address. <br />
<br />
The chosen MAC address is randomised in following way:<br />
-It chooses it's first 3 octets needed for MAC address from a list of <br />
MAC vendors list provided from IEEE.<br />
-The rest 3 octets are a set of complete randomly-generated hexadecimal <br />
numbers obtained with help of Psuedo-random-generator system variable.<br />
<br />
#############################################################<br />
Requirements<br />
<br />
A Linux system with BASH environment.<br />
<br />
#############################################################<br />
Usage: ./tmac.sh <options> [device]<br />
<br />
Options:<br />
	-a	List all available MAC-vendor list<br />
	-h	Show help and exit<br />
	-l	List MAC addresses associated with system devices<br />
	-R	Assign a random MAC address from known MAC-vendor list<br />
		(This option requires root privileges)<br />
	-v	Show version and exit<br />
<br />
#############################################################<br />
Examples<br />
<br />
./tmac.sh -l<br />
./tmac.sh -a<br />
./tmac.sh -R eth0<br />
./tmac.sh -R wlan0<br />
