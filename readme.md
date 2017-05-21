# Development Environment For LA1:TV's Website

Based on laravel's homestead which [is located here](https://github.com/laravel/homestead).

Uses [vagrant](https://www.vagrantup.com/).

1. Simply copy 'LA1TV-Website-Homestead.yaml.sample' to 'LA1TV-Website-Homestead.yaml'.
2. Fill in the placeholders in 'LA1TV-Homestead.yaml'.
3. Edit your hosts file to contain "127.0.0.1  www.la1tv.co.uk.local" and "127.0.0.1  embed.la1tv.co.uk.local".
4. Execute "vagrant up" in the console.

You should now be able to browse to 'http://www.la1tv.co.uk.local:8000/' in your web browser and have the site up and running with the database seeded from the data in 'app/database/seeders'!

You can ssh into the virtual machine by executing 'vagrant ssh'.

The database can be accessed from the host machine at 127.0.0.1, port 33060, with username 'homestead' and password 'secret'.

phpMyAdmin will also be installed and is accessible at 'http://127.0.0.1:3406/' and the embed subdomain is at 'http://embed.la1tv.co.uk.local:8000/'.

The website repo is at "https://github.com/LA1TV/Website".


# Troubleshooting
## /tmp/vagrant-shell: line 2: /etc/php/7.0/fpm/php-fpm.conf: No such file or directory
This problem here is that you have a newer vewsion of the laravel/homestead than expected. The newer versions make use of php 7.1 and the website expects php 7.0.

To find the version you currently have use command ```vagrant box list```

The list of versions can be viewed here: https://atlas.hashicorp.com/laravel/boxes/homestead/ <br />
You want to find a version that is before version 1.0.0 and supports your provider.

To remove the old version of laravel/homestead run ```vagrant box remove laravel/homestead```

Then to download the older version run:  
```vagrant box add laravel/homestead --box-version 0.6.0 --provider virtualbox```<br />
(This assumes you are using virtual box, 0.6.1 wasn't used becuase it didn't have a version for virtualbox)
