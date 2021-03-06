# Iprofiler

Ruby wrapper for the [Iprofile API](http://www.iprofile.net/developer). Heavily inspired by [Wynn Netherland's](https://github.com/pengwynn) [LinkedIn gem](https://github.com/pengwynn/linkedin).

Travis CI : [![Build Status](https://api.travis-ci.org/kandadaboggu/iprofiler.png?branch=master)](http://travis-ci.org/kandadaboggu/iprofiler)
## Installation

Add the following line to your Gemfile.

``` ruby
gem 'iprofiler'
```

Install the gem by using `bundler`

    bundle install

## Usage

**Setting the connection parameters globally**

``` ruby
Iprofiler.configure do |config|
  config.api_key = "<<YOUR API KEY>>" 
  config.api_secret = "<<YOUR API SECRET>>" 
  config.api_host = "http://visitoriq2.iprofile.net"
end
client = Iprofiler::Client.new
```
 
 
**Setting the connection parameters per connection**
 
``` ruby
Iprofiler.configure do |config|
  config.api_host = "http://visitoriq2.iprofile.net"
end

client = Iprofiler::Client.new ( "<<YOUR API KEY>>", "<<YOUR API SECRET>>")
```
 
**Invoking the API**
 
``` ruby
client = Iprofiler::Client.new
client.company_lookup(:company_name => "Bank Of America")    
client.company_lookup(:ip_address => "10.10.10.2")
client.company_lookup(:domain => "bankofamerica.com")

# When invoked with multiple parameters, the lookup is performed in the following order
#      domain
#      company_name
#      ip_address
client.company_lookup(:domain => "bankofamerica.com", :company_name => "Bank Of America", :ip_address => "10.10.10.2")

```
    
**Error/ISP handling**
 
``` ruby
reply = client.company_lookup(:ip_address => "2.228.11.0")    
if reply.status == :found
  if reply.company.type == "company"
    puts "Processed Company"
  else
    puts "Ignored ISP"
  end
elsif reply.status == :not_found
  puts "Not found"
elsif reply.status == :insufficient_input
  puts "Invalid input"
elsif reply.status == :error
  puts "Error #{reply.error}"
end
```

## TODO


## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 [Harish Shetty](http://kandadaboggu.com). See LICENSE for details.
