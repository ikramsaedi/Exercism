=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

# -n -> line numbers
# -i -> case insensitive
# -l -> print file name
# -x -> give the entire line the  match is found on
# -v Invert the program -- collect all lines that fail to match the pattern.

module Grep
    def self.grep(pattern, flags, files)
        files.each_with_index do |file, index|
            file_name = File.readlines(file, chomp: true) #gives an array of all the lines
            matching_lines = []

            file_name.each_with_index do |line, index|
                if line.include?(pattern)
                    matching_lines.push(line)
                end
            end
            puts matching_lines
            return matching_lines[0]
        end
    end
end

