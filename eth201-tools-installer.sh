#!/bin/bash


TOOLS_DIR="eth-201-tools"
TOOLS_FULL_PATH=$HOME/$TOOLS_DIR

echo -e "\e[34m   
█▀▀ ▀▀█▀▀ █░░█ █▀█ █▀▀█ ▄█░ ░░ ▀▀█▀▀ █▀▀█ █▀▀█ █░░ █▀▀ 　 ░▀░ █▀▀▄ █▀▀ ▀▀█▀▀ █▀▀█ █░░ █░░ █▀▀ █▀▀█ 
█▀▀ ░░█░░ █▀▀█ ░▄▀ █▄▀█ ░█░ ▀▀ ░░█░░ █░░█ █░░█ █░░ ▀▀█ 　 ▀█▀ █░░█ ▀▀█ ░░█░░ █▄▄█ █░░ █░░ █▀▀ █▄▄▀ 
▀▀▀ ░░▀░░ ▀░░▀ █▄▄ █▄▄█ ▄█▄ ░░ ░░▀░░ ▀▀▀▀ ▀▀▀▀ ▀▀▀ ▀▀▀ 　 ▀▀▀ ▀░░▀ ▀▀▀ ░░▀░░ ▀░░▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀░▀▀
\e[0m"

echo -e "\e[36mCoded by Hassan Al Achek <3\e[0m\n"



if [ -d $TOOLS_FULL_PATH ]; then
  echo -e "\e[35m[+] All your tools are installed here: $TOOLS_FULL_PATH\e[0m\n"
  tree $TOOLS_FULL_PATH
else
  mkdir $TOOLS_FULL_PATH
fi

cd $TOOLS_FULL_PATH

function installInfoGatherTools {
	echo -e "\e[35m[+] Installing ASNlookup\e[0m"
	git clone https://github.com/yassineaboukir/Asnlookup &> /dev/null && cd Asnlookup
	pip3 install -r requirements.txt &> /dev/null
	chmod +x asnlookup.py
	sudo mv asnlookup.py /usr/local/bin/asnlookup
	echo -e "\e[35m[+] ASNlookup installed and added to the binary global path\e[0m"
	cd ..
}

function installMetabigorTool {
	echo -e "\e[35m[+] Installing metabigor\e[0m"
	sudo apt install gccgo-go -y &> /dev/null
	sudo apt install golang-go -y &> /dev/null
	go install github.com/j3ssie/metabigor@latest &> /dev/null
	sudo cp $HOME/go/bin/metabigor /usr/local/bin
	echo -e "\e[35m[+] metabigor installed and added to the binary global path\e[0m"
	
	echo  "alias metabigor='ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.19 metabigor'"  >> ~/.bashrc
	echo  "alias metabigor='ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.19 metabigor'"  >> ~/.zshrc
}

function installDomLinkTool {
	echo -e "\e[35m[+] Installing domlink\e[0m"
	git clone https://github.com/vysecurity/DomLink &> /dev/null && cd DomLink
	pip3 install -r requirements.txt &> /dev/null
	chmod +x domLink.py
	sudo mv domLink.py /usr/local/bin/domlink 
	echo -e "\e[35m[+] DomLink installed and added to the binary global path\e[0m"
	echo -e "\e[35m[+] DomLink needs an API key for WHOXY.com\e[0m"
	cd ..
	
}

function installCertshTool {
	echo -e "\e[35m[+] Installing certsh\e[0m"
	git clone https://github.com/Hassan-Al-Achek/fixed-certsh.git &> /dev/null && cd fixed-certsh
	chmod +x certsh.py
	sudo mv certsh.py /usr/local/bin/certsh
	echo -e "\e[35m[+] certsh installed and added to the binary global path\e[0m"
	cd ..
	
}

if [ ! -f /usr/local/bin/asnlookup ]; then
  installInfoGatherTools
else 
  echo -e "\e[31m[-] asnlookup already installed \e[0m"
fi

if [ ! -f /usr/local/bin/netabigor ]; then
  installMetabigorTool
else 
  echo -e "\e[31m[-] metabigortool already installed \e[0m"
fi

if [ ! -f /usr/local/bin/domlink ]; then
  installDomLinkTool
else 
  echo -e "\e[31m[-] DomLink already installed \e[0m"
fi

if [ ! -f /usr/local/bin/certsh ]; then
  installCertshTool
else 
  echo -e "\e[31m[-] certsh already installed \e[0m"
fi

if [ ! -f /usr/bin/subfinder ]; then
  echo -e "\e[35m[-] Installing subfinder \e[0m"
  sudo apt-get install subfinder &> /dev/null
else 
  echo -e "\e[31m[-] subfinder already installed \e[0m"
fi

