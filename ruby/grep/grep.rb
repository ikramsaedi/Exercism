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
                does_line_match = line_pattern_comparison(flags, pattern, line)
                #puts "#{does_line_match}; #{pattern}; #{line} "
                if does_line_match
                    puts "this is flags #{flags}"
                    match = match_result_formatter(flags, pattern, does_line_match, file_name, index, line)
                    #flags, pattern, does_line_match, file_name, index, line
                    matching_lines.push(match)
                    # if !match.nil?
                    #     matching_lines.push(match)
                    # end
                    #puts "this is a match#{match}"
                    
                end
            end
        end
        print matching_lines
        return matching_lines.join("\n").rstrip
    end

    # def self.flag_handler(pattern, flags, line, file_name, file, index)
    #     match = nil
    #     if flags.include?("-x") && line == pattern
    #         match = line
    #     end
    #     if flags.include?("-i")
    #         if line.downcase.include?(pattern.downcase)
    #             match =line
    #         end
    #     end
    #     if flags.include?("-n")
    #         if line.include?(pattern)
    #             match = "#{index + 1}:#{line}"
    #         end
    #     end
    #     if flags.include?("-v")
    #         if !line.include?(pattern)
    #             match = line
    #         end
    #     end
    #     if flags.include?("-l")
    #         if line.include?(pattern)
    #             match = file_name
    #         end
    #     end
    #     if !match.nil?
            
    #         return match
    #     else
    #         #
    #     end
    # end

    def self.line_pattern_comparison(flags, pattern, line)
        does_line_match = false
        l = line.dup
        pat = pattern.dup
        if flags.include?("-i")
            puts "this is i"
            l.downcase!
            pat.downcase!
        end
        puts "this is line #{line}"
        puts "l #{l} and pat #{pat}"
        if flags.include?("-x")
            does_line_match = l == pat
        
        elsif l.include?(pat) 
            puts "this is nothing in line pattern"
            does_line_match = true
        end
        #puts "this is doeslinematch #{does_line_match}: #{line}"
        return does_line_match
    end
    
    def self.match_result_formatter(flags, pattern, does_line_match, file_name, index, line)
        puts "hi"
        #puts "this is file name #{file_name}"
        #puts "this is index #{index}"
        puts "This is line #{line}"
        puts "this is flags #{flags}"
        #puts "this is pattern #{pattern}"
        match = nil
        if flags.include?("-l")
            puts "this is l"
            if does_line_match
                match ||= file_name
            end
        end
        if flags.include?("-v")
            puts "this is v"
            if !does_line_match
                match ||= line
            end
        end
        
        if flags.include?("-n")
            puts "this is n"
            if does_line_match
                match ||= "#{index + 1}:#{line}"
            end
        end
        if (!flags.include?("-n") && !flags.include?("-v") && !flags.include?("-l")) && does_line_match
            puts "this is nothing"
            match = line
        end
        #print "this is the match #{match}"
        if !match.nil?
            return match
        end
    end
end

