class CommandsController < ApplicationController
  def index
    @commands = Command.all
    @command_types = CommandType.all
  end

  def search
    if params[:commandType] != "" then
      @commands = CommandType.find(params[:commandType]).commands
    else
      @commands = Command.all
    end

    keywords = params[:keyword].split(/[[:blank:]]+/)
    if keywords.length != 0 then
        keywords.each_with_index do |w,i|
          if i == 0 then
            @commands = @commands.where('command LIKE ? OR description LIKE ?', "%#{w}%","%#{w}%")        
          else
            @commands = @commands.where('command LIKE ? OR description LIKE ?', "%#{w}%","%#{w}%")
          end
        end
    end
    render json:@commands
  end
end
