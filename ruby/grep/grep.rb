=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

# -n -> line numbers 
# -i -> case insensitive
# -l -> print file name
# -x -> the pattern has to exactly match the whole line
# -v Invert the program -- collect all lines that fail to match the pattern.

module Grep
    def self.grep(pattern, flags, file_names)
        matching_lines = []
        file_names.each_with_index do |file_name, index|
            file = File.readlines(file_name, chomp: true) #gives an array of all the lines
            

            file.each_with_index do |line, index|
                if flags.include?("-i")
                    if line.downcase.include?(pattern.downcase)
                        matching_lines.push(line)
                    end
                elsif flags.include?("-l")
                    if line.include?(pattern)
                        matching_lines.push(file_name)
                    end
                elsif flags.include?("-n")
                    if line.include?(pattern)
                        matching_lines.push("#{index + 1}:#{line}")
                    end
                elsif flags.include?("-x")
                    if line == pattern
                        matching_lines.push(line)
                    end
                elsif flags.include?("-v")
                    if line.include?(pattern)
                        file2 = file.delete(line)
                        matching_lines.push(file2)
                    end
                elsif line.include?(pattern)
                    matching_lines.push(line)
                end

            end
        end

         matching_lines

        return matching_lines.join("\n")
    end

    # def doesLineMatchEntirely(pattern, flags, line)
    #     if flags.include?("x") && line == pattern
    #         return line

    #     end
    # end
end

