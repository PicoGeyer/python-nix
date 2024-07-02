# python-nix
Python project Nix setup

Setup instructions
Nix make be installed
Flakes should be enabled
https://nixos.wiki/wiki/Flakes

For eg
```
experimental-features = nix-command flakes
```
in ~/.config/nix/nix.conf

# Direnv (optional)
If direnv is installed, you can simply cd into the project dir to get a nix dev shell

# Without direnv
```nix develop``` in project dir

# Usage
Once in the development environment
`which python` should give:
/nix/store/amg302fpvi7apngpmjcck0c6g3vdxysn-python3-3.11.9-env/bin/python

libvirt module should be available too
```python -c 'import libvirt````

