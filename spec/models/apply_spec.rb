# == Schema Information
#
# Table name: applies
#
#  id                            :integer          not null, primary key
#  given_name                    :string(255)
#  family_name                   :string(255)
#  email                         :string(255)
#  phone_number                  :string(255)
#  house_number_or_name          :string(255)
#  street                        :string(255)
#  area                          :string(255)
#  city                          :string(255)
#  postcode                      :string(255)
#  country                       :string(255)
#  age                           :integer
#  gender                        :string(255)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  medical_condition_description :string(255)
#  hear_about_description        :string(255)
#  best_call_day_description     :string(255)
#  best_call_time_description    :string(255)
#  convenient_time_descriptin    :string(255)
#  conversation_id               :integer
#  transaction_id                :integer
#  listing_id                    :integer
#  applier_id                    :string(255)
#

require 'rails_helper'

RSpec.describe Apply, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
