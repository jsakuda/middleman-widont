require "middleman-core"
require "nokogiri"

class Widont < ::Middleman::Extension
  VERSION = "1.0.3"

  option :nbsp, "\u00A0", "String to use between the last two words"
  option :tags, %w[p h1 h2 h3 h4 h5 h6], "Tags to apply widont"

  def after_configuration
    app.use Rack, options
  end

  class Rack
    def initialize(app, options={})
      @app = app
      @nbsp = options[:nbsp]
      @tags = options[:tags]
    end

    def call(env)
      status, headers, response = @app.call(env)

      type = headers.fetch("Content-Type", "application/octet-stream").split(";").first
      path = env["PATH_INFO"]
      
      if type == "text/html"
         html = ::Middleman::Util.extract_response_text(response)
         html_doc = Nokogiri::HTML(html)

         html_doc.css(@tags.join(", ")).each do |tag|
           content = tag.inner_html.strip
           index = content.rindex(/\s/)
           if index
             content[index] = @nbsp
             tag.inner_html = content
           end
        end
        response = html_doc.to_html
      end

      if response.is_a?(String)
        headers["Content-Length"] = ::Rack::Utils.bytesize(response).to_s
        response = [response]
      end

      [status, headers, response]
    end
  end
end

::Middleman::Extensions.register(:widont, Widont)

