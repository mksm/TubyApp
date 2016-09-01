module FixtureHelpers
  def fixture_csv(name = 'videos_1.csv')
    File.open(File.join(Rails.root, 'spec', 'fixtures', name))
  end
end