This is the configuration for launching a hedonometer development server, from scratch-ish.

With vagrant and virtual box installed, just go ahead and `vagrant up` in this directory and you should see the site at `localhost:8080/index.html`, after some complaining.
Go in and change whatever, and when satisfied, push to github, and get out of the VM and run the deploy.yml playbook from this directory.

Vagrant just uses the `Vagrantfile` and `provision-vagrant.*` files to set up the virtual server, and those scripts use some of the files in `site-settings`.

Again, once an upgrade is ready to go live, get back out of the virtualbox, and use Ansible to run the `deploy.yml` playbook like this:

```ansible-playbook deploy.yml```

(it helps to activate the local virtualenv with ansible in it).





Need the environment variables defined in playbook for running manage.py commands from ansible, and need them (and the directory) in uwsgi config file for uwsgi to run the app (both locally, and on the linode).
