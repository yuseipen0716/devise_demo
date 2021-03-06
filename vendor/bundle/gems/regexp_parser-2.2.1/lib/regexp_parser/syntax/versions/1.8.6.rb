module Regexp::Syntax
  class V1_8_6 < Regexp::Syntax::Base
    def initialize
      super

      implements :anchor, Anchor::All
      implements :assertion, Assertion::Lookahead
      implements :backref, Backreference::V1_8_6
      implements :posixclass, PosixClass::Standard
      implements :group, Group::V1_8_6
      implements :meta, Meta::Extended
      implements :set, CharacterSet::All
      implements :type, CharacterType::Extended
      implements :escape,
        Escape::Basic + Escape::ASCII + Escape::Meta + Escape::Control
      implements :quantifier,
        Quantifier::Greedy + Quantifier::Reluctant +
        Quantifier::Interval + Quantifier::IntervalReluctant
    end
  end
end
