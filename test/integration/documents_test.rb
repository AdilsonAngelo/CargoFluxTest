require 'test_helper'

class DocumentsTest < ActionDispatch::IntegrationTest
  test "should create a document" do
    assert_difference('Document.count') do
      post documents_url, params: { body: "STUB" }
    end
    assert_response :success, "Cannot create document"
  end

  test "should return a single document" do
    doc = documents(:one)
    get document_url(doc)
    assert_response :success, "Cannot return a document alone"
  end
  
  test "should delete a document" do
    doc = documents(:one)
    assert_difference('Document.count', -1) do
      delete document_url(doc)
    end
    assert_response :success, "Cannot delete document"
  end
  
  test "should update a document" do
    doc = documents(:one)
    put document_url(doc),
      params: { id: doc.id, body: "UPDATED", created_at: doc.created_at, updated_at: doc.updated_at }
    assert_response :success, "Cannot delete document"
  end
end
