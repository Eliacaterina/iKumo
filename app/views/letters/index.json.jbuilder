json.array!(@letters) do |letter|
  json.extract! letter, :id, :title, :content, :posted_on
  json.url letter_url(letter, format: :json)
end
