# viewzr-infr

This repository is designed to hold the code for developer enviroments as well as server deploys.

This includes packer and vagrant at the moment.

## Developer Enviroment Set Up

The developer environment set up is fairly straightforward. Just ensure that you follow these instructions.

There are some prerequisites for installing this developer environment. First, I would suggest that you use a decent Linux-like terminal. On Mac this is the standard terminal, on Windows you can download something like [cmder](http://cmder.net/), [git bash](https://git-scm.com/downloads) or [cygwin](https://www.cygwin.com/). Once you have a standard terminal to use, download Vagrant and Packer.

* [Vagrant](https://www.vagrantup.com/)
* [Packer](https://www.packer.io/)

Once that is complete, you are ready to move forward. The first step is to set up and clone the repository...

```bash
# Make a git folder in home
mkdir -p ~/git/
cd ~/git/
# Clone the repository
git clone git@github.com:Viewzr-infr/Viewzr-infr.git
```

#### Packer

The next step is to build the Packer box.

```bash
cd ~/git/viewzr-infr/packer/
# Build the box
packer build viewzr.json
```

This will take some time. Be patient

#### Vagrant

The next step is to set up the vagrant box from the Packer build result.

```bash
cd ~/git/viewzr-infr/vagrant/
# Bring up the box
vagrant up
# Wait until the box is finished
vagrant ssh
```

#### Set up scripts

The final step is to complete the set up scripts. This is a time consuming part of the process and will require your attention to make sure things work properly.

```bash
# Create the environment
env_create.sh
# Log back in after the reboot completes....
vagrant ssh
# Create your user
user_create.sh
# Change to your user
su - <username>
```

The final steps are to create your ssh keys and clone the repos.
```bash
# Generate keys, if you don't know the answer to the questions, hit <enter>
ssh-keygen -t rsa -b 4096
```

Now you are going to copy and paste them into your Github profile. Ask for help if you are confused about this.

```bash
# Final step
clone_repos.sh
```
#### Optional

```bash
# Install Atom (optional)
atom_install.sh
```
