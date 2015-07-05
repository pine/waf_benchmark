class BenchmarkController < ApplicationController

  def simple
    render :json => {
      :ok => true,
      :language => 'Ruby',
      :framework => 'Sinatra',
      :now => Time.now.to_i
    }
  end

  def cpu
    max = params[:max].to_i

    render :json => {
      :ok => true,
      :max => max,
      :result => prime(max),
    }
  end

  private

  def prime(max)
    table = Array.new(max, false)
    i_max = Math.sqrt(max) + 2

    return -1 if max < 3

    # init table
    table[0..1] = true # 0 & 1 is not prime number

    # make table
    2.upto(i_max) do |i|
      if not table[i]
        (i + i).step(max, i) do |j|
          table[j] = true
        end
      end
    end

    # search
    (max - 1).downto(0) do |i|
      return i if not table[i]
    end

    return -1
  end
end
