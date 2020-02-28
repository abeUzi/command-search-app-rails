class CommandsController < ApplicationController
  def index
    @commands = Command.all
  end
end
