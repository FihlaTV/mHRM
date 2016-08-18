require 'rails_helper'

RSpec.describe "documents/edit", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :title => "MyString",
      :description => "MyText",
      :user_id => 1,
      :document_type_id => 1,
      :attachment => "MyString"
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "input#document_title[name=?]", "document[title]"

      assert_select "textarea#document_description[name=?]", "document[description]"

      assert_select "input#document_user_id[name=?]", "document[user_id]"

      assert_select "input#document_document_type_id[name=?]", "document[document_type_id]"

      assert_select "input#document_attachment[name=?]", "document[attachment]"
    end
  end
end
