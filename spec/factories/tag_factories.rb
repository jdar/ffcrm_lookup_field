# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
FactoryGirl.define do
  factory :tag do
    name { 
#faker is buggy. https://github.com/faker-ruby/faker/issues/278
      "Faker::Internet.user_name"
    }
  end
end
