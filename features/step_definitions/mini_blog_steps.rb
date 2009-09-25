Given /^the following mini_blogs:$/ do |mini_blogs|
  MiniBlog.create!(mini_blogs.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) mini_blog$/ do |pos|
  visit mini_blogs_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following mini_blogs:$/ do |expected_mini_blogs_table|
  expected_mini_blogs_table.diff!(table_at('table').to_a)
end
