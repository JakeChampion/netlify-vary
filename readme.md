-n spec and tests for netlify-vary

generate the html file from the abnf definition like so:
`kgt -l abnf -e html5 < netlify-vary.abnf > public/index.html`

```
Netlify-Vary:
    │├──╮─── header-directives ───╭──╮──────────────────────────────────────────────────────────╭──┤│
        │                         │  │                                                          │
        ╰─── query-directives ────╯  │  ╭─────────────────────────<──────────────────────────╮  │
        │                         │  │  │                                                    │  │
        ╰─── cookie-directives ───╯  │  │                       ╭────────────>────────────╮  │  │
        │                         │  │  │                       │                         │  │  │
        ╰── language-directives ──╯  ╰──╰── OWS ── "," ── OWS ──┼─── header-directives ───┼──╯──╯
        │                         │                             │                         │
        ╰── country-directives ───╯                             ╰─── query-directives ────╯
                                                                │                         │
                                                                ╰─── cookie-directives ───╯
                                                                │                         │
                                                                ╰── language-directives ──╯
                                                                │                         │
                                                                ╰── country-directives ───╯

header-directives:
    │├── "header=" ──╭───── field-name ──────╮──┤│
                     │                       │
                     ╰── OWS ── "|" ── OWS ──╯

cookie-directives:
    │├── "cookie=" ──╭───── cookie-name ─────╮──┤│
                     │                       │
                     ╰── OWS ── "|" ── OWS ──╯

language-directives:
    │├── "language=" ──╭── combo-language-range ──╮──┤│
                       │                          │
                       ╰─── OWS ── "|" ── OWS ────╯

country-directives:
    │├── "country=" ──╭── combo-iso-3166-1-code ──╮──┤│
                      │                           │
                      ╰──── OWS ── "|" ── OWS ────╯

query-directives:
                   ╭─────────────────>──────────────────╮
                   │                                    │
    │├── "query" ──╯── "=" ──╭──────── query ────────╮──╰──┤│
                             │                       │
                             ╰── OWS ── "|" ── OWS ──╯

combo-language-range:
    │├──╭─── language-range ────╮──┤│
        │                       │
        ╰── OWS ── "+" ── OWS ──╯

combo-iso-3166-1-code:
    │├──╭─── iso-3166-1-code ───╮──┤│
        │                       │
        ╰── OWS ── "+" ── OWS ──╯

cookie-name:
    │├── token ──┤│

query:
    │├──╭── pchar ──╮──┤│
        │           │
        ╰─────<─────╯

pchar:
    │├──╮── unreserved ───╭──┤│
        │                 │
        ╰── pct-encoded ──╯
        │                 │
        ╰────── "*" ──────╯

unreserved:
    │├──╮── ALPHA ──╭──┤│
        │           │
        ╰── DIGIT ──╯
        │           │
        ╰─── "+" ───╯
        │           │
        ╰─── "-" ───╯
        │           │
        ╰─── "." ───╯
        │           │
        ╰─── "_" ───╯
        │           │
        ╰─── "~" ───╯

pct-encoded:
    │├── "%" ── HEXDIG ── HEXDIG ──┤│

field-name:
    │├── token ──┤│

OWS:
    │├──╭────────────────╮──┤│
        │                │
        ╰──╮─── SP ───╭──╯
           │          │
           ╰── HTAB ──╯

tchar:
    │├──╮─── "!" ───╭──┤│
        │           │
        ╰─── "#" ───╯
        │           │
        │     :     │
        │           │
        ╰─── "'" ───╯
        │           │
        ╰─── "*" ───╯
        │           │
        ╰─── "+" ───╯
        │           │
        ╰─── "-" ───╯
        │           │
        ╰─── "." ───╯
        │           │
        ╰─── "^" ───╯
        │           │
        ╰─── "_" ───╯
        │           │
        ╰─── "`" ───╯
        │           │
        ╰─── "|" ───╯
        │           │
        ╰─── "~" ───╯
        │           │
        ╰── DIGIT ──╯
        │           │
        ╰── ALPHA ──╯

token:
    │├──╭── tchar ──╮──┤│
        │           │
        ╰─────<─────╯

language-range:
    │├──╮───────╭── ALPHA ──╮───────╮────────────────────────────────────────╭──╭──┤│
        │       │           │       │                                        │  │
        │       ╰─────<─────╯       │  ╭────────────────<─────────────────╮  │  │
        │   (seven times at most)   │  │                                  │  │  │
        │                           ╰──╰── "-" ─────╭── alphanum ──╮──────╯──╯  │
        │                                           │              │            │
        │                                           ╰──────<───────╯            │
        │                                         (seven times at most)         │
        │                                                                       │
        ╰───────────────────────────────── "*" ─────────────────────────────────╯

alphanum:
    │├──╮── ALPHA ──╭──┤│
        │           │
        ╰── DIGIT ──╯

iso-3166-1-code:
    │├── ALPHA ── ALPHA ──┤│

ALPHA:
    │├──╮── "A" ──╭──┤│
        │         │
        │    :    │
        │         │
        ╰── "Z" ──╯
        │         │
        ╰── "a" ──╯
        │         │
        │    :    │
        │         │
        ╰── "z" ──╯

DIGIT:
    │├──╮── "0" ──╭──┤│
        │         │
        │    :    │
        │         │
        ╰── "9" ──╯

SP:
    │├── " " ──┤│

HTAB:
    │├── "\t" ──┤│

HEXDIG:
    │├──╮── DIGIT ──╭──┤│
        │           │
        ╰─── "A" ───╯
        │           │
        │     :     │
        │           │
        ╰─── "F" ───╯
        │           │
        ╰─── "a" ───╯
        │           │
        │     :     │
        │           │
        ╰─── "f" ───╯

```
