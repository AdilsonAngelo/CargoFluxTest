require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test "should not save Document without body" do
    doc = Document.new
    assert_not doc.save, "Saved document without a body"
  end

  test "can save a document on database" do
    doc = Document.new
    doc.body = "#Header"
    assert doc.save, "Cannot save document on database"
  end

  test "can update a document on database" do
    doc = Document.new
    doc.body = "#PREV"
    doc.save
    assert doc.update_attributes(:body => "#CURR"), "Cannot update document on database"
  end

  test "can delete a document on database" do
    doc = Document.new
    doc.body = "#STUB"
    doc.save
    assert doc.destroy, "Cannot delete document on database"
  end
end
