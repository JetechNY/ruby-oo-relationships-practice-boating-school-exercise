require 'pry'
class Student
    
    attr_accessor :first_name
    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(testname, teststatus, instructor )
        BoatingTest.new(self, testname, teststatus, instructor)
    end

    def all_instructors
        stud=BoatingTest.all.select {|test| test.student == self }
        stud.map {|inst|inst.instructor}
    end

    def self.find_student(first_name)
        self.all.select {|student_ist| student_ist.first_name == first_name}        
    end

    def grade_percentage
        alltest= BoatingTest.all.select {|test| test.student == self }
        passedtest= alltest.map {|test| test.teststatus == "passed"}
        (passedtest.count.to_f/alltest.count)*100
        #passed/alltest
    end
end
# 