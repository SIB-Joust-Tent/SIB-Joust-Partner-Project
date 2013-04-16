object @company

attributes :id, :slug, :name, :vision
child(:users) { attributes :name, :email, :twitter, :linkedin, :position }