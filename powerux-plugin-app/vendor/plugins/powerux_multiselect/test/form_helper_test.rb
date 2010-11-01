require "test_helper"

class Post
  attr_accessor :author
end

class FormHelperTest < ActionView::TestCase
  def test_multiselect_control_tag
    assert_match(/data-multiselect=\"some\/path\"/, multiselect_control_tag('field_name', [], '', :multiselect => 'some/path'))
  end

  def test_multiselect_control
    post = Post.new
    assert_match(/data-multiselect=\"some\/path\"/, multiselect_control(:post, :author, :multiselect => 'some/path'))
  end

  def test_autocomplete_multiselect_tag
    assert_match(/data-multiselect=\"some\/path\"/, autocomplete_multiselect_tag('field_name', '', 'some/path'))
  end

  def test_autocomplete_multiselect
    post= Post.new
    assert_match(/data-multiselect=\"some\/path\"/, autocomplete_multiselect(:post, :author, 'some/path'))
  end
end
