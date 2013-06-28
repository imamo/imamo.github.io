class Vimeo < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
          @width = 560
          @height = 420
      else
          @width = $2.to_i
          @height = $3.to_i
      end
    else
      raise "No VImeo ID provided in the \"vimeo\" tag"
    end
  end

  def render(context)
    # "<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}\" frameborder=\"0\"allowfullscreen></iframe>"
    "<iframe src=\"http://player.vimeo.com/video/#{@id}\" frameborder=\"0\" width=\"700\" height=\"394\">        </iframe>"
  end

  Liquid::Template.register_tag "vimeo", self
end
