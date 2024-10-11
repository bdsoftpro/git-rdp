#disable spotlight indexing
sudo mdutil -i off -a
#Create new account
sudo dscl . -create /Users/delwar
sudo dscl . -create /Users/delwar UserShell /bin/bash
sudo dscl . -create /Users/delwar RealName "VNC REAL"
sudo dscl . -create /Users/delwar UniqueID 1001
sudo dscl . -create /Users/delwar PrimaryGroupID 80
sudo dscl . -create /Users/delwar NFSHomeDirectory /Users/tcv
sudo dscl . -passwd /Users/delwar $1
sudo dscl . -passwd /Users/delwar $1
sudo createhomedir -c -u delwar > /dev/null
sudo dscl . -append /Groups/admin GroupMembership delwar
#Enable VNC
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvnclegacy -vnclegacy yes 
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvncpw -vncpw $2
#Start VNC/reset changes
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate

#install ngrok
wget -q https://localtonet.com/download/localtonet-osx-64.zip -o osx-64.zip
unzip osx-64.zip
sudo chmod +x ./localtonet

#configure ngrok and start it
./localtonet authtoken $3 &
