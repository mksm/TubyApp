module FixtureHelpers
  def fixture_csv(name = 'channels_1.csv')
    File.open(File.join(Rails.root, 'spec', 'fixtures', name))
  end
end
