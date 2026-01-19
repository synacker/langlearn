require_relative '../config/application'
require 'ruby_llm'

chat = RubyLLM.chat
response = chat.ask "What is Ruby on Rails?"
puts response.content