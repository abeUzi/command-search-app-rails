class CommandsController < ApplicationController
  def index
    @commands = Command.all
    @command_types = CommandType.all
  end

  def search
    @commands = command_search
    render json:@commands
  end

  private
  def command_search
    if params[:commandType] != "" then
      @commands = CommandType.find(params[:commandType]).commands
    else
      @commands = Command.all
    end

    keywords = params[:keyword].split(/[[:blank:]]+/)
    if keywords.length != 0 then
        keywords.each_with_index do |w,i|
          @commands = @commands.keyword_search(w)     
        end
    end
    @commands
  end
end
