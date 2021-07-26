=begin
Write your code for the 'Robot Name' exercise in this file. Make the tests in
`robot_name_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-name` directory.
=end

module Robot

    class Robots
        attr_accessor :name
        def initialize()
            @name = choose_name #set this equal to a function
        end

        @@names = []
        @@chosen_names = []

        letters_unjoined = ("A".."Z").to_a.repeated_permutation(2).to_a
            numbers = (0..9).to_a.repeated_permutation(3).to_a

            letters_joined = []
            letters_unjoined.map do |element| #the mapping just joins the letters so it can be strings in arrays not array in array
                letters_joined.push(element.join)
            end
            
            names_unjoined = letters_joined.product(numbers)
            names_unjoined.map do |element|
                @@names.push(element.join)
            end


        def choose_name
            if @@names[0] != nil
                name = @@names[0]
                @@chosen_names.push(name)
                @@names.shift()
                return name
            end
        end

        def reset
            @name = choose_name
        end

        def self.names_clear #this makes it a class method
            @@names.concat(@@chosen_names)
            @@chosen_names.clear
        end

    end
    def self.forget
        Robots::names_clear
    end

    def self.new
        return Robots.new
    end

end

#Robot.new