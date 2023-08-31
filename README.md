# hadi2f244.free_me test project


# Quick start
1. `cp -r inventory/sample inventory/mine`
2. Change inventory hosts and groupvars
3. Run every role you want, I have provided simple playbook to start(on.yml) and stop(off.yml) each role. For example, to start singbox role:
```
ansible-playbook  -i inventory/mine/inventory.ini playbooks/singbox/on.yml -b -l "myhost"
```
4. To stop
```
ansible-playbook  -i inventory/mine/inventory.ini playbooks/singbox/off.yml -b -l "myhost"
```

> Note: Some roles based on env variables like http_proxy and https_proxy. Make sure you restart the terminal after starting.

# Local test collection
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

+ You can also use this roles to connect your localhost system to vpn.