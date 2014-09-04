# ThinkPage

心知天气(ThinkPage) Ruby SDK, 详细参数请见 [天气数据接口API](http://www.thinkpage.cn/weather/api/)

## Installation

Add this line to your application's Gemfile:

    gem 'think_page'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install think_page

## Usage

```ruby
require 'think_page'

ThinkPage.private_params = { key: 'Your key' }

# 获取指定城市的全部天气信息
ThinkPage.get_all(city: 'CHBJ000000'....)

# 获取指定城市的实时天气
ThinkPage.get_now(city: 'CHBJ000000'....)

# 获取指定城市的预报天气
ThinkPage.get_future(city: 'CHBJ000000'....)

# 获取指定城市的AQI、PM2.5、PM10、CO、NO2、O3等空气质量信息
ThinkPage.get_air(city: 'CHBJ000000'....)

# 获取指定城市的穿衣、紫外线、汽车、感冒、运动等生活建议指数信息
ThinkPage.get_suggestion(city: 'CHBJ000000'....)

# 获取过去24小时每小时天气和空气质量历史数据。仅支持大客户会员
ThinkPage.get_history24h(city: 'CHBJ000000'....)

# 获取每个城市分别根据历史数据计算的每天天气预报准确度。仅支持大客户会员
ThinkPage.get_accuracy(city: 'CHBJ000000'....)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/think_page/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
