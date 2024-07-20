class HomeController < ApplicationController
  before_action :load_data, only: [:index, :books, :sections]

  include HTTParty

  def home
  end

  def index
    @all_last15_books = all_last15_book
  end

  def books
    @all_last15_books = all_last15_book
  end


  def sections
    @sections = all_sectionsarray
    @all_last15_books = all_last15_book
    puts @sections
  end

  def about
  end

  def contact
  end

  private

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
    @response_code = response.code
  end

  def all_last15_book
    return [] unless @books.present? && @books["All_Last15_Book"].present?

    books = @books["All_Last15_Book"].map do |trend_books|
      {
        title: trend_books["Title"],
        info: trend_books["Info"],
        writer: trend_books["Writer"],
        section: trend_books["Section"],
        download_count: trend_books["Download"],
        real_download_count: trend_books["Real_Download"],
        link: trend_books["Link"],
        photo_link: trend_books["Photo_Link"],
        book_size: trend_books["BookSize_TXT"],
        pages_count: trend_books["pages_count"]
      }
    end

    if @response_code
      puts "send it Successfully".green
    end

    books
  end

  def all_sectionsarray
    return [] unless @books.present? && @books["All_SectionsArray"].present?

    sections = @books["All_SectionsArray"].map do |all_sectionsarray|
      {
        id: all_sectionsarray["id"],
        last_add_title: all_sectionsarray["LastAdd_Title"],
        section: all_sectionsarray["Section"],
        section_id: all_sectionsarray["Section_ID"],
        photo_link: all_sectionsarray["Photo_Link"],
        total_books: all_sectionsarray["Total_Books"],
        total_download: all_sectionsarray["Total_Download"],
        info: all_sectionsarray["Info"]
      }
    end

    if @response_code
      puts "send it Successfully".green
    end

    sections
  end
end
