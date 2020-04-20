require 'date'
require 'YAML'

def french_ssn_info(ssn)
  # figure out the regex for the ssn
  pattern = /^(?<gender>[12])\s(?<year>\d{2})\s(?<month>\d{2})\s(?<dept>\d{2})\s\d{3}\s\d{3}\s(?<key>\d{2})$/

  # break up ssn into component pieces
  match_data = ssn.to_s.match(pattern)
  # 👀 Peep the method valid_key? what is it doing here?
  if match_data & valid_key?(ssn, match_data[:key])
    # translate the meaning of each component
    gender = match_data[:gender] == "1" ? "man" : "woman"
    month = Date::MONTHNAMES[match_data[:month].to_i]
    year = "19" + match_data[:year]
    dept = department_translate(match_data[:dept])
    # put it all together and return the output, remember in ruby this is implicit
    "a #{gender}, born in #{month}, #{year} in #{dept}."
  else
    # guard clauses to verify ssn
    "The number is invalid"
  end
end

def department_translate(code)
  YAML.load_file('data/french_departments.yml')[code]
end

def valid_key?(ssn, key)
  (97 - ssn.delete(' ')[0..12].to_i) % 97 == key.to_i
end
