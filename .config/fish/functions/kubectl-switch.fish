function kubectl-switch
	argparse --name="kubectl-switch" "h/help" "n/namespace=" -- $argv
	if test -n "$_flag_help" -o -z "$_flag_namespace"
		echo "-n/--namespace required"
		return 1
	end

	kubectl config set-context (kubectl config current-context) --namespace $_flag_namespace
end
