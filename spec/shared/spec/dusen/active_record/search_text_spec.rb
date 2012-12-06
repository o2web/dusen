require 'spec_helper'

describe Dusen::ActiveRecord::SearchText do

  describe '.match' do

    it 'should find records for the given list of words' do
      match = UserWithFulltext.create!(:name => 'Abraham', :city => 'Fooville')
      no_match = UserWithFulltext.create!(:name => 'Elizabeth', :city => 'Fooville')
      matches = Dusen::ActiveRecord::SearchText.match(UserWithFulltext, ['Abraham', 'Fooville'])
      matches.all.should == [match]
    end

    it 'should find records by only giving the prefix of a word' do
      match = UserWithFulltext.create!(:name => 'Abraham')
      no_match = UserWithFulltext.create!(:name => 'Elizabeth')
      matches = Dusen::ActiveRecord::SearchText.match(UserWithFulltext, ['Abra'])
      matches.all.should == [match]
    end

  end

end