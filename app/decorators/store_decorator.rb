class StoreDecorator
  attr_accessor :store

  def initialize(store)
    @store = store
  end

  def as_json
    {
      id: store.id,
      address: store.address,
      name: store.name
    }
  end
end
