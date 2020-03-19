abstract class Clide::Command
  macro name(name)
    def name
      {{name}}
    end
  end
  abstract def name
  def description
    "No description available"
  end
  abstract def execute(input : Input, output : Output)
end
