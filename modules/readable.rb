require 'csv'

module Readable
  def self.file(location)
    rows = CSV.read(location, headers: true)
    rows.map do |row|
      new(row)
    end
  end
end