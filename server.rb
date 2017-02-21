require 'rack'
require_relative 'tenth_doctor_ipsum'
require_relative 'eleventh_doctor_ipsum'
require_relative 'twelfth_doctor_ipsum'

app = Proc.new do |env|
  num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "")
  num = 1 if num.to_i.zero?
  path = env["PATH_INFO"]
  headers = {'Content-Type' => 'text/html'}
  current_time = Time.now()

  if path == "/env"
    ['200', headers, [env.inspect]]
  elsif path == "/lipsums"
    ['200', headers, ["/tenth_doctor_ipsum<br>","/eleventh_doctor_ipsum<br>","/twelfth_doctor_ipsum"]]
  elsif path.start_with?("/tenth_doctor_ipsum")
    ['200', headers, [TenthDoctor.call(num.to_i)]]
  elsif path.start_with?("/eleventh_doctor_ipsum")
    ['200', headers, [EleventhDoctor.call(num.to_i)]]
  elsif path.start_with?("/twelfth_doctor_ipsum")
    ['200', headers, [TenthDoctor.call(num.to_i)]]
  elsif path.start_with?("/current_time")
    ['200', headers, [current_time.strftime("%Y-%m-%d %H:%M:%S")]]
  else
    ['404', headers, ["We sorry. We no Engrish."]]
  end

end

Rack::Handler::WEBrick.run app
