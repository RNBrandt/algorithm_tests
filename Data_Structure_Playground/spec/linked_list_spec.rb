require_relative '../linked_lists'

describe '#Linked_list' do
  let(:list){Linked_list.new}

  context "when a new linked list object is created" do
    it "has a tail with a nil value" do
      expect(list.tail).to be_nil
    end
    it "has a root with a nil value" do
      expect(list.root).to be_nil
    end
  end

  context "When one value is added" do
    it "has root and tail nodes with one value" do
      list.add_unordered_node(6)
      expect(list.tail.value).to equal(list.root.value)
    end
  end

  context "If there are multiple values added to an unordered list" do
    it "does not order the values" do
      list.add_unordered_node(8)
      list.add_unordered_node(1)
      expect(list.root.value).to be >(list.tail.value)
    end
  end

  context "When there are several values added to an ordered list" do
    it "sorts the values" do
      list.add_ordered_node(8)
      list.add_ordered_node(1)
      expect(list.root.value).to be <(list.tail.value)
    end
    it "sorts multiple values" do
      list.add_ordered_node(8)
      list.add_ordered_node(2)
      list.add_ordered_node(5)
      list.add_ordered_node(15)
      expect(list.root.value).to be<(list.root.bigger.value)
      expect(list.tail.value).to be>(list.tail.smaller.value)
      expect(list.root.bigger.value).to equal(5)
    end
  end
  context "When looking for the value from the end of the list" do
    it "Will return an error string if there are fewer nodes than values requested" do
      list.add_unordered_node(8)
      list.add_unordered_node(1)
      expect(list.find_nth_from_end(5)).to eq("There aren't 5 values")
    end
    it "Will return the value of the node from the nth from the end with an ordered linked list" do
      list.add_ordered_node(8)
      list.add_ordered_node(2)
      list.add_ordered_node(5)
      list.add_ordered_node(15)
      expect(list.find_nth_from_end(2)).to equal(8)
    end
    it "Will return the value of the node from the nth from the end with an unordered linked list" do
      list.add_unordered_node(8)
      list.add_unordered_node(2)
      list.add_unordered_node(5)
      list.add_unordered_node(15)
      expect(list.find_nth_from_end(2)).to equal(5)
    end
  end
end

