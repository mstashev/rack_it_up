require 'minitest/autorun'
require 'minitest/pride'
require "rack/test"
require_relative 'app'

class TestDoctors < Minitest::Test

  include Rack::Test::Methods

  def app
    App
  end

  def test_tenth
    get "/tenth_doctor_ipsum"
    # p last_response
    assert last_response.ok?
    assert_equal "<p>Sweet, maybe... Passionate, I suppose... But don't ever mistake that for nice. There's something else I've always wanted to say: Allons-y, Alonso! I'm Dr. James McCrimmon from the township of Balamory. People assume that time is a strict progression of cause-and-effect... but actually, from a non-linear, non-subjective viewpoint, it's more like a big ball of wibbly-wobbly... timey-wimey... stuff. River, you know my name. You whispered my name in my ear! There's only one reason I would ever tell anyone my name. There's only one time I could...</p>", last_response.body
  end

  def test_eleventh
    get "/eleventh_doctor_ipsum"
    # p last_response
    assert last_response.ok?
    assert_equal "<p>I know. Dinosaurs! On a spaceship! I once spent a hell of a long time trying to get a gobby Australian to Heathrow airport. Brave heart, Clara. I never know why. I only know who. No idea. Just do what I do: hold tight and pretend it's a plan. It's a fez. I wear a fez now. Fezzes are cool. Oh, I always rip out the last page of a book. Then it doesn't have to end. I hate endings! Bow ties are cool. Frightened people. Give me a Dalek any day. Please tell me I didn't get old. Anything but old. I was young! Oh... is he grey?</p>", last_response.body
  end

  def test_twelfth
    get "/twelfth_doctor_ipsum"
    # p last_response
    assert last_response.ok?
    assert_equal "<p>Please just... just see me. I don't know. But I'd probably blame the English. Shush. I was being chased by a giant dinosaur, but I think I've managed to give it the slip. Oh, you've got a dinosaur too! Well, you're very similar heights. Maybe you should wear labels. I'm Scottish. I can complain about things now. I can really complain about things now. He was dead already, I'm saving us. Follow me, and run! I don't think that I'm a hugging person now. Clara, I'm not your boyfriend. I never said it was your mistake.</p>", last_response.body
  end

  def test_a_404
    get "/serghy45jt65ed"
    refute last_response.ok?
    assert_equal 404, last_response.status
    assert_equal "We're sorry. We couldn't that.", last_response.body
  end

  def test_env_output
    get "/env"
    assert last_response.ok?
    assert_equal "{", last_response.body[0]
    assert_equal "}", last_response.body[-1]
  end

end
