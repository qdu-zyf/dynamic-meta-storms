###Dynamic MetaStorms installer
###Bioinformatics Group, Single-Cell Research Center, QIBEBT, CAS
###Updated at Jul 10, 2019 
###Updated by Xiaoquan Su, Honglei Wang
#!/bin/bash
##Users can change the default environment variables configuration file here
PATH_File=~/.bashrc
if [ ! -f "$PATH_File" ]
   then
       PATH_File=~/.bash_profile
fi
DM_PATH=`pwd`
Sys_ver=`uname`
###Checking that environment variable of Dynamic-MetaStorms exists###
Check_old_pm=`grep "export DynamicMetaStorms"  $PATH_File|awk -F '=' '{print $1}'`
Check_old_path=`grep "DynamicMetaStorms/bin"  $PATH_File |sed 's/\(.\).*/\1/' |awk '{if($1!="#"){print "Ture";}}'`
Add_Part="####DisabledbyDynamicMetaStorms####"
echo "**Dynamic MetaStorms Installation**"
echo "**version 1.0 for MetaPhlAn2**"
###Build source code for src package###
if [ -f "Makefile" ]
   then
       echo -e "\n**Dynamic MetaStorms src package**"
       make
       echo -e "\n**Build Complete**"
else
   echo -e "\n**Dynamic MetaStorms bin package**"
fi
###Configure environment variables###

if [ "$Check_old_pm" != "" ]
   then
      Checking=`grep ^export\ DynamicMetaStorms  $PATH_File|awk -F '=' '{print $2}'`
      if [ "$Checking" != "$DM_PATH" ]
         then
         if [ "$Sys_ver" == "Darwin" ]
            then
            sed -i "" "s/^export\ DynamicMetaStorms/$Add_Part\ &/g" $PATH_File
            sed -i "" -e $"`grep -n "$Add_Part" $PATH_File | cut -d ":" -f 1 | head -1` a\ 
            export\ DynamicMetaStorms=$DM_PATH
            " $PATH_File
         else
             sed -i "s/^export\ DynamicMetaStorms/$Add_Part\ &/g" $PATH_File
             sed -i "/$Add_Part\ export\ DynamicMetaStorms/a export\ DynamicMetaStorms=$DM_PATH" $PATH_File
         fi
     fi    
elif [ "$Check_old_pm" == "" ]
    then
      echo "export DynamicMetaStorms="${DM_PATH} >> $PATH_File
fi
if [ "$Check_old_path" == "" ]
    then
      echo "export PATH=\$PATH:\$DynamicMetaStorms/bin" >> $PATH_File
fi
###Source the environment variable file###
source $PATH_File
echo -e "\n**Environment Variables Configuration Complete**"
###End
echo -e "\n**Dynamic MetaStorms Installation Complete**"
echo -e "\n**An example dataset with demo script is available in \"example\"**"

