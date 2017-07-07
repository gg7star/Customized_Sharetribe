# == Schema Information
#
# Table name: organisations
#
#  id                    :integer          not null, primary key
#  org_name              :string(255)
#  email                 :string(255)
#  phone_number          :text(65535)
#  org_type              :string(255)
#  sent_offer            :boolean          default(FALSE)
#  subscription_complete :boolean          default(FALSE)
#  created_at            :datetime
#  updated_at            :datetime
#  community_id          :integer
#  locale                :string(255)
#  test_group_number     :integer
#

require 'rails_helper'

RSpec.describe Organisation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
