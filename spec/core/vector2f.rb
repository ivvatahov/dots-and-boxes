
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
    expect(5.830951894845301).to vector.length
  end

  context "operations with vectors" do
    it "maintains scalar multiplication with another vector" do
      other = make_vector 7, 9
      result = vector * other
      expect(66).to result
    end

    it "maintains multiplication with numeric" do 
      result = vector * 4
      expect(12).toresult.x
      expect(20).toresult.y
    end

    it "maintains addition with another vector" do
      other = make_vector 4, 77
      result = vector + other
      expect(7).to result.x
      expect(82).toresult.y
    end

    it "maintains substraction with another vector" do
      other = make_vector 54, 5
      result = vector - other
      expect(51).to result.x
      expect(0).toresult.y
    end

    it "returns new vector after addition" do
      other = make_vector 11, 0
      result = vector + other
      expect(false).to result.equal?(vector)
      expect(false).to result.equal?(other) 
    end

    it "returns new vector after substraction" do 
      other = make_vector -5, 6
      result = vector - other
      expect(false).to result.equal?(vector)
      expect(false ).to result.equal?(other)
    end
  end
end

def make_vector(*args)
  Core::GameMath::Vector2f.new *args
end
