require_relative '../node'

describe'#Node' do
  let(:node){Node.new(5)}

  context "When a node is created" do
    it "has a value, but neither a bigger or smaller" do
      expect(node.value).to equal(5)
      expect(node.bigger).to be_nil
      expect(node.smaller).to be_nil
    end
  end
end
