# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create boards with images
boards_data = [
  { name: "Technology", is_nsfw: false, image_path: "app/assets/images/tech.jpg" },
  { name: "Gaming", is_nsfw: false, image_path: "app/assets/images/gaming.jpg" },
  { name: "Art", is_nsfw: false, image_path: "app/assets/images/art.jpg" },
  { name: "Music", is_nsfw: false, image_path: "app/assets/images/music.jpg" },
  { name: "NSFW Content", is_nsfw: true, image_path: "app/assets/images/nsfw.jpg" }
]

boards_data.each do |board_data|
  board = Board.create!(
    name: board_data[:name],
    is_nsfw: board_data[:is_nsfw]
  )

  # Attach image if the file exists
  if File.exist?(board_data[:image_path])
    board.main_image.attach(
      io: File.open(board_data[:image_path]),
      filename: File.basename(board_data[:image_path]),
      content_type: "image/jpeg" # Adjust based on your image type
    )
  else
    puts "Warning: Image file not found at #{board_data[:image_path]}"
  end
end

puts "Created #{Board.count} boards with images"
