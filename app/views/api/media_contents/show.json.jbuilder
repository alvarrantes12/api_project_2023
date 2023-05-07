json.media_content do
    json.id @media_content.id
    json.id @media_content.name
    json.director do
        json.first_name @media_content.director.first_name
        json.last_name @media_content.director.last_name
    end
end