
describe "Vector2f" do
  let(:vector) { make_vector 3, 5 }
  it "can be created with x and y coordinates" do
    make_vector 12, 44
  end

  it "exposes its coordinates via getters" do
    vector.x
    vector.y
  end

  it "has the same coordinates after initialization" do
    vector.x = 3
    vector.y = 5
  end

  it "can return its own length" do
    expect(vector.length).to be 5.830951894845301 
  end

  context "operations with vectors" do
    it "maintains scalar multiplication with another vector" do
      other = make_vector 7, 9
      result = vector * other
      expect(result).to be 66
    end

    it "maintains multiplication with numeric" do
      result = vector * 4
      expect(result.x).to be 12
      expect(result.y).to be 20
    end

    it "maintains addition with another vector" do
      other = make_vector 4, 77
      result = vector + other
      expect(result.x).to be 7
      expect(result.y).to be 82
    end

    it "maintains substraction with another vector" do
      other = make_vector 54, 5
      result = vector - other
      expect(result.x).to be -51
      expect(result.y).to be 0
    end

    it "returns new vector after addition" do
      other = make_vector 11, 0
      result = vector + other
      expect(result.equal? vector).to be false
      expect(result.equal? other).to be false
    end

    it "returns new vector after substraction" do
      other = make_vector -5, 6
      result = vector - other
      expect(result.equal? vector).to be false
      expect(result.equal? other).to be false
    end
  end

  def make_vector(*args)
    Core::GameMath::Vector2f.new *args
  end
end
