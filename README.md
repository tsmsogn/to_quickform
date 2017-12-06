# ToQuickform [![Build Status](https://travis-ci.org/tsmsogn/to_quickform.svg?branch=master)](https://travis-ci.org/tsmsogn/to_quickform)

ToQuickform creates some QuickForm codes from given data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_quickform'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_quickform

## Usage

### Parseing an YAML/JSON 

```ruby
generator = ToQuickform.YAML(yaml)
generator = ToQuickform.JSON(json)
```

#### YAML format:

See https://github.com/tsmsogn/to_quickform/blob/master/spec/fixtures/sample.yaml

#### JSON format:

See https://github.com/tsmsogn/to_quickform/blob/master/spec/fixtures/sample.json

### Creating setDefaults() codes

```ruby
generator.to_set_defaults
# $form->setDefaults(array(
#     'gender' => 'female'
# ));
```

### Creating createElement()/addElement() codes

```ruby
generator.to_create_element
# // name
# $form->addElement('text', 'name', '', '');
# // mail
# $form->addElement('text', 'mail', '', '');
# // mail_conf
# $form->addElement('text', 'mail_conf', '', '');
# // gender
# $tmp = array();
# $tmp[] = $form->createElement('radio', '', '', '女性', 'female');
# $tmp[] = $form->createElement('radio', '', '', '男性', 'male');
# $form->addGroup($tmp, 'gender', '', '');
# // zip_code
# $tmp = array();
# $tmp[] = $form->createElement('text', '', '', 'maxlength="3"', '');
# $tmp[] = $form->createElement('text', '', '', 'maxlength="4"', '');
# $form->addGroup($tmp, 'zip_code', '', '&nbsp;-&nbsp;');
# // state
# $form->addElement('select', 'state', '', array(
#     '' => '選択してください',
#     1 => '北海道',
#     2 => '青森県',
#     3 => '岩手県',
#     4 => '宮城県',
#     5 => '秋田県',
#     6 => '山形県',
#     7 => '福島県',
#     8 => '茨城県',
#     9 => '栃木県',
#     10 => '群馬県',
#     11 => '埼玉県',
#     12 => '千葉県',
#     13 => '東京都',
#     14 => '神奈川県',
#     15 => '新潟県',
#     16 => '富山県',
#     17 => '石川県',
#     18 => '福井県',
#     19 => '山梨県',
#     20 => '長野県',
#     21 => '岐阜県',
#     22 => '静岡県',
#     23 => '愛知県',
#     24 => '三重県',
#     25 => '滋賀県',
#     26 => '京都府',
#     27 => '大阪府',
#     28 => '兵庫県',
#     29 => '奈良県',
#     30 => '和歌山県',
#     31 => '鳥取県',
#     32 => '島根県',
#     33 => '岡山県',
#     34 => '広島県',
#     35 => '山口県',
#     36 => '徳島県',
#     37 => '香川県',
#     38 => '愛媛県',
#     39 => '高知県',
#     40 => '福岡県',
#     41 => '佐賀県',
#     42 => '長崎県',
#     43 => '熊本県',
#     44 => '大分県',
#     45 => '宮崎県',
#     46 => '鹿児島県',
#     47 => '沖縄県'
# ), 'class="p-region"');
# // city
# $form->addElement('text', 'city', '', 'class="p-locality"');
# // address
# $form->addElement('text', 'address', '', 'class="p-street-address p-extended-address"');
# // pc
# $tmp = array();
# $tmp[] = $form->createElement('checkbox', 'windows', '', 'Windows', '');
# $tmp[] = $form->createElement('checkbox', 'linux', '', 'Linux', '');
# $form->addGroup($tmp, 'pc', '', '');
# // note
# $form->addElement('textarea', 'note', '', '');
# // privacy_policy
# $form->addElement('checkbox', 'privacy_policy', '', '同意する');
```

### Createing addRule()/addGrouoRule() codes

```ruby
generator.to_add_rule
# $form->addRule('name', '名前を入力してください', 'required');
# $form->addRule('mail', 'メールアドレスを入力してください', 'required');
# $form->addRule('mail', '正しいメールアドレスを入力してください', 'regex', '/^[^@]+@[^.]+\..+$/');
# $form->addRule(array('mail', 'mail_conf'), 'メールアドレスが一致しません', 'compare');
# $form->addRule('mail_conf', '確認用メールアドレスを入力してください', 'required');
# $form->addRule('mail_conf', '正しい確認用メールアドレスを入力してください', 'regex', '/^[^@]+@[^.]+\..+$/');
# $form->addRule('gender', '性別を選択してください', 'required');
# $form->addGroupRule('zip_code', '郵便番号を入力してください', 'required');
# $form->addGroupRule('zip_code', '郵便番号を数字で入力してください', 'numeric');
# $form->addRule('state', '都道府県を選択してください', 'required');
# $form->addRule('city', '市区町村を入力してください', 'required');
# $form->addRule('pc', 'PCを選択してください', 'required');
# $form->addRule('privacy_policy', '「同意する」にチェックしてください', 'required');
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tsmsogn/to_quickform.
