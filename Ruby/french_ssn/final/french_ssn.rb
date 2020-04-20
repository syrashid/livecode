require 'date'
require 'YAML'

SSN_PATTERN = /\A(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<zip>\d{2})\s?(\d{3})\s?(\d{3})\s?(?<key>\d{2})\z/

def french_ssn_info(ssn)
  return "The number is invalid" if !(ssn.is_a? String) || ssn.empty?

  match_data = ssn.match(SSN_PATTERN)

  gender = match_data[:gender] == "1" ? "man" : "woman"

  # Embrace the laziness, coders are lazy, look up ruby datemonths from strings
  month = Date::MONTHNAMES[match_data[:month].to_i]

  year = (match_data[:year].to_i > 20) ? "19".concat(match_data[:year]) : "20".concat(match_data[:year])

  department = department(match_data[:zip])

  return "a #{gender}, born in #{month}, #{year} in #{department}." if match_data && valid_key?(ssn, match_data[:key])
end

def department(code)
  YAML.load_file('data/french_departments.yml')[code]
end

def valid_key?(ssn, key)
  (97 - ssn.delete(' ')[0..12].to_i) % 97 == key.to_i
end
