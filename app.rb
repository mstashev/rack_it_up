require 'rack'
require_relative 'tenth_doctor_ipsum'
require_relative 'eleventh_doctor_ipsum'
require_relative 'twelfth_doctor_ipsum'

class App

   attr_accessor :env, :path

  def initialize(env)
    @env = env
    @path = env["PATH_INFO"]
    @current_time = Time.now()
  end

  def response
    if Array(env["HTTP_USER_AGENT"]).detect{|agent| agent.include? "Googlebot"}
      go_away_google
    elsif path == "/env"
      output_env
    elsif path == "/lipsums"
      ['200', headers, ["/tenth_doctor_ipsum<br>","/eleventh_doctor_ipsum<br>","/twelfth_doctor_ipsum"]]
    elsif path.start_with?("/tenth_doctor_ipsum")
      tenth_doctor
    elsif path.start_with?("/eleventh_doctor_ipsum")
      eleventh_doctor
    elsif path.start_with?("/twelfth_doctor_ipsum")
      twelfth_doctor
    elsif path.start_with?("/current_time")
      ['200', @headers, [@current_time.strftime("%Y-%m-%d %H:%M:%S")]]
    else
      four_oh_four
    end
  end

  def go_away_google
    ['401', headers, ["Go away, Google"]]
  end

  def tenth_doctor
    ['200', headers, [TenthDoctor.call(1)]]
  end

  def eleventh_doctor
    ['200', headers, [EleventhDoctor.call(1)]]
  end

  def twelfth_doctor
    ['200', headers, [TwelfthDoctor.call(1)]]
  end

  def output_env
    ['200', headers, env.inspect]
  end

  def posterize
    body = env["rack.input"].read
            .split("&")
            .collect{|field| URI.unescape field.split("=").last}
            .join(" ")
    ['200', headers, body]
  end

  def headers
    {'Content-Type' => 'text/html'}
  end

  def four_oh_four
    ['404', headers, ["We're sorry. We couldn't that."]]
  end

  def self.call(env)
    new(env).response
  end
end
