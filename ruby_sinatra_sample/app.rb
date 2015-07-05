#!/usr/bin/env ruby
# coding: utf-8

require 'sinatra'
require 'sinatra/json'

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

get '/benchmark/simple' do
  result = {
    :ok => true,
    :language => 'Ruby',
    :framework => 'Sinatra',
    :now => Time.now.to_i
  }

  json result
end

get '/benchmark/cpu' do
  max = params[:max].to_i

  result = {
    :ok => true,
    :max => max,
    :result => prime(max),
  }

  json result
end
