class StoresDecorator
  attr_accessor :stores

  def initialize(stores)
    @stores = stores
  end

  def as_json
    {
      stores: build_stores,
      success: true,
      total_elements: stores.size
      
    }
  end

  def build_stores
    stores.inject([]) do |rtn, store|
      rtn << StoreDecorator.new(store).as_json
    end
  end
end
