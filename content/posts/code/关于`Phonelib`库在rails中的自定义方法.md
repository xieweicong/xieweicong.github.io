---
date: '2025-01-05T15:50:29+09:00'
draft: false
title: '关于Phonelib库在rails中的自定义方法'
tags: [ruby]
---

In case you need to overwrite some Google's libphonenumber library data, you need to assign file path to this setter. File should be Marshal.dump'ed with existing structure like in Phonelib.phone_data. Gem is simply doing merge between hashes.

```ruby
Phonelib.override_phone_data = '/path/to/override_phone_data.dat'
```

In case you want to add some custom or still not updated regex patterns for certain type you can use additional regexes feature in a following way:

```ruby
Phonelib.add_additional_regex :us, Phonelib::Core::MOBILE, '[5]{10}' # this will add number 1-555-555-5555 to be valid
Phonelib.add_additional_regex :gb, Phonelib::Core::MOBILE, '[1]{5}' # this will add number 44-11-111 to be valid
# you can also specify all regexes using this method
Phonelib.additional_regexes = [[:us, :mobile, "[5]{10}"], [:gb, :mobile, "[1]{5}"]]
# or just use dump method to keep them altogether
Phonelib.dump_additional_regexes # => [["US", :mobile, "[5]{10}"], ["GB", :mobile, "[1]{5}"]
```

`Phonelib.phone_data['JP']`来获取需要的国家的格式化信息

