require "amethyst/all"

class BenchmarkController < Base::Controller
  actions :simple, :cpu

  def simple
    result = {
      :ok => true,
      :language => "Crystal",
      :framework => "Amethyst",
      :now => Time.now.to_i
    }

    json result.to_json
  end

  def cpu
    max = request.query_parameters["max"].to_i

    result = {
      :ok => true,
      :max => max,
      :result => prime(max),
    }

    json result.to_json
  end

  def prime(max)
    table = Array.new(max, false)
    i_max = Math.sqrt(max) + 2

    return -1 if max < 3

    # init table
    table[0] = table[1] = true # 0 & 1 is not prime number

    # make table
    2.upto(i_max) do |i|
      if !table[i]
        (i + i).step(max - 1, i) do |j|
          table[j] = true
        end
      end
    end

    # search
    (max - 1).downto(0) do |i|
      return i if !table[i]
    end

    return -1
  end
end

class App < Base::App
  routes.draw do
    all "/benchmark/simple", "benchmark#simple"
    all "/benchmark/cpu",    "benchmark#cpu"
    register BenchmarkController
  end
end

app = App.new
app.serve(ENV["PORT"].to_i)
