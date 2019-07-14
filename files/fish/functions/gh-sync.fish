function gh-sync
	set prev_pwd (pwd)
	mkdir -p ~/Code/github/jrop
	cd ~/Code/github/jrop

	set repos (curl -s https://api.github.com/users/jrop/repos | jq '.[].name' -r)
	for repo in $repos
		echo $repo
		if test -d $repo
			cd $repo
			git pull
			cd ..
		else
			git clone git@github.com:jrop/$repo.git $repo
		end
	end

	cd $prev_pwd
end
