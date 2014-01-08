Dashing mining dashboard
====================

[Dashing](https://github.com/Shopify/dashing) dashboard designed for monitoring cryptocurrency mining.

![iPad Dashboard](http://f.cl.ly/items/1l1w1K0F1K2i0K1n172E/dashboard.png)

DMD allows you to easily aggregate statistics from multiple cgminer instances via [agent script](https://github.com/suda/dashing-mining-agent).

Features
========

* simple setup ([about 30 seconds on Heroku](https://github.com/Shopify/dashing/wiki/How-to%3A-Deploy-to-Heroku))
* automatic refresh
* displaying khps and GPU temperature graphs and shares accepted, rejected, HW errors, time elapsed time values
* mobile friendly (currently horizontal iPad)

Setup
=====

1. Clone repository: `git clone https://github.com/suda/dashing-mining-dashboard.git`
2. Rename/duplicate `default.erb` in `dashboards` directory to your dashboard names
3. Follow [Heroku deployment instructions](https://github.com/Shopify/dashing/wiki/How-to%3A-Deploy-to-Heroku)
4. Set `AUTH_TOKEN` config variable using Heroku toolbelt: `heroku config:set AUTH_TOKEN=your_secret_token`
5. Start [sending events using agent](https://github.com/suda/dashing-mining-agent)

Todo
====

* responsiveness (different displays support)
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
