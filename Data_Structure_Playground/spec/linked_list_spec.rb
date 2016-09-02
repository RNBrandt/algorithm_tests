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

    context "When there are multiple values added to an unordered list" do
      it "does not order the values" do
        list.add_unordered_node(8)
        list.add_unordered_node(1)
        expect(list.root.value).to be >(list.tail.value)
      end
    end
end

