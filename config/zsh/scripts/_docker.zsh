dclean() {
	docker images
	echo ========
	if [ "$1" = "--auto" ]; then
		docker images -qf dangling=true | xargs -n 1 docker rmi
	else
		docker images -qf dangling=true | xargs -n 1 echo docker rmi
	fi
}
