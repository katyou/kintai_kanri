# #ここも自分のサーボにあったものに書き換える
# #s03t-2bbmg servo
# UNLOCK_ANGLE = "91"
# LOCK_ANGLE = "40"
#
# AUTO_LOCK = 40
require 'mysql2'


class User
 def initialize(name = nil, idm = nil, present = 0)
   @name = name
   @exit_idm = idm
   @current_present = present

   #一時的な情報保持のためのインスタンス変数
   @unlock_user = nil
   @current_idm = nil
 end
end

def idm(text)
 m = text.match(/ID=(.*?)\s/)
 get_idm = m[1]
 print("IDm = #{get_idm}\n")
 return get_idm
end

def nfc()
 #ここに自分の環境にあったものを指定
 `python2 ~/Desktop/practice_file/ruby_nfcpy/nfcpy/examples/tagtool.py`
end

def file_kanri_at(username, card_id, present)
  work_time = $db.query(%q{select id, start_time, finish_time, work_time, rest_time, user_id from work_times;})

 if present == 0 #出社した時
   print("Good Morning #{username}!\n")
   puts("Let's do our best today!")

   time = Time.now
   File.open("#{username}.csv", "a") do |f|
     f.print("出社時刻")
     f.print(time.month, "月", time.day, "日", " ", time.hour, "：", time.min, "\n")
   end
   status_change = "update users set present = 1 where card_id = '#{card_id}';"
   results = $db.query(status_change)

 elsif present == 1 #帰社した時
   print("Good lack #{username}!\n")
   puts("Let's do our best tomorrow!")
   time = Time.now
   File.open("#{username}.csv", "a") do |f|
     f.print("退社時刻")
     f.print(time.month, "月", time.day, "日", " ", time.hour, "：", time.min, "\n")
   end

   status_change = "update users set present = 0 where card_id = '#{card_id}';"
   results = $db.query(status_change)
 end
 #val.close
 #out = 0
end

#DBユーザー勤怠管理システム
$db = Mysql2::Client.new(:host => 'localhost', :user => 'root', :password => '')
usedb = $db.query(%q{use kintai_kanri_development;})

#ledのLチカ
#exp = open("/sys/class/gpio/export", "w")
#exp.write(27)
#exp.close

#dir = open("/sys/class/gpio/gpio27/direction", "w")
#dir.write("out")
#dir.close

loop do
 unlock_user_id = idm(nfc)
 $select_column = $db.query(%q{select id, name, card_id, present from users;})

 $select_column.each do |user|
   puts ("#{user['card_id']}")
   if user['card_id'] == unlock_user_id
     file_kanri_at(user['name'], user['card_id'], user['present']) #value is idm.
   end
 end

 print("Please wait reader restart...\n")
 sleep(2)

end
