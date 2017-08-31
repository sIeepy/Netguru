# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord
  belongs_to :genre
end

class TitleValidator < ActiveModel::Validator
  def validate(record)
    stack  = []
    lookup = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
    left   = lookup.keys
    right  = lookup.values

    str.each_char do |char|
    if left.include? char
      stack << char
    elsif right.include? char
      return false if stack.empty? || (lookup[stack.pop] != char)
    end
  end

  return stack.empty?
end
  def validate(record)
    if options[:fields].any?{|field| record.send(field) == "Evil" }
      record.errors[:base] << "This person is evil"
    end
  end
end

class Person < ApplicationRecord
  validates_with GoodnessValidator, fields: [:first_name, :last_name]
end
