Dashing mining dashboard
====================

[Dashing](https://github.com/Shopify/dashing) web dashboard designed for monitoring cryptocurrency mining. Works on both desktop and mobile browsers.

![iPad Dashboard](http://f.cl.ly/items/1l1w1K0F1K2i0K1n172E/dashboard.png)

DMD allows you to easily aggregate statistics from multiple cgminer instances via [agent script](https://github.com/suda/dashing-mining-agent).

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

1. Create Heroku account and install toolbelt: https://devcenter.heroku.com/articles/quickstart
2. Clone repository: `git clone https://github.com/suda/dashing-mining-dashboard.git`
3. Enter directory: `cd dashing-mining-dashboard`
4. Create Heroku application: `heroku apps:create APP_NAME`
5. Rename/duplicate `default.erb` in `dashboards` directory to your worker names. Every worker should have it's own dashboard.
6. Set `AUTH_TOKEN` config variable using Heroku toolbelt: `heroku config:set AUTH_TOKEN=your_secret_token`
7. Deploy your dashboard to Heroku: `git push heroku master`
8. Start [sending events using agent](https://github.com/suda/dashing-mining-agent)
9. Visit your dashboard at `http://APP_NAME.herokuapp.com/WORKER_NAME`

On iOS you can add this page to home screen for better experience.


If you have any problems with setting up this dashboard, [create new issue](https://github.com/suda/dashing-mining-dashboard/issues/new) and I'll try to help.

Todo
====

* switching between dashboards
* adding dashboards without need to deploy

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
