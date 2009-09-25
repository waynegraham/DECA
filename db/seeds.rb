
# populate the EvidenceType 
EvidenceType.create(:evidence_type => 'Archaeological')
EvidenceType.create(:evidence_type => 'Documentary')

# Add some Sites
Site.create(:name => 'Middle Plantation 1', :site_id => '18AN46', :lat => '38.89477', :lon => '-76.5768')
Site.create(:name => 'Swan Cove', :site_id => '18AN934', :lat => '39.03305', :lon => '-76.44218')
Site.create(:name => 'Shields Tavern site', :site_id => '18VA005', :lat => '37.27002', :lon => '-76.70856')
Site.create(:name => 'Glebe House', :site_id => '18VA007', :lat => '37.5686', :lon => '-75.7947')
Site.create(:name => 'Thomas Cornwaley\'s Houses', :site_id => '18MD065', :lat => '38.18744', :lon => '-76.43238' )