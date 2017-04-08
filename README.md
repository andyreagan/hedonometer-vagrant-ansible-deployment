hedonometer-vagrant-ansible-deployment
==

This is the configuration for launching a hedonometer development server, from scratch-ish.
See [https://github.com/andyreagan/hedonometer](https://github.com/andyreagan/hedonometer) for how this fits into the whole pipeline of Hedonometer.

With vagrant and virtual box installed, just go ahead and `vagrant up` in this directory and you should see the site at `localhost:8080/index.html`, after some complaining.
Go in and change whatever, and when satisfied, push to github, and get out of the VM and run the deploy.yml playbook from this directory.

Vagrant just uses the `Vagrantfile` and `provision-vagrant.*` files to set up the virtual server, and those scripts use some of the files in `site-settings`.

Again, once an upgrade is ready to go live, get back out of the virtualbox, and use Ansible to run the `deploy.yml` playbook like this:

```ansible-playbook deploy.yml```

(it helps to activate the local virtualenv with ansible in it).

Shutdown the vagrant machine using:

```vagrant halt```


Need the environment variables defined in playbook for running manage.py commands from ansible, and need them (and the directory) in uwsgi config file for uwsgi to run the app (both locally, and on the linode).

restart the nginx server
as "vagrant" user:
```sudo service nginx restart```

```export DJ_SECRET_KEY='3*qr%3v27!)_cfml*uffm3n9glfdy%16!#4wm5@8t)rc@do_z^'
export DJ_DEBUG=TRUE
export DJ_DB_ENGINE=django.db.backends.mysql
export DJ_DB_NAME=swndb
export DJ_DB_USER=root
export DJ_DB_PASSWORD=mypassword
export DJ_DB_HOST=127.0.0.1
export DJ_DB_PORT=3306
export DJ_STATIC_ROOT="/home/vagrant/app/mysite/static"
export HEDO_APP_KEY="JJ6m8Mf6wwd2J2zqQN3AKClRI"
export HEDO_APP_SECRET="qBssBf4wfUaeNUMPRY5epn8hL4t543wDf20FEjxrY0FsQmykaa"
export DJ_ABSOLUTE_DATA_PATH=/usr/share/nginx/data```

```pip install django-tastypie==0.12.2```

also restart the uwsgi server
```uwsgi --ini uwsgi/uwsgi_config```

