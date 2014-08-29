describe "Input" do
  let(:device) { Device.new }
  let(:input) { create_input device }

  it "can be created with device" do
    create_input Device.new
  end

  it "is empty after initialization" do
    expect(input.input_map.empty?).to be true
  end

  it "can return the input_map as new hash" do
    input.process_input
    expect(input.input_map == device.catch_input).to be true
    expect(input.input_map.equal? device.catch_input).to be false
  end

  it "can process the input from the device" do
    input.process_input
    expect(input.input_map == device.catch_input).to be true
  end

  it "has checking for specific input" do
    input.process_input
    expect(input.empty?(:cursor_position)).to be false
    input.clear_input
    expect(input.empty?(:cursor_position)).to be true
  end

  it "can clear the input" do
    input.process_input
    input.clear_input
    expect(input.input_map.empty?).to be true
  end

  class Device
    def initialize; end

    def catch_input
      { :cursor_position => [12, 33], :mouse_click => [55, 48] }
    end
  end

  def create_input(device)
    Core::Input.new device
  end
end
