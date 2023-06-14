#!/bin/sh
#Updates the System
apt update && apt upgrade -y

#Installs requierd apt
apt install wget nano -y

#Installs Headscale
wget --output-document=headscale.deb   https://github.com/juanfont/headscale/releases/download/v0.22.3/headscale_0.22.3_linux_amd64.deb
sudo dpkg --install headscale.deb

#Asks basic Configuration for headscale
echo What is the server IP or DNS? Default: 0.0.0.0
read headscaleip
headscaleip=${headscaleip:-0.0.0.0}

#Edits the default config of Headscale.
rm /etc/headscale/config.yaml
echo --- >> /etc/headscale/config.yaml
echo server_url: http://$headscaleip:8080 >> /etc/headscale/config.yaml
echo listen_addr: 127.0.0.1:8080 >> /etc/headscale/config.yaml
echo metrics_listen_addr: 127.0.0.1:9090 >> /etc/headscale/config.yaml
echo grpc_listen_addr: 127.0.0.1:50443 >> /etc/headscale/config.yaml
echo grpc_allow_insecure: false >> /etc/headscale/config.yaml
echo private_key_path: /var/lib/headscale/private.key >> /etc/headscale/config.yaml
echo noise: >> /etc/headscale/config.yaml
echo private_key_path: /var/lib/headscale/noise_private.key >> /etc/headscale/config.yaml
echo ip_prefixes: >> /etc/headscale/config.yaml
echo - fd7a:115c:a1e0::/48 >> /etc/headscale/config.yaml
echo - 100.64.0.0/10 >> /etc/headscale/config.yaml
echo derp: >> /etc/headscale/config.yaml
echo server: >> /etc/headscale/config.yaml
echo enabled: false >> /etc/headscale/config.yaml
echo region_id: 999 >> /etc/headscale/config.yaml
echo region_code: "headscale" >> /etc/headscale/config.yaml
echo region_name: "Headscale Embedded DERP" >> /etc/headscale/config.yaml
echo stun_listen_addr: "0.0.0.0:3478" >> /etc/headscale/config.yaml
echo urls: >> /etc/headscale/config.yaml
echo - https://controlplane.tailscale.com/derpmap/default >> /etc/headscale/config.yaml
echo paths: [] >> /etc/headscale/config.yaml
echo auto_update_enabled: true >> /etc/headscale/config.yaml
echo update_frequency: 24h >> /etc/headscale/config.yaml
echo disable_check_updates: false >> /etc/headscale/config.yaml
echo ephemeral_node_inactivity_timeout: 30m >> /etc/headscale/config.yaml
echo node_update_check_interval: 10s >> /etc/headscale/config.yaml
echo db_type: sqlite3 >> /etc/headscale/config.yaml
echo db_path: /var/lib/headscale/db.sqlite >> /etc/headscale/config.yaml
echo acme_url: https://acme-v02.api.letsencrypt.org/directory >> /etc/headscale/config.yaml
echo acme_email: "" >> /etc/headscale/config.yaml
echo tls_letsencrypt_hostname: "" >> /etc/headscale/config.yaml
echo tls_letsencrypt_cache_dir: /var/lib/headscale/cache >> /etc/headscale/config.yaml
echo tls_letsencrypt_challenge_type: HTTP-01 >> /etc/headscale/config.yaml
echo tls_letsencrypt_listen: ":http" >> /etc/headscale/config.yaml
echo tls_cert_path: "" >> /etc/headscale/config.yaml
echo tls_key_path: "" >> /etc/headscale/config.yaml
echo log: >> /etc/headscale/config.yaml
echo format: text >> /etc/headscale/config.yaml
echo level: info >> /etc/headscale/config.yaml
echo acl_policy_path: "" >> /etc/headscale/config.yaml
echo dns_config: >> /etc/headscale/config.yaml
echo override_local_dns: true >> /etc/headscale/config.yaml
echo nameservers: >> /etc/headscale/config.yaml
echo - 1.1.1.1 >> /etc/headscale/config.yaml
echo domains: [] >> /etc/headscale/config.yaml
echo magic_dns: true >> /etc/headscale/config.yaml
echo base_domain: example.com >> /etc/headscale/config.yaml
echo unix_socket: /var/run/headscale/headscale.sock >> /etc/headscale/config.yaml
echo unix_socket_permission: "0770" >> /etc/headscale/config.yaml
echo logtail: >> /etc/headscale/config.yaml
echo enabled: false >> /etc/headscale/config.yaml
echo randomize_client_port: false >> /etc/headscale/config.yaml

#Enables and Starts the headscale server
sudo systemctl enable headscale
sudo systemctl start headscale
