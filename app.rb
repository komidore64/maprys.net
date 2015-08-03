module Nesta
  class App
    configure do
      enable :logging, :dump_errors
    end

    helpers do
      ##############################
      ### archives
      ##############################
      def list_articles(articles)
        articles.each do |article|
          haml_tag(:li) do
            haml_tag(:a, article.heading,
              :href => path_to(article.abspath),
              :title => article.date.strftime('%A, %B %d'))
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

      ##############################
      ### page_meta
      ##############################
      def history_baselink
        'http://github.com/komidore64/maprys.net/commits/master/'
      end

      def initial_commit?
        # turns out openshift separates the repo and the git directory, so i had to find it
        openshift_app_name = ENV['OPENSHIFT_APP_NAME']
        git_command = []
        git_command << 'git'
        git_command << "--git-dir=\"$HOME/git/#{openshift_app_name}.git/\"" unless openshift_app_name.nil?
        git_command << 'log'
        git_command << '--follow'
        git_command << '--format=format:%H'
        git_command << '--'
        git_command << "\"#{@page.filename}\""

        # Unfortunately this breaks down when a file has be moved/renamed.
        # Git can handle that (with the `--follow` flag), but Github cannot.
        `#{git_command.join(' ')}`.split("\n").size <= 1
      end

      def github_history(text)
        haml_tag(:a, text,
          :href => "#{history_baselink}#{@page.filename}",
          :target => '_blank')
      end
    end
  end
end
