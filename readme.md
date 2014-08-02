# Development Environment For LA1:TV's Website

Based on laravel's homestead which [is located here](https://github.com/laravel/homestead).

Uses [vagrant](https://www.vagrantup.com/).

1) Simply copy 'LA1TV-Homestead.yaml.sample' to 'LA1TV-Homestead.yaml'.
2) Fill in the placeholders in 'LA1TV-Homestead.yaml'.
3) Edit your hosts file to contain "127.0.0.1  local.www.la1tv.co.uk".
4) Execute "vagrant up" in the console.

You should now be able to browse to 'http://local.www.la1tv.co.uk/' in your web browser and have the site up and running with the database seeded from the data in 'app/database/seeders'!

You can ssh into the virtual machine by executing 'vagrant ssh'.

The website repo is at "https://github.com/LA1TV/Website".