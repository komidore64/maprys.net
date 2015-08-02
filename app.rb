require Nesta::Path.local(File.join('helpers', 'archives.rb'))

module Nesta
  class App
    configure do
      enable :logging, :dump_errors
    end
  end
end
