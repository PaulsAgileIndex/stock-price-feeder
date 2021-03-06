global
  log 127.0.0.1 local0
  log 127.0.0.1 local1 notice
  chroot /var/lib/haproxy
  user haproxy
  group haproxy

defaults
  log global
  mode http
  option httplog
  option dontlognull
  balance roundrobin
  timeout connect 5000
  timeout client 50000
  timeout server 50000


frontend master-data-app-frontend
  bind *:1080
  mode http
  default_backend master-data-app-backend

backend master-data-app-backend
	mode http
    option forwardfor
    balance roundrobin{{range service "master-data-app"}}
    server {{.Node}} {{.Address}}:{{.Port}} check{{end}}
    
    
frontend stock-market-simu-frontend
  bind *:1081
  mode http
  default_backend stock-market-simu-backend

backend stock-market-simu-backend
	mode http
    option forwardfor
    balance roundrobin{{range service "stock-market-simu"}}
    server {{.Node}} {{.Address}}:{{.Port}} check{{end}}
        
    
listen stats 
	bind *:9000
    stats enable
    stats uri /haproxy_stats
    stats realm HAProxy\ Statistics
    stats hide-version
    stats auth admin:avoodoo   
    stats admin if TRUE     