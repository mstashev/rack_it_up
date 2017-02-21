require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require "rack/test"         # => true
require_relative 'app'      # => true

class TestDoctors < Minitest::Test  # => Minitest::Test

  include Rack::Test::Methods  # => TestDoctors

  def app
    App    # => App, App, App, App, App
  end      # => :app

  def test_tenth
    get "/tenth_doctor_ipsum"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       # => #<Rack::MockResponse:0x007fc1ca84eb60 @original_headers={"Content-Type"=>"text/html"}, @errors="", @status=200, @header={"Content-Type"=>"text/html", "Content-Length"=>"555"}, @writer=#<Proc:0x007fc1ca84e8b8@/Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-2.0.1/lib/rack/response.rb:32 (lambda)>, @block=nil, @length=555, @body=["<p>Sweet, maybe... Passionate, I suppose... But don't ever mistake ...
    assert last_response.ok?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # => true
    assert_equal "<p>Sweet, maybe... Passionate, I suppose... But don't ever mistake that for nice. There's something else I've always wanted to say: Allons-y, Alonso! I'm Dr. James McCrimmon from the township of Balamory. People assume that time is a strict progression of cause-and-effect... but actually, from a non-linear, non-subjective viewpoint, it's more like a big ball of wibbly-wobbly... timey-wimey... stuff. River, you know my name. You whispered my name in my ear! There's only one reason I would ever tell anyone my name. There's only one time I could...</p>", last_response.body  # => true
  end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               # => :test_tenth

  def test_eleventh
    get "/eleventh_doctor_ipsum"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             # => #<Rack::MockResponse:0x007fc1cb034208 @original_headers={"Content-Type"=>"text/html"}, @errors="", @status=200, @header={"Content-Type"=>"text/html", "Content-Length"=>"532"}, @writer=#<Proc:0x007fc1ca8df958@/Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-2.0.1/lib/rack/response.rb:32 (lambda)>, @block=nil, @length=532, @body=["<p>I know. Dinosaurs! On a spaceship! I once spent a hell of a long time trying to get a g...
    assert last_response.ok?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 # => true
    assert_equal "<p>I know. Dinosaurs! On a spaceship! I once spent a hell of a long time trying to get a gobby Australian to Heathrow airport. Brave heart, Clara. I never know why. I only know who. No idea. Just do what I do: hold tight and pretend it's a plan. It's a fez. I wear a fez now. Fezzes are cool. Oh, I always rip out the last page of a book. Then it doesn't have to end. I hate endings! Bow ties are cool. Frightened people. Give me a Dalek any day. Please tell me I didn't get old. Anything but old. I was young! Oh... is he grey?</p>", last_response.body  # => true
  end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # => :test_eleventh

  def test_twelfth
    get "/twelfth_doctor_ipsum"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        # => #<Rack::MockResponse:0x007fc1cb057898 @original_headers={"Content-Type"=>"text/html"}, @errors="", @status=200, @header={"Content-Type"=>"text/html", "Content-Length"=>"526"}, @writer=#<Proc:0x007fc1cb057460@/Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-2.0.1/lib/rack/response.rb:32 (lambda)>, @block=nil, @length=526, @body=["<p>Please just... just see me. I don't know. But I'd probably blame the English. Shush. I was be...
    assert last_response.ok?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           # => true
    assert_equal "<p>Please just... just see me. I don't know. But I'd probably blame the English. Shush. I was being chased by a giant dinosaur, but I think I've managed to give it the slip. Oh, you've got a dinosaur too! Well, you're very similar heights. Maybe you should wear labels. I'm Scottish. I can complain about things now. I can really complain about things now. He was dead already, I'm saving us. Follow me, and run! I don't think that I'm a hugging person now. Clara, I'm not your boyfriend. I never said it was your mistake.</p>", last_response.body  # => true
  end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  # => :test_twelfth

  def test_a_404
    get "/serghy45jt65ed"                                        # => #<Rack::MockResponse:0x007fc1ca824298 @original_headers={"Content-Type"=>"text/html"}, @errors="", @status=404, @header={"Content-Type"=>"text/html", "Content-Length"=>"24"}, @writer=#<Proc:0x007fc1cc9136e8@/Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-2.0.1/lib/rack/response.rb:32 (lambda)>, @block=nil, @length=24, @body=["We sorry. We no Engrish."]>
    refute last_response.ok?                                     # => false
    assert_equal 404, last_response.status                       # => true
    assert_equal "We sorry. We no Engrish.", last_response.body  # => true
  end                                                            # => :test_a_404

  def test_env_output
    get "/env"                                # => #<Rack::MockResponse:0x007fc1cb0ad5e0 @original_headers={"Content-Type"=>"text/html"}, @errors="", @status=200, @header={"Content-Type"=>"text/html", "Content-Length"=>"486"}, @writer=#<Proc:0x007fc1cb0ad0e0@/Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-2.0.1/lib/rack/response.rb:32 (lambda)>, @block=nil, @length=486, @body=["{\"rack.version\"=>[1, 3], \"rack.input\"=>#<StringIO:0x007fc1cb0b5100>, \"rack.errors\"=>#<StringIO:0x007fc1cb0b5218>, \"rack.multithread\"=>true, \"rack.multiprocess\"=>true, \"rack.run_once\"=>false, \"REQUEST_METHOD\"=>\"GET\", \"SERVER_NAME\"=>\"example.org\", \"SERVER_PORT\"=>\"80\", \"QUERY_STRING\"=>\"\", \"PATH_INFO\"=>\"/env\", \"rack.url_scheme\"=>\"http\", \"HTTPS\"=>\"off\", \"SCRIPT_NAME\"=>\"\", \"CONTENT_LENGTH\"=>\"0\", \"rack.test\"=>true, \"REMOTE_ADDR\"=>\"127.0.0.1\", \"HTTP_HOST\"=>\"example.org\", \"HTTP_COOKIE\"=>\"\"}"]>
    assert last_response.ok?                  # => true
    assert_equal "{", last_response.body[0]   # => true
    assert_equal "}", last_response.body[-1]  # => true
  end                                         # => :test_env_output

end  # => :test_env_output

# >> Run options: --seed 24984
# >>
# >> # Running:
# >>
# >> .....
# >>
# >> Finished in 0.011686s, 427.8803 runs/s, 1026.9128 assertions/s.
# >>
# >> 5 runs, 12 assertions, 0 failures, 0 errors, 0 skips
