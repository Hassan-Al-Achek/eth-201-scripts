#!/bin/bash

# Backup original config file
echo -e "[+] \033[34mCreate Backup File:\033[0m \033[31m/etc/vsftpd.conf.bak\033[0m"
cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

# Configuration File
FTPConf=/etc/vsftpd.conf


# Replace "anonymous_enable=NO" with "anonymous_enable=YES"
echo -e "[+]\033[34m Enable Anonymous Login: \033[0m \033[31manonymous_enable=YES \033[0m"
sed -i 's/anonymous_enable=NO/anonymous_enable=YES/g' $FTPConf

echo -e "[+]\033[34m Enable Upload: \033[0m \033[31m write_enable=YES \033[0m"
sed -i 's/#write_enable=YES/write_enable=YES/g' $FTPConf

echo -e "[+]\033[34m Enable Anonymous Upload: \033[0m \033[31m anon_upload_enable=YES \033[0m"
sed -i 's/#anon_upload_enable=YES/anon_upload_enable=YES/g' $FTPConf

echo -e "[+]\033[34m Enable Anonymous Directory Creation \033[0m \033[31m anon_mkdir_write_enable=YES \033[0m"
sed -i 's/#anon_mkdir_write_enable=YES/anon_mkdir_write_enable=YES/g' $FTPConf

echo -e "[+]\033[34m Enable Anonymous Deletion And Renaming\033[0m \033[31m anon_other_write_enable=YES\033[0m"
echo -e "# Custom For Anonymous Login \nanon_other_write_enable=YES" >> $FTPConf

echo -e "[+]\033[34m Sets the root folder for anonymous logins \033[0m \033[31m anon_root=/var/ftp/ \033[0m"
echo -e "anon_root=/var/ftp/" >> $FTPConf

echo -e "[+]\033[34m Stops prompting for a password on the command line \033[0m \033[31m no_anon_password=YES \033[0m"
echo -e "no_anon_password=YES" >> $FTPConf

echo -e "[+]\033[34m Shows the user and group as ftp:ftp, regardless of the owner \033[0m \033[31m hide_ids=YES \033[0m"
echo -e "hide_ids=YES" >> $FTPConf

echo -e "[+]\033[34m Limits the range of ports that can be used for passive FTP \033[0m \033[31m pasv_min_port=40000 and pasv_max_port=50000 \033[0m"
echo -e "pasv_min_port=40000\npasv_max_port=50000" >> $FTPConf

# Make directory for anonymous login
echo -e "[+]\033[34m Create anonymous directory \033[0m \033[31m /var/ftp/pub \033[0m"
mkdir -p /var/ftp/pub
chown nobody:nogroup /var/ftp/pub

echo -e "[+]\033[34m Create test file \033[0m \033[31m /var/ftp/pub/test.txt \033[0m"
echo "Welcome to ETH201!" | tee /var/ftp/pub/test.txt
chmod a+rwx /var/ftp/pub

# restart vsftpd service
systemctl restart vsftpd
