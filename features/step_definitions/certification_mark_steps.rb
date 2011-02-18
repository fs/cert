Then /^I should see "([^"]*)" mark(?: with "([^"]*)" comment)? within "([^"]*)"$/ do |mark, comment, selector|
  selector += %Q{ span[title="#{comment}"]} if comment.present?

  with_scope(selector) do
    page.should have_content(mark)
  end
end
