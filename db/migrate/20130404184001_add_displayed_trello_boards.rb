class AddDisplayedTrelloBoards < ActiveRecord::Migration
  def change
  	add_column :companies, :displayed_trello_lists, :string
  end
end
