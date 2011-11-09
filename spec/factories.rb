Factory.define :member do |member|
  member.name "Michael Hartl"
  member.email "mhartl@example.com"
  member.city "New Delhi"
  member.contact_no "011-267-621"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
