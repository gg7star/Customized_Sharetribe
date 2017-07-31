# == Schema Information
#
# Table name: organizations
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  org_name               :string(255)
#  org_type               :string(255)
#  sent_offer             :boolean          default(FALSE)
#  subscription_complete  :boolean          default(FALSE)
#  community_id           :integer
#  test_group_number      :integer
#  locale                 :string(4)
#
# Indexes
#
#  index_organizations_on_email                 (email) UNIQUE
#  index_organizations_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Organization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
