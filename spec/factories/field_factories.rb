# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
FactoryGirl.define do
  sequence :klass_name do |x|
    ["Contact", "Account", "Opportunity", "Lead", "Campaign"].sample
  end

  sequence(:field_position) {|x| x }

  sequence :field_label do |x|
    #faker is buggy. https://github.com/faker-ruby/faker/issues/278
    "Faker::Internet.user_name" + x.to_s
  end

  factory :field_group do
    klass_name          { FactoryGirl.generate(:klass_name) }
    label               { FactoryGirl.generate(:field_label) }
    tag
  end


  factory :field do
    type                "Field"
    field_group         { FactoryGirl.create(:field_group) }
    position            { FactoryGirl.generate(:field_position) }
    label               { FactoryGirl.generate(:field_label) }
    name                { |f| f.label.downcase.gsub(/[^a-z0-9]+/, '_') }
    as                  "string"
    updated_at          { FactoryGirl.generate(:time) }
    created_at          { FactoryGirl.generate(:time) }
  end

  factory :custom_field, :parent => :field, :class => 'CustomField' do
    type "CustomField"
  end

  factory :custom_field_lookup, :parent => :field, :class => 'CustomFieldLookup' do
    type "CustomFieldLookup"
    as    "lookup"
  end

end
