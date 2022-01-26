require "json"
all_categories= JSON.parse(File.read("db/data/categories.json"),symbolize_names: true)
all_photos= JSON.parse(File.read("db/data/photos.json"),symbolize_names: true)

Comment.destroy_all
Photo.destroy_all
Category.destroy_all

puts "Seeding categories"
all_categories.each do |category|
    category_new=Category.new(name: category[:name],description: category[:description])
    io_path=category[:cover][:io_path]
    filename=category[:cover][:filename]
    category_new.cover.attach(io: File.open(io_path),filename: filename)
    puts "Category not created. Errors: #{category_new.errors.full_messages}" unless category_new.save

end

puts "Stop seeding categories"

puts "Seeding photos"
categories_selected= Category.all
categories_selected.each do |category|
    photos_by_category=all_photos.select {|photo| photo[:category]==category.name}
    photos_by_category.each do |photo|
        photo_new=Photo.new(title: photo[:title],description: photo[:description],category:category )
        io_path=photo[:image][:io_path]
        filename=photo[:image][:filename]
        photo_new.image.attach(io: File.open(io_path),filename: filename)
        puts "Photo not created. Errors: #{photo_new.errors.full_messages}" unless photo_new.save
    end
end

puts "Stop seeding photos"


puts "Seeding comments to categories"
    categories_selected.each do |category|
        comment_new=Comment.new(body:"Nice category",commentable: category)
        puts "Comment not created. Errors: #{comment_new.errors.full_messages}" unless comment_new.save
    end

puts "Stop seeding comments to categories"

photos_selected=Photo.all
puts "Seeding comments to photos"
    photos_selected.each do |photo|
        comment_new=Comment.new(body:"Nice photo",commentable: photo)
        puts "Comment not created. Errors: #{comment_new.errors.full_messages}" unless comment_new.save
    end

puts "Stop seeding comments to photos"