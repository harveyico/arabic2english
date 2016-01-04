# Arabic2English Translator
Currently it only supports up to millions, though adjustable depending what is the highest defined in `word_mapping.yml`

## Stack
* ~> Ruby 2.1.2
* ~> Rspec 3.0.0

## Usage
Running spec
```
$ rspec arabic2english_spec.rb
```

Using ruby execute

```
$ ruby arabic2english.rb 202
=> two hundred two

or multiple..

$ ruby arabic2english.rb 100 1001
=> one hundred
=> one thousand one
```

via Instance

```
$ translator = Arabic2English.new
$ translator.translate!(101)
=> one hundred one
```
