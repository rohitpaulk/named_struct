require "test_helper"

class NamedStructTest < Minitest::Test
  class ClassForTestKeywordArguments < NamedStruct.new(:x, :y)
  end

  def teardown
    # Remove class defined in tests
    if NamedStruct.constants.include?(:Point)
      NamedStruct.send(:remove_const, :Point)
    end
  end

  def test_keyword_arguments
    point = ClassForTestKeywordArguments.new(x: 1, y: 2)
    assert_equal(point.x, 1)
    assert_equal(point.y, 2)
  end

  def test_keyword_arguments_for_dynamic_class
    NamedStruct.new("Point", :x, :y)
    point = NamedStruct::Point.new(x: 1, y: 2)
    assert_equal(point.x, 1)
    assert_equal(point.y, 2)
  end

  def test_missing_values_are_nil
    NamedStruct.new("Point", :x, :y)
    point = NamedStruct::Point.new(x: 1)
    assert_nil(point.y)
  end

  def test_argument_error_if_bogus_argument_provided
    NamedStruct.new("Point", :x, :y)
    exception = assert_raises ArgumentError do
      NamedStruct::Point.new(invalid_arg: "dummy")
    end

    assert_equal("Unknown named struct member: invalid_arg", exception.message)
  end
end
