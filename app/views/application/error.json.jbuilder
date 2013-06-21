json.error do
  json.message flash[:alert]
  json.status response.status
end
