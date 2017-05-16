for p in $(seq 7379 100 7879); do
  echo "requirepass 77a46C9CeXZvV9nFCqkEKbMcmuy2MCVq" >> redis$p.conf
  echo "masterauth 77a46C9CeXZvV9nFCqkEKbMcmuy2MCVq" >> redis$p.conf
  #echo "bind 0.0.0.0" >> redis$p.conf
  #echo "protected-mode no" >> redis$p.conf
done
