class TrelloEvent
  def initialize(card_id, event, list_id, date)
    @card_id, @event, @list_id, @date = card_id, event, list_id, date
  end
end