```
Phonelib.phone_data['JP']
=> {:id=>"JP",
 :country_code=>"81",
 :international_prefix=>"010",
 :national_prefix=>"0",
 :national_prefix_for_parsing=>"(000[259]\\d{6})$|(?:(?:003768)0?)|0",
 :national_prefix_transform_rule=>"\\1",
 :mobile_number_portable_region=>"true",
 :types=>
  {:general_desc=>
    {:national_number_pattern=>"00[1-9]\\d{6,14}|[257-9]\\d{9}|(?:00|[1-9]\\d\\d)\\d{6}",
     :possible_number_pattern=>"\\d{8,17}|\\d{9}|\\d{10}",
     :short=>
      {:national_number_pattern=>"[01]\\d\\d(?:\\d{7})?", :possible_number_pattern=>"\\d{3}|\\d{10}"}},
   :no_international_dialling=>
    {:possible_number_pattern=>"\\d{8,17}",
     :national_number_pattern=>
      "00(?:777(?:[01]|(?:5|8\\d)\\d)|882[1245]\\d\\d)\\d\\d|00(?:37|66|78)\\d{6,13}"},
   :fixed_line=>
    {:possible_number_pattern=>"\\d{9}",
     :example_number=>"312345678",
     :national_number_pattern=>
      "(?:1(?:1[235-8]|2[3-6]|3[3-9]|4[2-6]|[58][2-8]|6[2-7]|7[2-9]|9[1-9])|(?:2[2-9]|[36][1-9])\\d|4(?:[2-578]\\d|6[02-8]|9[2-59])|5(?:[2-589]\\d|6[1-9]|7[2-8])|7(?:[25-9]\\d|3[4-9]|4[02-9])|8(?:[2679]\\d|3[2-9]|4[5-9]|5[1-9]|8[03-9])|9(?:[2-58]\\d|[679][1-9]))\\d{6}"},
   :mobile=>
    {:possible_number_pattern=>"\\d{10}",
     :example_number=>"9012345678",
     :national_number_pattern=>"[7-9]0[1-9]\\d{7}"},
   :pager=>
    {:possible_number_pattern=>"\\d{10}",
     :example_number=>"2012345678",
     :national_number_pattern=>"20\\d{8}"},
   :toll_free=>
    {:possible_number_pattern=>"\\d{8,17}",
     :example_number=>"120123456",
     :national_number_pattern=>
      "00777(?:[01]|5\\d)\\d\\d|(?:00(?:7778|882[1245])|(?:120|800\\d)\\d\\d)\\d{4}|00(?:37|66|78)\\d{6,13}",
     :short=>
      {:possible_number_pattern=>"\\d{3}", :example_number=>"110", :national_number_pattern=>"11[089]"}},
   :premium_rate=>
    {:possible_number_pattern=>"\\d{9}",
     :example_number=>"990123456",
     :national_number_pattern=>"990\\d{6}"},
   :personal_number=>
    {:possible_number_pattern=>"\\d{9}",
     :example_number=>"601234567",
     :national_number_pattern=>"60\\d{7}"},
   :voip=>
    {:possible_number_pattern=>"\\d{10}",
     :example_number=>"5012345678",
     :national_number_pattern=>"50[1-9]\\d{7}"},
   :uan=>
    {:possible_number_pattern=>"\\d{9}",
     :example_number=>"570123456",
     :national_number_pattern=>"570\\d{6}"},
   :short_code=>
    {:short=>
      {:possible_number_pattern=>"\\d{3}|\\d{10}",
       :example_number=>"102",
       :national_number_pattern=>"000[259]\\d{6}|1(?:0[24]|1[089]|44|89)"}},
   :emergency=>
    {:short=>
      {:possible_number_pattern=>"\\d{3}", :example_number=>"110", :national_number_pattern=>"11[09]"}},
   :sms_services=>
    {:short=>
      {:possible_number_pattern=>"\\d{10}",
       :example_number=>"0002000000",
       :national_number_pattern=>"000[259]\\d{6}"}}},
 :formats=>
  [{:pattern=>"(\\d{4})(\\d{4})", :leading_digits=>"00777[01]", :format=>"$1-$2", :intl_format=>"NA"},
   {:pattern=>"(\\d{3})(\\d{3})(\\d{3})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>"(?:12|57|99)0",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d{4})(\\d)(\\d{4})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>
     "1(?:267|3(?:7[247]|9[278])|466|5(?:47|58|64)|6(?:3[245]|48|5[4-68]))|499[2468]|5(?:769|979[2-69])|7468|8(?:3(?:8[7-9]|96[2457-9])|477|51[2-9])|9(?:802|9(?:1[23]|69))|1(?:45|58)[67]",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d{2})(\\d{3})(\\d{4})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>"60",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d)(\\d{4})(\\d{4})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>"[36]|4(?:2(?:0|9[02-69])|7(?:0[019]|1))",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d{2})(\\d{3})(\\d{4})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>
     "1(?:1|5(?:4[018]|5[017])|77|88|9[69])|2(?:2[127]|3[0-269]|4[59]|5(?:[1-3]|5[0-69]|9(?:17|99))|6(?:2|4[016-9])|7(?:[1-35]|8[0189])|8(?:[16]|3[0134]|9[0-5])|9(?:[028]|17))|4(?:2(?:[13-79]|8[014-6])|3[0-57]|[45]|6[248]|7[2-47]|9[29])|5(?:2|3(?:[045]|9(?:[0-58]|6[4-9]|7[0-35689]))|4[0-369]|5[29]|8[02389]|9[0-3])|7(?:2[02-46-9]|34|[58]|6[0249]|7[57]|9(?:[23]|4[0-59]|5[01569]|6[0167]))|8(?:2(?:[1258]|4[0-39]|9[0169])|3(?:[29]|60|7(?:[017-9]|6[6-8]))|49|51|6(?:[0-24]|36[2-57-9]|5(?:[0-389]|5[23])|6(?:[01]|9[178])|7(?:2[2-468]|3[78])|9[0145])|7[0-468]|8[68])|9(?:4[15]|5[138]|7[156]|8[189]|9(?:[1289]|3(?:31|4[357])|4[0178]))|(?:8294|96)[1-3]|2(?:57|93)[015-9]|(?:223|8699)[014-9]|(?:25[0468]|422|838)[01]|(?:48|8292|9[23])[1-9]|(?:47[59]|59[89]|8(?:68|9))[019]",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d{3})(\\d{2})(\\d{4})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>"[14]|[289][2-9]|5[3-9]|7[2-4679]",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d{4})(\\d{2})(\\d{3,4})",
    :leading_digits=>"0077",
    :format=>"$1-$2-$3",
    :intl_format=>"NA"},
   {:pattern=>"(\\d{4})(\\d{2})(\\d{4})", :leading_digits=>"008", :format=>"$1-$2-$3", :intl_format=>"NA"},
   {:pattern=>"(\\d{3})(\\d{3})(\\d{4})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>"800",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d{2})(\\d{4})(\\d{4})",
    :national_prefix_formatting_rule=>"$NP$FG",
    :leading_digits=>"[257-9]",
    :format=>"$1-$2-$3"},
   {:pattern=>"(\\d{4})(\\d{3})(\\d{3,4})", :leading_digits=>"0", :format=>"$1-$2-$3", :intl_format=>"NA"},
   {:pattern=>"(\\d{4})(\\d{4})(\\d{4,5})", :leading_digits=>"0", :format=>"$1-$2-$3", :intl_format=>"NA"},
   {:pattern=>"(\\d{4})(\\d{5})(\\d{5,6})", :leading_digits=>"0", :format=>"$1-$2-$3", :intl_format=>"NA"},
   {:pattern=>"(\\d{4})(\\d{6})(\\d{6,7})", :leading_digits=>"0", :format=>"$1-$2-$3", :intl_format=>"NA"},
   {:pattern=>"(\\d{3})(\\d{2})(\\d{4})", :leading_digits=>"(?:12|57|99)0", :format=>"$1 $2 $3"},
   {:pattern=>"(\\d{3})(\\d{2})(\\d{2})(\\d{2})", :leading_digits=>"(?:12|57|99)0", :format=>"$1 $2 $3 $4"},
   {:pattern=>"(\\d{3})(\\d{4})(\\d{2})", :leading_digits=>"(?:12|57|99)0", :format=>"$1 $2 $3"}]}
```

