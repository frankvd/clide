class Clide::Application
  def initialize(@input : Input, @output : Output)
    @commands = [] of Command
  end

  def register(command : Command)
    @commands << command
  end

  def run
    dispatch
  end

  def dispatch
    if ARGV.size == 0
      return list_commands
    end

    command = find_command ARGV[0]

    if command.nil?
      raise "Failed to find a command with the name: " + ARGV[0]
    end

    command.execute @input, @output
  end

  def list_commands
    puts "No command specified. Usage: bin/cli <command-name>"
    puts "The following commands are available: "
    @commands.each do |command|
      puts command.name + " - " + command.description
    end
  end

  def find_command(command_name)
    @commands.find { |c| c.name == command_name }
  end
end
