class TitleBracketsValidator < ActiveModel::Validator

  def validate(record)
    stack  = []
    brackets = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
    valid = true

    record.title.each_char.with_index do |char, index|
      if brackets.key? char
        stack << [brackets[char], index]
      end

      if brackets.value? char
        bracket = stack.pop
        if bracket.nil? || bracket[0] != char || bracket[1]+1 == index
          valid = false
        end
      end
    end

    record.errors.add(:title, 'has unclosed bracket') unless stack.empty? && valid

  end
end
