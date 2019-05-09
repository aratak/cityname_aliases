# require "cityname_aliases/version"
require "csv"

module CitynameAliases
  def self.get(name)
    unless defined?(@csv)
      @csv = {}
      CSV.foreach("#{__dir__}/aliases.csv", headers: ["alias", "name"], col_sep: "|") do |row|
        @csv[row["alias"].downcase] = row["name"]
      end
    end
    @csv[name.downcase] || name
  end
end
