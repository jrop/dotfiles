function add_ssh_key_to_gitlab
  if [ ! -f ~/.ssh/id_rsa.pub ]
    ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
  end
  set tkn (read -s -P 'GitLab token: ')
  set key (cat ~/.ssh/id_rsa.pub)
  set hn (hostname)
  curl -X POST -H "PRIVATE-TOKEN: $tkn" -H 'Content-Type: application/json' \
    --data "{\"title\": \"$hn\", \"key\": \"$key\"}" "https://gitlab.com/api/v4/user/keys"
end
