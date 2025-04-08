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
  = ALPHA ALPHA

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

