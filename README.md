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

### Languages and databases installation

#### Go

* Linux Golang v1.17.3 amd64

```bash
wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
rm -f go1.17.3.linux-amd64.tar.gz
```

After installation **add to your rc file** `export PATH=$PATH:/opt/go/bin`

#### PostgreSQL

* Linux Latest PostgreSQL

```bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql
```

#### MongoDB

```bash
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod # if not OK: sudo systemctl deamon-reload
sudo systemctl status mongod # check status
sudo systemctl enable mongod # start on launch
```

Keep version on update:

```bash
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-database hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
```
