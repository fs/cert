class CertificationsExpert < ActiveRecord::Base
  belongs_to :user
  belongs_to :certification
end

Factory.define :certifications_expert do |f|
  f.association :certification
  f.association :user
end
