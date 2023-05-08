json.midia_content do
 json.id @midia_content.id
 json.name @midia_content.name
 json.director do
  json.first_name @midia_content.director.first_name
  json.last_name @midia_content.director.last_name
 end
end

