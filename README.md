# README

## Problem:

[Build a URL shortner](https://projectbook.code.brettchalupa.com/web-apps/url-shortener.html)

## Solution:

Under the controllers folder I created 2 controllers that solve this problem:

1. `app/controllers/shortner/simple/urls_controller.rb` - The simple/Rails approach
2. `app/controllers/shortner/enterprise/urls_controller.rb` a more enterprise approach(not finished, but working)

The simple controller uses Rails methods to create a short URL, while the enterprise controller uses a service object(a
transaction) to create a short URL and contracts to validate the input.