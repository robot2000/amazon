require 'faker'

Book.delete_all
Author.delete_all
Category.delete_all
Rating.delete_all
User.delete_all
Country.delete_all

["Belgium", "Bosnia and Herzegowina", "Bulgaria", "Canada", "Czech Republic", "Denmark", "Egypt", "Estonia", 
  "Finland", "France", "Georgia", "Germany", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", 
  "Ireland", "Israel", "Italy", "Japan", "Latvia","Romania", "Singapore", "Ukraine", "United Arab Emirates", 
  "United Kingdom", "United States"].each do |country|
  Country.create!(name: country)
end


def generate_users(n)
  n.times do
    User.create!(email: Faker::Internet.email, password: '12345678', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
  end
  User.create!(email: 'admin@admin.com', password: 'adminadmin', firstname: 'admin', lastname: 'admin', admin: true)
end

def generate_books(n)
  n.times do 
    Book.create!(title: Faker::Book.title, description: Faker::Hipster.paragraph, price: Faker::Commerce.price, qty: Faker::Number.between(1, 10))
  end
end

def generate_authors(n)
  n.times do
    author = Author.new(name: Faker::Name.name, biography: Faker::Lorem.paragraph(2))
    rand(1..4).times do
      author.books << Book.find(rand(Book.ids.sort.first..Book.ids.sort.last))
    end
    author.save!
  end
end

def generate_categories(n)
  n.times do
    category = Category.new(title: Faker::Book.genre)
    rand(1..10).times do
      category.books << Book.find(rand(Book.ids.sort.first..Book.ids.sort.last))
    end
    category.save!
  end
end

def generate_ratings(n)
  n.times do
    rating = Rating.new(review: Faker::Hipster.paragraph(2), value: rand(1..10))
    rand(1..5).times do
      User.find(rand(User.ids.sort.first..User.ids.sort.last)).ratings << rating
      Book.find(rand(Book.ids.sort.first..Book.ids.sort.last)).ratings << rating
    end
    rating.save!
  end
end


generate_users(10)
generate_books(30)
generate_authors(10)
generate_categories(5)
generate_ratings(20)
