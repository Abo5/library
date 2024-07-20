# frozen_string_literal: true

require 'httparty'
require 'json'

def load_data
  url = 'http://novbook.net/app/Get_all_novels_5.php'
  headers = {
    'Content-Type' => 'application/x-www-form-urlencoded',
    'Accept' => '*/*',
    'User-Agent' => 'Novels/33 CFNetwork/1492.0.1 Darwin/23.3.0',
    'Accept-Language' => 'ar',
    'Accept-Encoding' => 'gzip, deflate'
  }
  data = {
    Sorting: 0,
    LimitTb: 6,
    ArraySettingSectionTXT: ''
  }
  response = HTTParty.post(url, headers: headers, body: data)
  @books = JSON.parse(response.body)
  if response
    puts "send it Successfully"
    File.open("books.json", 'a') do |file|
      file.write("#{@books}")
    end
  end
end

def all_sections
  return [] unless @books && @books["AllSections"]

  @books["AllSections"].map do |all_sections|
    {
      id: all_sections["id"],
      last_add_title: all_sections["LastAdd_Title"],
      section: all_sections["Section"],
      section_id: all_sections["Section_ID"],
      photo_link: all_sections["Photo_Link"],
      total_books: all_sections["Total_Books"],
      total_download: all_sections["Total_Download"],
      info: all_sections["Info"]
    }
  end

end

load_data
puts all_sections
