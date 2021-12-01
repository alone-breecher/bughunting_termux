#!/system/bin/sh


read -p "Enter the Domain name : " DOM
if [ -d /data/data/com.termux/files/home/bug_result ]
then
    echo""
    mkdir /data/data/com.termux/files/home/bug_result
    fi

    
if [ -d /data/data/com.termux/files/home/bug_result/$DOM ]
then
    echo""
    mkdir /data/data/com.termux/files/home/bug_result/$DOM
    fi


if [ -d /data/data/com.termux/files/home/bug_result/$DOM/Subdomains ]
then
    echo""
    mkdir /data/data/com.termux/files/home/bug_result/$DOM/Subdomains
    fi

echo "${blue} [+] Started Subdomain Enumeration ${reset}"
echo " "

#subfinder
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "

if [ -f  /data/data/com.termux/files/usr/bin/subfinder ]
then 
    echo "${magenta} [+] Running Subfinder for subdomain enumeration${reset}" 
    subfinder -d $DOM -o /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/subfinder.txt
    else
        echo"subfinder not found"
        fi
    
    
 #sublister
   
    if [ -f /data/data/com.termux/files/home/bug/Sublist3r ]
then
        echo "${magenta} [+] Running sublist3r for subdomain enumeration${reset}"
        python3 /data/data/com.termux/files/home/bug/Sublist3r/sublist3r.py -d $DOM -t 3 -e bing --output /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/sublister.txt
        else
            echo "sublister not found"
            fi
        
        
   #uniquesubdomains
        echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
        
        echo " "
        echo "${magenta} [+] Fetching unique domains ${reset}"
        
        echo " "
        cat /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/*.txt | sort -u >> /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/unique.txt
        echo"${blue} [+] Succesfully saved as unique.txt ${reset}"						
        echo " "
       
            
            
   #sorting alive subdomains
            echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
            echo " "
            if [ -f /data/data/com.termux/files/usr/bin/httpx ]
            then 
                
                echo "${magenta} [+] Running Httpx for sorting alive subdomains${reset}"
                cat /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/unique.txt | httpx >> /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/all-alive-subs.txt 
                cat /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/all-alive-subs.txt | sed 's/http\(.?*\)*:\/\///g' | sort -u > /data/data/com.termux/files/home/bug_result/$DOM/Subdomains/protoless-all-alive-subs.txt
                else
                echo "httpx not found"
                fi
        
            echo " "
            echo "${blue} [+] Successfully saved the results"
            echo " "
        
            

    
    