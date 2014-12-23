class User
  extend ModelAttributes
  attribute :id,         :integer
  attribute :paid,       :boolean
  attribute :name,       :string
  attribute :created_at, :datetime
end

RSpec.describe "a class using ModelAttributes" do
  describe ".attributes" do
    it "returns an array of attribute names as symbols" do
      expect(User.attributes).to eq([:id, :paid, :name, :created_at])
    end
  end

  describe "an instance of the class" do
    let(:user) { User.new }

    describe "an integer attribute (id)" do
      it "is nil when unset" do
        expect(user.id).to be_nil
      end

      it "stores an integer" do
        user.id = 3
        expect(user.id).to eq(3)
      end

      it "stores an integer passed as a float" do
        user.id = 3.0
        expect(user.id).to eq(3)
      end

      it "raises when passed a float with non-zero decimal part" do
        expect { user.id = 3.3 }.to raise_error
      end

      it "parses an integer string" do
        user.id = '3'
        expect(user.id).to eq(3)
      end

      it "raises if passed a string it can't parse" do
        expect { user.id = '3a' }.to raise_error
      end

      it "stores nil" do
        user.id = 3
        user.id = nil
        expect(user.id).to be_nil
      end
    end

    describe "#changes" do
      context "for a model instance created with no attributes" do
        it "returns {}" do
          expect(user.changes).to eq({})
        end
      end

      context "when an attribute is set via a writer method" do
        let(:user) { User.new.tap { |u| u.id= 3 } }
        let(:changes) { user.changes }

        it "has an entry for key 'id' => [nil, 3]" do
          expect(changes).to include('id' => [nil, 3])
        end
      end
    end
  end
end
