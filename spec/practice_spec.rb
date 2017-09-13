require('rspec')
require('practice')

describe("Item") do
  before() do
    Item.clear()
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      item = Item.new("tacos", 1)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      expect(item.id()).to(eq(1))
      expect(item2.id()).to(eq(2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Item.new("tacos", 6)
      item.save()
      expect(Item.all()).to(eq([item]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos", 3)
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("finds an item based on its id") do
      item = Item.new("tacos", 5)
      item.save()
      item2 = Item.new("pizza", 3)
      item2.save()
      expect(Item.find(1)).to(eq(item))
      expect(Item.find(2)).to(eq(item2))
    end
  end

  describe(".sort") do
    it("will sort the items in the list by ranking") do
      item1 = Item.new("tacos", 3)
      item1.save()
      item2 = Item.new("pizza", 4)
      item2.save()
      item3 = Item.new("pasta", 1)
      item3.save()
      item4 = Item.new("sandwiches", 2)
      item4.save()
      Item.sort()
      test_item_list = Item.all()
      expect(test_item_list[0].rank).to(eq(1))
      expect(test_item_list[1].rank).to(eq(2))
      expect(test_item_list[2].rank).to(eq(3))
      expect(test_item_list[3].rank).to(eq(4))
    end
  end
end
