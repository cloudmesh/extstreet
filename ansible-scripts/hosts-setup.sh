#!/bin/sh
if grep -Fxq "[all_nodes]" hosts
then
   echo [all_nodes]|cat > hosts
else
   echo [all_nodes]|cat > hosts
fi
cm cluster nodes cluster-001|awk '{print $2 }'> ip_list
sed -i 's/$/ ansible_ssh_user=cc/' ip_list
sed -i '/\[all_nodes\]/ r ip_list' hosts
if grep -Fxq "[extstreet]" inventory 
then
   rm inventory
   echo [extstreet]|cat > inventory
else
   echo [extstreet]|cat > inventory
fi

head -n1 -q ip_list >> inventory
rm ip_list
