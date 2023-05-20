This is the modified version of this [page](https://nixos.org/manual/nix/unstable/contributing/hacking.html)

enter bash as root

```bash
sudo bash
```
Everything past this is ran as root in a root bash shell

### next make the directory and cd into it

```bash
mkdir -p /opt/nix-git
cd /opt/nix-git
```
### Clone repo

```bash
git clone https://github.com/NixOS/nix.git
cd nix
```

### type this

```console
nix develop
```

### type this

```console
nix develop .#native-clang11StdenvPackages
```

### type this

```bash
mkdir -p /opt/nixusr
```

### enter nix shell

```bash
nix-shell
```

### type the following into nix-shell

```console
./bootstrap.sh
./configure $configureFlags --prefix=/opt/nixusr
make -j $NIX_BUILD_CORES
make install
make installcheck -j $NIX_BUILD_CORES
```

### check version

```bash
nix --version
```

### Run the after setup

```bash
curl -s https://raw.githubusercontent.com/dnkmmr69420/nix-installer-scripts/main/other-scripts/nix-compile-after-setup.sh | bash -s /usr/local
```