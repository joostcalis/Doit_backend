require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"


#   describe "default finished false?" do
#     let(:task) { Task.create(title: "test", body: "this is a test") }
#
#     subject { task.finished }
#
#     it { is_expected.to be false }
#   end
# end



 # RSpec.describe Todo, type: :model do
  describe "relations" do
     it { is_expected.to belong_to(:project) }
   end
  end
