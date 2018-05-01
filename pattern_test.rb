require 'minitest/autorun'
require_relative 'alphanumeric_pattern_generator'

class AlphanumericPatternGeneratorTest < Minitest::Test
  def test_it_can_verify_a_single_alphabetic_character
    # skip
    pattern = '.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('F')
  end

  def test_it_verifies_upper_and_lowercase_characters
    # skip
    pattern = '.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('r')
    assert_equal true, pg.verify('R')
  end

  def test_it_generates_a_single_character_pattern
    # skip
    pattern = '.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert /[A-Z]/.match(pg.generate)
    refute /[0-9]/.match(pg.generate)
  end

  def test_it_can_verify_a_single_numeric_character
    # skip
    pattern = '#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('3')
    assert_equal false, pg.verify('W')
  end

  def test_it_generates_a_single_numeric_pattern
    # skip
    pattern = '#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert /[0-9]/.match(pg.generate)
    refute /[A-Z]/.match(pg.generate)
  end

  def test_it_verifies_more_complex_patterns
    # skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('A3A')
    assert_equal true, pg.verify('a2a')
    assert_equal false, pg.verify('AAA')
  end

  def test_it_generates_more_complex_patterns
    # skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert /[A-Z][0-9][A-Z]/.match(pg.generate)
  end

  def test_it_verifies_patterns_with_specific_elements
    # skip
    pattern = '.##ZA3.#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('a23za3h1')
    assert_equal true, pg.verify('a23ZA3h1')
    assert_equal false, pg.verify('a23az3h1')
  end

  def test_it_verifies_patterns_with_specific_elements_in_different_spots
    # skip
    pattern = 'A#23.9.F'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal true, pg.verify('A523B9CF')
    assert_equal false, pg.verify('a123a8hf')
  end

  def test_it_generates_patterns_with_constants
    # skip
    pattern = 'A#23..#'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert /A[0-9]23[A-Z][A-Z][0-9]/.match(pg.generate)
  end

  def test_it_generates_nth_value_of_patterns
    # skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 'A0A', pg.generate(0)
    assert_equal 'A1B', pg.generate(27)
    assert_equal 'Z9Z', pg.generate(6759)
    assert_equal 'Z9Y', pg.generate(6758)
  end

  def test_it_raises_exception_if_invalid_value_is_passed_to_generate
    # skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_raises(ArgumentError) { pg.generate(10000) }
    assert_raises(ArgumentError) { pg.generate(-25) }
  end

  def test_it_generates_nth_value_of_patterns
    # skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 'A0A', pg.generate(0)
    assert_equal 'A1B', pg.generate(27)
    assert_equal 'Z9Z', pg.generate(6759)
    assert_equal 'Z9Y', pg.generate(6758)
  end

  def test_it_generates_nth_value_of_patterns_with_constants
    # skip
    pattern = 'R#..W'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 'R0AAW', pg.generate(0)
    assert_equal 'R0BAW', pg.generate(26)
    assert_equal 'R9ZYW', pg.generate(6758)
  end

  def test_it_generates_the_total_available_patterns
    # skip
    pattern = '.#.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 6760, pg.total_available
  end

  def test_it_generates_the_total_available_patterns_with_constants
    # skip
    pattern = '.1.'
    pg = AlphanumericPatternGenerator.new(pattern)

    assert_equal 676, pg.total_available
  end
end
