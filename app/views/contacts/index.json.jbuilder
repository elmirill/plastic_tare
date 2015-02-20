json.array!(@contacts) do |contact|
  json.extract! contact, :id, :address_full, :address_short, :email, :phone_main, :phone_other, :map
  json.url contact_url(contact, format: :json)
end
