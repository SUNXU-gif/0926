user1 = User.create(name: '大阪 太郎', email: 'oosaka@email.com', password: 'password')
user2 = User.create(name: '東京 次郎', email: 'tokyo@email.com', password: 'password')
user3 = User.create(name: '北海道 三郎', email: 'hokkaido@email.com', password: 'password')

Post.create(title: '投稿1', content: '最初の投稿', user_id: user1.id)
Post.create(title: '投稿2', content: '2回目の投稿', user_id: user2.id)
Post.create(title: '投稿3', content: '3つ目の投稿', user_id: user1.id)
