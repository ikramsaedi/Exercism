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
        print file_names
        file_names.each_with_index do |file_name, index|
            file = File.readlines(file_name, chomp: true) #gives an array of all the lines
            
            file.each_with_index do |line, index|
                if flags.length > 0 && file_names.length > 1
                    if flag_handler(pattern, flags, line, file_name, file, index) != nil
                        matching_lines.push("#{file_name}:#{flag_handler(pattern, flags, line, file_name, file, index)}")
                    end
                elsif flags.length > 0
                    if flag_handler(pattern, flags, line, file_name, file, index) != nil
                        matching_lines.push(flag_handler(pattern, flags, line, file_name, file, index))
                    end
                elsif line.include?(pattern) && file_names.length > 1
                    matching_lines.push("#{file_name}:#{line}")
                elsif line.include?(pattern) 
                    matching_lines.push(line)
                end

            end
        end
        return matching_lines.join("\n")
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
        if flags.include?("-v") && line == pattern
            if !line.include?(pattern) 
                match = line
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

