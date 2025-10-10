user1 = User.create!(name: '大阪 大', email: 'oosaka@email.com',   password: 'password')
user2 = User.create!(name: '東京 有', email: 'tokyo@email.com',    password: 'password')
user3 = User.create!(name: '北海道 道', email: 'hokkaido@email.com', password: 'password')

Post.create!(title: '投稿1', content: '最初の投稿',  user: user1)
Post.create!(title: '投稿2', content: '2日目の投稿', user: user2)
Post.create!(title: '投稿3', content: '3つ目の投稿', user: user1)
