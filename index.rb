require 'faker'
require 'gimei'
require 'romankana'

COUNT_NUMBER = 20000
COUNT_NUMBER.freeze

file = File.open('output/group.csv', "w")
file.puts("group,displayName,furigana,romaji,mailaddress")
grouplist = []
count = 0
begin
  File.open('input/groupList.txt') do |groupfile|
    groupfile.each_line do |groupname|
      grouplist << groupname.chomp
      count += 1
    end
  end
end

COUNT_NUMBER.times do
  gimei = Gimei.name
  file.puts("#{grouplist[rand(count)]},#{gimei.kanji},#{gimei.katakana},#{gimei.katakana.to_roman},#{Faker::Internet.safe_email}")
end