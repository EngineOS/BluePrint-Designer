module Humanizer
  class Blueprint

    def initialize(blueprint, title='Blueprint (v0.1)')
      @blueprint = YAML.load(blueprint)
      @title = title
    end

    def html
      "#{css}<div class='humanized_blueprint'>#{content}</div>".html_safe
    end

    def content
      steps #[intro, steps, footer].compact().join('<br>')
    end

  private

    def css
      "<style>
      .humanized_blueprint { line-height: 1.2; }
      .humanized_blueprint div.data_string { display: inline-block; line-height: 1.2; margin-left: 40px; }
      .humanized_blueprint label { padding-bottom: 5px; }
      .humanized_blueprint span.engines_parameter { color: #999; }
      .humanized_blueprint label { vertical-align: top; margin-top: 0px; }
      </style>"
    end

    def software
      @blueprint["software"].present? ? @blueprint["software"] : @blueprint
    end

    # def intro
    #  "<h3>Installation</h3>
    #   <p>Greetings from the end of the time...</p>"
    # end

    def steps
      Component.new(@title, software).humanize
    end

    # def footer
    #   "That is all."
    # end

  end
end