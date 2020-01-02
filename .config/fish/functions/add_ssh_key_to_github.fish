function add_ssh_key_to_github
  if [ ! -f ~/.ssh/id_rsa.pub ]
    ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
  end
  set pw (read -s -P 'GitHub password for jrop: ')
  set key (cat ~/.ssh/id_rsa.pub)
  curl -u "jrop:$pw" --data '{"title":"'"(hostname)"'","key":"'"$key"'"}' https://api.github.com/user/keys
end
