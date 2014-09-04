require "think_page/version"
require "restclient_api_base"
require "oj"

module ThinkPage
  include RestclientApiBase

  self.base_url = 'https://api.thinkpage.cn/v2/weather/'

  class << self

    def format_weather_result response, api_url, options = {}
      begin
        Oj.load(response)
      rescue
        write_log(response, api_url, options)
      end
    end
  end

  # define Class Methods, get_all, get_now, etc.
  #
  # like:
  # def get_all options
  #   @all_url ||= "all.json"
  #   res = self.get(@all_url, options)
  #   format_weather_result(res, @all_url, options)
  # end
  #
  lambda do
    %w(all now future air suggestion history24h accuracy).each do |_method|
      define_singleton_method("get_#{_method}") do |options|
        unless instance_variable_get("@#{_method}_url")
          instance_variable_set("@#{_method}_url", "#{_method}.json")
        end

        if self.private_params == {}
          warn 'Your api key is empty'
          return
        end

        res = self.get(instance_variable_get("@#{_method}_url"), options)
        format_weather_result(res, instance_variable_get("@#{_method}_url"), options)
      end
    end
  end.call
end
