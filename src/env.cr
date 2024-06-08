env_args = Hash(String, String)
already_set = false

def init_env
  if !File.readable?(".env")
    puts "Can not find a .env file in the working directory."
    Process.exit(1)
  end

  content = File.read(".env")
  content = content.split("\n")

  env_args_ = Hash(String, String).new;

  content.each { |n|
    split = n.split("=")
    if split.size != 1
      env_args_[split[0]] = split[1]
    end
  }

  env_args = env_args_
  already_set = true
  env_args
end
