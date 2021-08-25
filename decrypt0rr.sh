#!/bin/bash
# Key is known and shared by Microsoft - https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-gppref/2c15cbf0-f086-4c74-8b70-1f2fa45dd4be?redirectedfrom=MSDN#endNote2
key='4e9906e8fcb66cc9faf49310620ffee8f496e806cc057990209b09a433b66c1b'
iv='00000000000000000000000000000000'

len=$(( ${#1} % 4 ))
if [[ "$len" -eq 2 ]]; then cpassword="$1=="
  elif [[ "$len" -eq 3 ]]; then cpassword="$1="
else cpassword="$1";
fi

password=$(echo -e "$cpassword" | openssl enc -d -a -aes-256-cbc -K "$key" -iv "$iv" | tr -d '\0')
echo "Decrypted password:" "$password"