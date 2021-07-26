=begin
Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
`run_length_encoding_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/run-length-encoding` directory.
=end

module RunLengthEncoding
    def self.encode(string)
        string_array = string.split("")
        print string_array
         if string_array == []
            return string
         end
        count = 0 #this will default to 0 after the next has been executed
        chara_expected = string_array[0]
        print chara_expected #chara_expected is the problem, it becomes nil here
        new_string = ""

        string_array.each_with_index do |chara, index|
           # count = 0 #reassigning it to 0
           if chara == chara_expected
                count += 1
                chara_expected = chara
           elsif chara != chara_expected 
                if count == 1
                    count_and_chara = chara_expected
                elsif 
                    count_and_chara = count.to_s << chara_expected
                end
                new_string << count_and_chara
                count = 1
                chara_expected = chara
            
            end
            
        end

        if count == 1
            new_string << chara_expected
        elsif
            new_string << count.to_s << chara_expected
        end
        #puts new_string
        return new_string
    end

    def self.decode(string)
        string_array = string.split("")
        new_string = ""
        string_array.each_with_index do |chara, index|
            if (/\d/ =~ chara) != nil #if its a number
                puts chara
                repeated_charas_array = Array.new(chara.to_i, string_array[index + 1])
                repeated_charas_string = repeated_charas_array.join
                new_string << repeated_charas_string
            elsif (/\d/ =~ chara) == nil && (/\d/ =~ string_array[index - 1]) == nil
                new_string << chara
            end
        end 
        puts new_string
    end
end

RunLengthEncoding::decode("2a3b4c")
#4i, 2k, 2r, 2a, m