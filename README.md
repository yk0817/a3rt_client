# A3rtClient
https://a3rt.recruit-tech.co.jp/
A3RT (art) is an abbreviation of "ANALYTICS & ARTIFICIAL INTELLIGENCE API VIA RECRUIT TECHNOLOGIES".
A3RT is a general term for a project-oriented solution for unifying and maintaining logic in a field called artificial intelligence in a single brand, represented by Deep Learning among machine learning.


## Installation

```ruby
gem 'a3rt_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install a3rt_client

## Usage

### Talk API
https://a3rt.recruit-tech.co.jp/product/talkAPI/

```ruby
require "a3rt_client"
# option requrest_parameter: callback
response = A3rt::Client.talk_api(apikey: apikey, query: "おはようございます")
p resonse
# => {"status"=>0, "message"=>"ok", "results"=>[{"perplexity"=>1.189832892522537, "reply"=>"今日も暑いですね"}]}
```

### Text Suggest
https://a3rt.recruit-tech.co.jp/product/textSuggestAPI/

```ruby
require "a3rt_client"
# option requrest_parameter: callback, style, separation
response = A3rt::Client.text_sugges(apikey: apikey, previous_description: "水")
p resonse
# => {"status"=>0, "message"=>"ok", "suggestion"=>["を飲んでいます。", "の下にいる象たちの顔が見えています。", "の中に入れられています。"]}
```

### Text Summarization

```ruby
require "a3rt_client"
p A3rt::Client.text_summarization(apikey: apiKey, sentences: "センテンス1。センテンス2。センテンス3。")
# => {"message"=>"Summarization is completed", "status"=>0, "summary"=>["センテンス1"]}
```

### Proofreading API

```ruby
require "a3rt_client"
p A3rt::Client.proofreading(apikey: apikey, sentence: "システムの企画から開発・運用まで幅広く関われます。")
# => {"resultID"=>"4e9ae6450fe2", "status"=>0, "message"=>"ok", "inputSentence"=>"システムの企画から開発・運用まで幅広く関われます。", "normalizedSentence"=>"システムの企画から開発・運用まで幅広く関われます。", "checkedSentence"=>"システムの企画から開発・運用まで幅広く関われます。"}
```

### Image Search 
```ruby
require "a3rt_client"
p A3rt::Client.text_summarization(apikey: apikey, query: "馬に乗った男性")
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yk0817/a3rt_client. This project is intended to be a safe, welcoming space for 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the A3rtClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/a3rt_client/blob/master/CODE_OF_CONDUCT.md).
