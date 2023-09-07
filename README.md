# hadi2f244.free_me test project


# Quick start
1. Installing requirements:
+ `python -m venv .venv`
+ `source .venv/bin/activate`
+ `pip install -r requirements.txt`
+ `ansible-galaxy install -r requirements.yml`

2.  `cp -r inventory/sample inventory/mine`
3. Change inventory hosts and groupvars
4. To change role configs, there is a *yml* config file in `inventory/mine/group_vars/all` directory. For example, to use **V2ray** role that is prevalent these days:
+ Edit `inventory/mine/group_vars/all/v2ray.yml`.
+ Your configuration must be something like this:
```
freeme_v2ray:
  # v2ray_version: "5.7.0"
  set_env_proxy: true
  set_apt_proxy: true
  set_container_proxy: true

  v2ray_addr: "myserver.com"
  v2ray_port: 443
  v2ray_uuid: "es8d2d2d5-fea1-4bc5-c63e-25639cccbd57"
  v2ray_trojan_password: "e41d2cd5faa04ec5"
  proxy_socks_port: 10808
  proxy_http_port: 10809

  backup_previous_config: false

  use_custom_config: false # Note: Change proxy_socks_port/proxy_http_port accordingly if you use custom config
  custom_config: |
    {
      "inbounds": [
        ...
      ],
      "outbounds": [
        ...
      ],
      "routing": {
        ...
      }
    }
```
+ You can also use custom configs. Add Custom config to `custom_config`, set `use_custom_config: true`, and make sure you add the correct `proxy_socks_port/proxy_http_port`.

```
  # v2ray_version: "5.7.0"
  set_env_proxy: true
  set_apt_proxy: true
  set_container_proxy: true

  v2ray_addr:
  v2ray_port:
  v2ray_uuid:
  v2ray_trojan_password:
  proxy_socks_port: 10808
  proxy_http_port: 10809

  backup_previous_config: false

  use_custom_config: true # Note: Change proxy_socks_port/proxy_http_port accordingly if you use custom config
  custom_config: |
    {
      "inbounds": [
        ...
      ],
      "outbounds": [
        ...
      ],
      "routing": {
        ...
      }
    }
```

5. There are two playbooks to Start and Stop(Cleanup) every config. Run the ansible playbook:
```
ansible-playbook -i inventory/mine/inventory.ini playbooks/v2ray/on.yml -b -k -K -l "<myhost>"
```
5. To stop
```
ansible-playbook  -i inventory/mine/inventory.ini playbooks/v2ray/off.yml -b -k -K -l "<myhost>"
```

> Note: Some roles are based on env variables like http_proxy and https_proxy. Make sure you restart the terminal after starting.

> Note: For more use cases follow [hadi2f244.free_me documentation](https://github.com/hadi2f244/free-me/tree/main/docs)

# Make free-me collection locally, test collection
You may need to change the collection, manually. follow the *Make* and *Install* steps.

## Make:
 #######
## Install:

#########

+ Copy tar.gz file here
+ `ansible-galaxy collection install <tar.gz file> -p ./collections`

You can also use `build_test.sh` to do it automatically:
```
# Directory tree:
# free-me-main
.
├── hadi2f244
│   └── free_me
│       (clone free_me here)
└── test
    (clone free-me-test(this proj!) here)
```
Now run `./build_test.sh` command in *test* directory.

# Notes

+ Use `ansible-galaxy collection install hadi2f244.free_me -U -p ./collections` to install *hadi2f244.free_me* collection

+ You can also use theses roles to connect your localhost system to vpn. Follow [documentation](https://github.com/hadi2f244/free-me/tree/main/docs/Local.md).