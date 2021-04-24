# Surge configuration

### OS installation

In [docs/*/installation.md](./docs) you can find instruction to install OS
* [Ubuntu](./docs/ubuntu/)

### OS initialization

**Supports**
* Ubuntu 20.04 focal

#### SSH key

ssh key generation:
```bash
ssh-keygen -t ed25519 -C "your_email@exapmle.com"
ssh-add ~/.ssh/id_ed25519
```

Add ssh key to github using [instruction](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

#### Automatized setup

```bash
sudo apt update && sudo apt upgrade
sudo apt install git -y
git clone git@github.com:Serfi7/configs.git
cd ./configs
chmod +x init
./init -ps
```

#### Programs setup

Choose your OS type
* [Ubuntu](./docs/ubuntu/setup.md)

### Languages installation

#### Go

* Linux Golang v1.16.13

```bash
wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
sudo tar -C /opt -xzf go1.16.3.linux-amd64.tar.gz
rm -f go1.16.3.linux-amd64.tar.gz
```

After installation **add to your rc file** `export PATH=$PATH:/opt/go/bin`
