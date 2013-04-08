echo "setting hostname to $1"
/bin/hostname $1

echo "setting ip to $2"
grep -w $1 /etc/hosts
if [ $? -ne 0 ] ; then
  echo "127.0.0.1    $2     $1" >> /etc/hosts
fi
