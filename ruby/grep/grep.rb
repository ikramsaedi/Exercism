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
                if flags.length > 0
                    if flag_handler(pattern, flags, line, file_name, file, index) != nil
                        matching_lines.push(flag_handler(pattern, flags, line, file_name, file, index))
                        puts "hi"
                    end
                elsif line.include?(pattern)
                    matching_lines.push(line)
                    puts "bye"
                end

            end
        end
        print matching_lines
        return matching_lines.join("\n").rstrip
    end

    def self.flag_handler(pattern, flags, line, file_name, file, index)
        match = nil
        if flags.include?("-x") && line == pattern
            match = line
        end
        if flags.include?("-i")
            if line.downcase.include?(pattern.downcase)
                match =line
            end
        end
        if flags.include?("-n")
            if line.include?(pattern)
                match = "#{index + 1}:#{line}"
            end
        end
        if flags.include?("-v")
            if line.include?(pattern)
                file2 = file.delete(line)
                match = file2
            end
        end
        if flags.include?("-l")
            if line.include?(pattern)
                match = file_name
            end
        end
        if !match.nil?
            
            return match
        else
            #
        end
    end
end

