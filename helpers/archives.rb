module Nesta

  class App

    helpers do

      def list_articles(articles)
        articles.each do |article|
          haml_tag(:li) do
            haml_tag(:a, article.heading, :href => path_to(article.abspath))
          end
        end
      end

      def article_years
        articles = Page.find_articles # #find_articles already sorts them by date, so I don't need to worry about it.
        last, first = articles[0].date.year, articles[-1].date.year
        (first..last).to_a.reverse
      end

      def archive_by_year
        article_years.each do |year|
          haml_tag(:li) do
            haml_tag(:h2, year)
            haml_tag(:ul) do
              articles = Page.find_articles.select { |a| a.date.year == year }
              list_articles(articles)
            end
          end
        end
      end

    end

  end

end
