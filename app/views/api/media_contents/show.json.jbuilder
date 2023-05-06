json.media_content do
    json.id @media_content.id
    json.name @media_content.name
    json.director_name @media_content.director.first_name
end
