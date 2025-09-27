require "mongo_beautiful_logger/colors"

module MongoActions
  include Colors

  # https://bugs.ruby-lang.org/issues/20433
  arrow = (RUBY_VERSION >= '3.4') ? ' =>' : '=>'

  # substring matches and the corresponding colors for mongodb actions
  FIND         = { match: "\"find\"#{arrow}",        color: BLUE }
  UPDATE       = { match: "\"update\"#{arrow}",      color: YELLOW }
  INSERT       = { match: "\"insert\"#{arrow}",      color: GREEN }
  DELETE       = { match: "\"delete\"#{arrow}",      color: RED }
  AGGREGATE    = { match: "\"aggregate\"#{arrow}",   color: MAGENTA }
  SUCCEEDED    = { match: "succeeded",               color: GREEN }
  FAILED       = { match: "failed",                  color: RED }
  ERROR        = { match: "error",                   color: RED }
  ENDSESSION   = { match: "\"endsessions\"#{arrow}", color: YELLOW }
  INITIALIZING = { match: "initializing",            color: GREEN }
  ACTIONS      = [ FIND, UPDATE, INSERT, DELETE, AGGREGATE, 
                   SUCCEEDED, FAILED, ERROR, ENDSESSION, INITIALIZING ]
  
  # substring matches for unnecessary log messages that will be filtered out
  UNNECESSARY  = ["opology", "server description"]

  # regex for the log prefix that will be filtered out
  # matches: +| localhost:27017 | app_test.update | STARTED |+
  # note: +| STARTED |+ and +| SUCCEEDED |+ will be filtered due to redundancy,
  # but +| FAILED |+ and others will not
  PREFIX_REGEX = /\|.*?\|.*?\|( (SUCCEEDED|STARTED) \|)?/
end
