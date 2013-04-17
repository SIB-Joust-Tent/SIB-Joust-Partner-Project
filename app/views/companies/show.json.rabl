object @company

attributes :id, :slug, :name, :vision
child(:users) { 
  attributes :name, :email, :twitter, :linkedin, :position 
  node(:image) do |user|
    user[:image].blank? ? "/assets/placehold.gif" : "/assets/#{user[:image]}"
  end
}