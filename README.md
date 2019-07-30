# rgen

*Command-line tool to generate R packages with reusable logic.*

[![Master Build Status](https://secure.travis-ci.org/tecnickcom/rgen.png?branch=master)](https://travis-ci.org/tecnickcom/rgen?branch=master)
[![Donate via PayPal](https://img.shields.io/badge/donate-paypal-87ceeb.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&currency_code=GBP&business=paypal@tecnick.com&item_name=donation%20for%20rgen%20project)
*Please consider supporting this project by making a donation via [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&currency_code=GBP&business=paypal@tecnick.com&item_name=donation%20for%20rgen%20project)*

* **category**    Tool
* **author**      Nicola Asuni <info@tecnick.com>
* **copyright**   2014-2019 Nicola Asuni - Tecnick.com LTD
* **license**     MIT (see [LICENSE](LICENSE))
* **link**        https://github.com/tecnickcom/rgen


## Description

This is a command-line tool to quickly generate R packages with a common set of features and reusable logic.

Each generated project is immediately functional and can be fully tested using the ```make build``` command.


## Quick Start

This project includes a Makefile that allows you to test and build the project in a Linux-compatible system with simple commands.  
All the artifacts and reports produced using this Makefile are stored in the *target* folder.  

To see all available options:
```
make help
```


## Usage

```
make new TYPE=lib CONFIG=myproject.cfg
```

* **TYPE** is the project type:
    * **lib**  :  library

* **CONFIG** is the configuration file containing the project settings.

To create a new configuration please clone the *default.cfg* file and change the values.

All projects are creted inside the *target* directory.
