# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
srand 1234
#USERSS
first_names = ['Hugo', 'Raimundo','Manuel','Camila','Tomas','Benjamin','Erich','Claudio','Pedro','Alfonso','Nicolas']
last_names = ['Fuente','Marin','Zampighi', 'Fuchs', 'Castro','Piecha','Grand', 'Zuñiga','Calaf','Marchant']
emails = ['@gmail.com', '@uandes.cl','@hotmail.com']
cities = ['Santiago', 'Copiapo', 'Villarica','Temuco', 'Talca']
#only 1 country(Chile)
password = '1234567890'
#POSTSS
# tittles with i hate
titles = ['chilean food', 'china people', 'dogs', 'cats', 'marihuana','drunk people', 'sushi']
descrp= [', because im a hater', ', because they are all  idiots' , ', because they eat chocolate']
#COMMENTSS
comment= ['good post', ' i hate your post', 'fan 1', 'ok.', 'hi! you are a angel']
count = 1
peoples = []
posts=[]
first_names.each {|f|
    last_names.each {|l|
      people = {name: f}
      people["last_name"] = l
      email_number =rand(3)
      email = f.downcase + l.downcase  + emails[email_number]
      user = User.create(email:email,password:password,user_type:"user")
      city_number = rand(5)
      people["city"] = cities[city_number]
      people["country"] = "Chile"
      people["bio"] = "hello my name is " + f
      people["user_id"] = count
      p = UserProfile.create(people)
      titles.each {|t|
        desc_number= rand(3)
        desc = descrp[desc_number]
        status = true
        visibility = true
        des = t + desc
        post = Post.create(user_id:count,title:t,description: "I hate "+des,city: cities[city_number],
                           country:"Chile",status:status,visibility:visibility)
        posts.push(post)

      }
      count = count +1
      peoples.push(people)
    }
}


count1 = 1
posts.each {|p|
    people1 = rand(peoples.length)
    people2 = rand(peoples.length)
    c_number = comment[rand(4)]
    c_number1 = comment[rand(4)]
    c1 = PostComment.create(user_id:people1,post_id:count1,comment:c_number)
    c2 = PostComment.create(user_id:people2,post_id:count1,comment:c_number1)
    count1 = count1+1



}







