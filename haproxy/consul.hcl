max_stale = "10m"
wait      = "1s:20s"

#retry {
#	enabled = true
#	attempts = 12
#	backoff = "250ms"
#	max_backoff = "1m"
#}

template {
	source = "/etc/haproxy/haproxy.tpl"
	destination = "/etc/haproxy/haproxy.cfg"
	command = "/haproxy-command.sh"
	perms = 0600
}