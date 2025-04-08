Netlify_Vary
  = ((header_directives / query_directives / cookie_directives / language_directives / country_directives) (OWS "," OWS (header_directives / query_directives / cookie_directives / language_directives / country_directives)?)*)

header_directives
  = "header=" (field_name) (OWS "|" OWS (field_name))*

query_directives
  = "query" ("=" (query) (OWS "|" OWS (query))*)?

cookie_directives
  = "cookie=" (cookie_name) (OWS "|" OWS (cookie_name))*

language_directives
  = "language=" (combo_language_range) (OWS "|" OWS (combo_language_range))*

country_directives
  = "country=" (combo_iso_3166_1_code) (OWS "|" OWS (combo_iso_3166_1_code))*

OWS
  = (SP / HTAB)*

field_name
  = token

query
  = (pchar)+

cookie_name
  = token

combo_language_range
  = language_range (OWS "+" OWS (language_range))*

combo_iso_3166_1_code
  = (iso_3166_1_code (OWS "+" OWS (iso_3166_1_code))*)

SP
  = " "

HTAB
  = "\t"

token
  = tchar+

pchar
  = unreserved
  / pct_encoded
  / "*"

language_range
  = (ALPHA|1..8| ("-" alphanum|1..8|)*)
  / "*"

iso_3166_1_code
  = "AD"i
  / "AE"i
  / "AF"i
  / "AG"i
  / "AI"i
  / "AL"i
  / "AM"i
  / "AO"i
  / "AQ"i
  / "AR"i
  / "AS"i
  / "AT"i
  / "AU"i
  / "AW"i
  / "AX"i
  / "AZ"i
  / "BA"i
  / "BB"i
  / "BD"i
  / "BE"i
  / "BF"i
  / "BG"i
  / "BH"i
  / "BI"i
  / "BJ"i
  / "BL"i
  / "BM"i
  / "BN"i
  / "BO"i
  / "BQ"i
  / "BR"i
  / "BS"i
  / "BT"i
  / "BV"i
  / "BW"i
  / "BY"i
  / "BZ"i
  / "CA"i
  / "CC"i
  / "CD"i
  / "CF"i
  / "CG"i
  / "CH"i
  / "CI"i
  / "CK"i
  / "CL"i
  / "CM"i
  / "CN"i
  / "CO"i
  / "CR"i
  / "CU"i
  / "CV"i
  / "CW"i
  / "CX"i
  / "CY"i
  / "CZ"i
  / "DE"i
  / "DJ"i
  / "DK"i
  / "DM"i
  / "DO"i
  / "DZ"i
  / "EC"i
  / "EE"i
  / "EG"i
  / "EH"i
  / "ER"i
  / "ES"i
  / "ET"i
  / "FI"i
  / "FJ"i
  / "FK"i
  / "FM"i
  / "FO"i
  / "FR"i
  / "GA"i
  / "GB"i
  / "UK"i
  / "GD"i
  / "GE"i
  / "GF"i
  / "GG"i
  / "GH"i
  / "GI"i
  / "GL"i
  / "GM"i
  / "GN"i
  / "GP"i
  / "GQ"i
  / "GR"i
  / "GS"i
  / "GT"i
  / "GU"i
  / "GW"i
  / "GY"i
  / "HK"i
  / "HM"i
  / "HN"i
  / "HR"i
  / "HT"i
  / "HU"i
  / "ID"i
  / "IE"i
  / "IL"i
  / "IM"i
  / "IN"i
  / "IO"i
  / "IQ"i
  / "IR"i
  / "IS"i
  / "IT"i
  / "JE"i
  / "JM"i
  / "JO"i
  / "JP"i
  / "KE"i
  / "KG"i
  / "KH"i
  / "KI"i
  / "KM"i
  / "KN"i
  / "KP"i
  / "KR"i
  / "KW"i
  / "KY"i
  / "KZ"i
  / "LA"i
  / "LB"i
  / "LC"i
  / "LI"i
  / "LK"i
  / "LR"i
  / "LS"i
  / "LT"i
  / "LU"i
  / "LV"i
  / "LY"i
  / "MA"i
  / "MC"i
  / "MD"i
  / "ME"i
  / "MF"i
  / "SX"i
  / "MG"i
  / "MH"i
  / "MK"i
  / "ML"i
  / "MM"i
  / "MN"i
  / "MO"i
  / "MP"i
  / "MQ"i
  / "MR"i
  / "MS"i
  / "MT"i
  / "MU"i
  / "MV"i
  / "MW"i
  / "MX"i
  / "MY"i
  / "MZ"i
  / "NA"i
  / "NC"i
  / "NE"i
  / "NF"i
  / "NG"i
  / "NI"i
  / "NL"i
  / "NO"i
  / "NP"i
  / "NR"i
  / "NU"i
  / "NZ"i
  / "OM"i
  / "PA"i
  / "PE"i
  / "PF"i
  / "PG"i
  / "PH"i
  / "PK"i
  / "PL"i
  / "PM"i
  / "PN"i
  / "PR"i
  / "PS"i
  / "PT"i
  / "PW"i
  / "PY"i
  / "QA"i
  / "RE"i
  / "RO"i
  / "RS"i
  / "RU"i
  / "RW"i
  / "SA"i
  / "SB"i
  / "SC"i
  / "SD"i
  / "SE"i
  / "SG"i
  / "SH"i
  / "SI"i
  / "SJ"i
  / "SK"i
  / "SL"i
  / "SM"i
  / "SN"i
  / "SO"i
  / "SR"i
  / "SS"i
  / "ST"i
  / "SV"i
  / "SX"i
  / "MF"i
  / "SY"i
  / "SZ"i
  / "TC"i
  / "TD"i
  / "TF"i
  / "TG"i
  / "TH"i
  / "TJ"i
  / "TK"i
  / "TL"i
  / "TM"i
  / "TN"i
  / "TO"i
  / "TR"i
  / "TT"i
  / "TV"i
  / "TW"i
  / "TZ"i
  / "UA"i
  / "UG"i
  / "UM"i
  / "US"i
  / "UY"i
  / "UZ"i
  / "VA"i
  / "VC"i
  / "VE"i
  / "VG"i
  / "VI"i
  / "VN"i
  / "VU"i
  / "WF"i
  / "WS"i
  / "YE"i
  / "YT"i
  / "ZA"i
  / "ZM"i
  / "ZW"i

tchar
  = "!"
  / "#"
  / "$"
  / "%"
  / "&"
  / "'"
  / "*"
  / "+"
  / "-"
  / "."
  / "^"
  / "_"
  / "`"
  / "|"
  / "~"
  / DIGIT
  / ALPHA

unreserved
  = ALPHA
  / DIGIT
  / "-"
  / "."
  / "_"
  / "~"
  / "+"

pct_encoded
  = "%" HEXDIG HEXDIG

ALPHA
  = [\x41-\x5a]
  / [\x61-\x7a]

alphanum
  = ALPHA
  / DIGIT

DIGIT
  = [\x30-\x39]

HEXDIG
  = DIGIT
  / "A"i
  / "B"i
  / "C"i
  / "D"i
  / "E"i
  / "F"i

