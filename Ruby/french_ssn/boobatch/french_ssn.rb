require 'date'
require 'YAML'

SSN_PATTERN = /(?<gender>[12]) (?<year>\d{2}) (?<month>0[1-9]|1[0-2]) (?<dept>\d{2})( \d{3}){2} (?<key>\d{2})/

def french_ssn(ssn)
  # guard clause, is this a valid ssn?
    #if it isn't, return "not valid"
  return 'The number is invalid' if !(ssn.is_a? String) || ssn.empty?

  # match the pattern
  match_data = ssn.match(SSN_PATTERN)

  # take those pieces and push them into variables (gender, year, month, dept, etc)
  gender = match_data[:gender] == "1" ? "man" : "woman"

  year = "19#{match_data[:year]}"

  month = Date::MONTHNAMES[match_data[:month].to_i]

  department = department_find(match_data[:dept])

  valid_key?(ssn, match_data[:key])

  # return the desired output
  if valid_key?(ssn, match_data[:key])
    "a #{gender}, born in #{month}, #{year} in #{department}."
  end
end

def department_find(dept_number)
  yaml_hash = YAML.load_file('./data/french_departments.yml')
  yaml_hash[dept_number]
end

def valid_key?(ssn, key)
  sum = ssn.delete(' ')[0..12].to_i
  key.to_i == (97 - sum) % 97
end

