module Nesta

  class App

    helpers do

      def list_articles(articles)
        articles.each do |article|
          haml_tag(:li) do
            haml_tag(:a, article.heading,
              :href => path_to(article.abspath),
              :title => article.date.strftime("%A, %B %d"))
          end
        end
      end

      def article_years
        Page.find_articles.map { |a| a.date.year }.uniq
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
