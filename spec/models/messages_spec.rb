require 'spec_helper'

describe Message do
  before { @message = Message.new(title: "sample message", content: "sample content", author_id: 1, recipient_id: 2)}
  subject { @message }

  it { should respond_to(:author) }
  it { should respond_to(:recipient) }

  it { should be_valid }

end
