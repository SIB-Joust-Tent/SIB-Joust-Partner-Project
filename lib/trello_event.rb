class TrelloEvent
  def initialize(card_id, event, list_id)
    @card_id, @event, @list_id = card_id, event, list_id
  end
end
