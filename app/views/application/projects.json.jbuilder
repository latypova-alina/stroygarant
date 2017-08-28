json.array! @projects do |project|
  json.id project.id 
  json.name project.name 
  json.address project.address 
  json.description project.description
  json.latitude project.latitude
  json.longitude project.longitude
  
  json.images do 
    json.array! project.project_images do |image|
      json.id image.id
      json.square_url image.attachment.url :square
      json.small_url image.attachment.url :small 
      json.big_url image.attachment.url :big
    end
  end
  
end