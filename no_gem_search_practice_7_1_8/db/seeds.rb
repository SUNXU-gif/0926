Genre.destroy_all
Cooking.destroy_all

w = Genre.create!(genre_name: "和食")
c = Genre.create!(genre_name: "中華")
i = Genre.create!(genre_name: "イタリアン")
a = Genre.create!(genre_name: "アメリカ")

Cooking.create!(title: "寿司", content: "和食の代表的な料理", genre: w)
Cooking.create!(title: "チャーハン", content: "馴染みのある中華", genre: c)
Cooking.create!(title: "ピッツァ", content: "イタリアン", genre: i)
Cooking.create!(title: "ハンバーガー", content: "世界一有名なファストフード", genre: a)
