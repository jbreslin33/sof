
var_chrome=$(which google-chrome)
echo "$var_chrome";

if [ `getconf LONG_BIT` = "64" ]

then
	echo "I'm 64-bit"
	echo chrome

        if [ "$var_chrome" = "/usr/bin/google-chrome" ]
        	then
                echo "google-chrome installed already"
        else
                echo "google-chrome not installed - install it..."
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo gdebi google-chrome-stable_current_amd64.deb
		rm google-chrome-stable_current_amd64.deb
fi

else
    echo "I'm 32-bit so I cannot install google-chrome"
fi