可以在其中寻找需要修改的部分，这一次需要修改日本手机号码中，以060开头的号码，使其允许以及格式化。在2024/12中旬之后会开放这个号码，但谷歌的原始数据更新缓慢。需要修改的部分如下：

```dat
general_desc: {
  national_number_pattern: "00[1-9]\\d{6,14}|[25-9]\\d{9}|(?:00|[1-9]\\d\\d)\\d{6}",
  possible_number_pattern: "\\d{8,17}|\\d{9}|\\d{10}",
  short: {
    national_number_pattern: "[01]\\d\\d(?:\\d{7})?",
    possible_number_pattern: "\\d{3}|\\d{10}"
  }
},

{
  pattern: "(\\d{2})(\\d{4})(\\d{4})",
  national_prefix_formatting_rule: "$NP$FG",
  leading_digits: "[25-9]",
  format: "$1-$2-$3"
},

fixed_line: {
  possible_number_pattern: "\\d{9}",
  example_number: "312345678",
  national_number_pattern: "(?:1(?:1[235-8]|2[3-6]|3[3-9]|4[2-6]|[58][2-8]|6[2-7]|7[2-9]|9[1-9])|(?:2[2-9]|[36][1-9])\\d|4(?:[2-578]\\d|6[02-8]|9[2-59])|5(?:[2-589]\\d|6[1-9]|7[2-8])|7(?:[25-9]\\d|3[4-9]|4[02-9])|8(?:[2679]\\d|3[2-9]|4[5-9]|5[1-9]|8[03-9])|9(?:[2-58]\\d|[679][1-9]))\\d{6}"
},
```

主要是把其中的`[257-9]`换成`[25-9]`，然后运行下面的代码

```ruby
temp_file = Rails.root.join('config', 'jp_phone_data.dat')

File.open(temp_file, 'wb') do |file|
  Marshal.dump(jp_data, file)
end

Phonelib.override_phone_data = temp_file.to_s
```

这样可以生成文件，之后可以只运行下面的代码，就是打开文件并写入

```ruby
temp_file = Rails.root.join('config', 'jp_phone_data.dat')

Phonelib.override_phone_data = temp_file.to_s
```
