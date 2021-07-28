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
                does_line_match = line_pattern_comparison(flags, pattern, line)
        
                if does_line_match 
                    match = match_result_formatter(flags, file_name, index, line, file_names, matching_lines)
                    matching_lines.push(match)
                end
            end
        end
        return matching_lines.join("\n").rstrip
    end

    def self.line_pattern_comparison(flags, pattern, line)
        does_line_match = false
        
        l = line.dup
        pat = pattern.dup

        if flags.include?("-i")
            l.downcase!
            pat.downcase!
        end
        if flags.include?("-x")
            does_line_match = l == pat
        
        elsif l.include?(pat) 
            does_line_match = true
        end
        if flags.include?("-v")
            does_line_match = !does_line_match #if the line matches, it becomes false
        end
        return does_line_match
    end
    
    def self.match_result_formatter(flags, file_name, index, line, file_names, matching_lines) 
        file_names.length > 1 ? match = "#{file_name}:" : match = ""

        if flags.include?("-l")
            match = file_name
    
        elsif flags.include?("-n")
            match << "#{index + 1}:#{line}"
        else
            match << line
        end

        return match if match != "" && !matching_lines.include?(file_name)

    end
end

