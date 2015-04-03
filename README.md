Dashing mining dashboard
====================

[Dashing](https://github.com/Shopify/dashing) web dashboard designed for monitoring cryptocurrency mining. Works on both desktop and mobile browsers

Check out [a sample dashboard](http://mining-dashboard.herokuapp.com/gigabyte).

![iMac, iPad and iPhone Dashboard](http://f.cl.ly/items/280W0j1x1q2L3K0D1O1C/placeit.jpg)

DMD allows you to easily aggregate statistics from multiple cgminer/cpuminer instances via [agent script](https://github.com/suda/dashing-mining-agent).

Features
========

* simple setup
* automatic refresh
* responsive layout
* displaying khps and GPU temperature graphs and shares accepted, rejected, HW errors, time elapsed time values
* mobile friendly web app (view on any mobile or desktop browser)

Setup
=====

You can do this on any computer (not nesessary your worker).

1. Create Heroku account and install toolbelt: https://toolbelt.heroku.com/
2. Clone repository: `git clone https://github.com/suda/dashing-mining-dashboard.git`
3. Enter directory: `cd dashing-mining-dashboard`
4. Create Heroku application: `heroku apps:create APP_NAME`
5. Rename/duplicate `default.erb` in `dashboards` directory to your worker names. Every worker should have it's own dashboard.
6. Set `AUTH_TOKEN` config variable using Heroku toolbelt: `heroku config:set AUTH_TOKEN=your_secret_token`
7. Deploy your dashboard to Heroku: `git push heroku master`
8. Start [sending events using agent](https://github.com/suda/dashing-mining-agent)
9. Visit your dashboard at `http://APP_NAME.herokuapp.com/WORKER_NAME`

On iOS you can add this page to home screen for better experience.

[Optional] Setup on your own Ubuntu Dashing Server
=====

Instead of using Heroku, you can choose to setup the required pieces on your own web server.
Below are instructions of setting this up on an Ubuntu server (tested with Raspberry PI with Raspbian)

1. Setup Ubuntu flavor on your device with minimal installation
2. Perform updates and install dependencies
* `sudo apt-get update`
* `sudo apt-get upgrade`
* 
3. Based on Platform, perform the following
*
* Ubuntu
* `sudo apt-get install ruby ruby-dev screen build-essential nodejs`
* `sudo gem install bundler`
* `sudo gem install dashing`
* 
* Raspberry Pi
* `sudo apt-get install git libssl-dev ruby ruby-dev screen`
*  Change directory to opt (`cd /opt`)
*  Install node, needed because dashing installs the execjs gem and uses coffeescript
* `sudo curl -O http://node-arm.herokuapp.com/node_latest_armhf.deb`
* `sudo dpkg -i node_latest_armhf.deb`
* `echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc`
* `sudo gem install bundler dashing`
* 
4. Clone repository: `sudo git clone https://github.com/suda/dashing-mining-dashboard.git`
5. Enter directory: `cd dashing-mining-dashboard`
6. Rename/duplicate `default.erb` in `dashboards` directory to your worker names. Every worker should have it's own dashboard. (`sudo cp default.erb worker_name.erb`)
7. Edit `config.ru` and replace `set :auth_token, ENV['AUTH_TOKEN']` with `set :auth_token, 'YourSecureKey'`
8. Adjust permissions of your dahsing-mining-dashboard directory
* `sudo chmod 755 /opt/dashing-mining-dashboard`
9. Bundle your dashboard (`bundle install`)
10. Start the dashboard (`sudo dashing start`)
11. Start [sending events using agent](https://github.com/suda/dashing-mining-agent)
12. Visit your dashboard at `http://IP/WORKER_NAME`
13. If everything is working properly, add the following to automatically start the dashing server on startup
* Copy dashboard.sh to service directory (`sudo cp /opt/dashing-mining-dashboard/dashboard.sh /etc/init.d/dashboard`)
* Update permissions of the file (`sudo chmod 755 /etc/init.d/dashboard`)
* Update `/etc/rc.local` and add the following line (`sudo /usr/bin/screen -dmS dashing sh /etc/init.d/dashboard start`)
* Reboot and verify it starts up automatically

If you have any problems with setting up this dashboard, [create new issue](https://github.com/suda/dashing-mining-dashboard/issues/new) and I'll try to help.

[Optional] Edit Dashboard Units
=====

Your agent can now send modified temperature and hashing units.  Be sure to update your dashboard if you change the defaults otherwise visually the data will not make sense.

1. Navigate to the `dashboards` directory
2. Edit `layout.erb`
3. Update Hashing Units:
* Replace `<div data-id="<%= params[:dashboard] %>_hash" data-view="Graph" data-title="KH/s" style="background-color:#ff9618">`
* With `<div data-id="<%= params[:dashboard] %>_hash" data-view="Graph" data-title="[PROPERUNITS]" style="background-color:#ff9618">`
* `[PROPERUNITS]` = KH/s, MH/s, or GH/s
4. Update Temperature Units:
* Replace `<div data-id="<%= params[:dashboard] %>_temperature" data-view="Temperature" data-title="Temperature (&deg;C)" style="background-color:#12B0C5;">`
* With `<div data-id="<%= params[:dashboard] %>_temperature" data-view="Temperature" data-title="Temperature (&deg;[PROPERUNITS])" style="background-color:#12B0C5;">`
* `[PROPERUNITS]` = "C or F"

config.ru Settings
====
There are currently two editable options with `config.ru`

1. `set :auth_token, ENV['AUTH_TOKEN']`
* Only edit if you ar ehosting your own dashing server
2. `set :protection, :except => :frame_options`
* Remove or add # in-front (comment out) if you do not want your dashboard to be able to be included within other sites

Todo
====

* switching between dashboards
* adding dashboards without need to deploy
* add global dashboard
* update data_title in dashboards dynamically to reflect unit types being sent to them (temperature and hash)
* option to add pool dashboards

Donations
========

Any donations are welcome and should result in more features in less time :)

BTC address: `1AAkZXsn9c2EWWbo7yzDEgMz1b3wMBN52Q`

LTC address: `LehFD6SvT3PfE4gBbrQwhXdrmFWwdrFxrU`

Author
======

Wojtek Siudzinski - [@suda](https://twitter.com/suda)

License
=======

Distributed under the [MIT license](https://github.com/suda/dashing-mining-dashboard/blob/master/LICENSE)
