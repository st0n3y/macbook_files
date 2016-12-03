require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry-byebug'
require 'json'
require_relative './models/calculator.rb'

get '/add/:num1/:num2' do
  calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
  @calculation = calculator.add()
  erb(:result)
end.

get '/subtract/:num1/:num2' do
  calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
  return "#{calculator.subtract}"
end

get '/multiply/:num1/:num2' do
  calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
  return "#{calculator.multiply}"
end

get '/divide/:num1/:num2' do
    calculator = Calculator.new(params[:num1].to_f, params[:num2].to_f)
    return "#{calculator.divide}"
end

get '/all/:num1/:num2' do
  content_type(:json)

  calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)

  results = {
    add: calculator.add(),
    subtract: calculator.subtract(),
    multiply: calculator.multiply(),
    divide: calculator.divide()
  }

  return results.to_json
end

get '/' do
  erb(:home)
end

get '/about_us' do
  erb(:about_us)
end



not_found do
  'Page disna exist, ya tumshie.'
end

error do
  'Uh oh! What have you done?' + env['sinatra.error'].message
end