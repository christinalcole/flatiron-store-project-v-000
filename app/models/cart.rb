class Cart < ActiveRecord::Base
  belongs_to :user

  has_many :line_items
  has_many :items, through: :line_items

  def total
    line_items.inject(0){|total, i| total + (i.quantity * i.item.price)}
  end

  def add_item(item)
    line_item = self.line_items.find_by(item_id: item)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item)
    end
    line_item
  end

  def checkout
    self.update(status: "submitted")
    change_inventory
  end

  def change_inventory
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end

end
