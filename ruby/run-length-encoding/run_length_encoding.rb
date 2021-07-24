=begin
Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
`run_length_encoding_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/run-length-encoding` directory.
=end

module RunLengthEncoding
    def self.encode(string)
        string_array = string.split("")

        count = 0 #this will default to 0 after the next has been executed
        chara_expected = string_array[0]
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
                #puts new_string
                count = 1
                chara_expected = chara
           end
        end

        if count == 1
            new_string << chara_expected
        elsif
            new_string << count.to_s << chara_expected
        end
        puts new_string
        
    end

    # def self.encode(string)
    #     string_array = string.split("")

    #     string_array.each_with_index do |chara, index|
    #         count = 0
    #         stored_index = 0

    #         if chara == string_array[index + 1] 
    #             for i2 in 0..string_array.length do
    #                 if chara == string_array[i2]
    #                     count += 1
    #                     print count
    #                     puts chara

    #                 end
    #             end

    #             # stored_index = index
    #             # next if index != count + stored_index
    #         else 
    #             #puts "bye"
    #         end

    #         count_and_chara = "#{count}#{chara}"

    #         #puts count_and_chara

    #     end
    # end
end

RunLengthEncoding::encode("iiiikkrraam")
#4i, 2k, 2r, 2a, m