module SupportHelpers
  def should_have_db_columns(*columns)
   columns.each do |column|
      should have_db_column column
    end
  end
end

RSpec.configure do |config|
  config.include SupportHelpers
end

