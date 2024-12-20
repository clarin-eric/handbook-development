# Localisation / internationaliszation

- Application configuration
   - Default locale
   - Make locale configurable (?)Determining locale for client
   - Respect browser setting
   - User override (through UI)
   - Don't use location for this!!
- Character set
   - on provisioning, set server/host default encoding to UTF-8
   - docker images: configure default encoding to UTF-8
   - Applications: use UTF-8 explicitly
- Multilingual interfaces
   - Does the interface have to be multilingual?
      - Only if content is also available in other languages
   - \[insert link to articles about developer assumptions\]
   - UI testing
      - Very exotic Non-latin characters and diacritics (umlauts)
      - Strings with variables inserted (order, split)
      - Tests forms, error messages, generated strings
         - Also check:
            - numerical values (thousands and decimal separators)
            - dates - pay attention to different renderings (long, short, month name, day of the week)
      - Manual test with browser
         - Set browser to non-standard language/locale
   - Use platform's framework
   - Do it from the start
   - Use this consistently
      - Don't use more different methods for defining string resources than necessary
   - Gotchas
      - {find online documentation for this}
      - text direction; plural/singular; complex formatting (printf vs string concatenation)
   - Aligning application, frameworks/libraries and content localisation
      - Check that e.g. widgets don't do 'rogue' localisation
   - Writing direction
      - Where it's easy, be agnostic
      - We don't design or test explicitly for different writing directions (only ltr)
- Date and time
   - date formats ISO 8601
   - time zones, DST
      - explicit timezone
      - on provisioning, set server/host timezone to UTC+0
      - docker images: configure to explicitly set timezone to UTC+0 (part of init logic in base image)
   - & logging
      - Always log date/time with timezone included
      - Aim for using a single time zone across servers and applications
      - Date/time format: configure [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
