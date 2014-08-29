describe "Time" do
  it "should have SECOND constant" do 
    Core::Time::SECOND
  end

  describe "GetTime" do
    it "should have method get_time" do
      expect(Core::Time::GameTime.new.respond_to? :get_time).to be true
    end
  end
end
