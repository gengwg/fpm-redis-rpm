for p in $(seq 7379 100 7879); do
  echo "bind 0.0.0.0" >> redis$p.conf
  #echo "protected-mode no" >> redis$p.conf
done
