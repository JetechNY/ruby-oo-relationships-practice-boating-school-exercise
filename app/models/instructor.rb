require 'pry'
class Instructor
    
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_students
        stu=BoatingTest.all.select {|test| test.instructor == self}
        stu.map {|stu|stu.student}
    end    
    
    def passed_students
        BoatingTest.all.each_with_object ([]) {|bt, arr| arr << bt.student if bt.teststatus == "passed"}
    end

    def pass_student(student, testname)
        test_array = BoatingTest.all.find {|test| test.student == student && test.testname == testname }
        if test_array
            test_array.teststatus = "passed"
        else
            BoatingTest.new(student, testname, "passed", self)

        end
    end
   
    def fail_student(student, test_name)
        test_array= BoatingTest.all.find {|test| test.student == student && test.name == test_name}
        if test_array
        test_array.teststatus = "failed"
        else
          BoatingTest.new(student, test_name, "failed", self)
        end
      end
 
end
# # Instructor class: 
# * initialize with a name 
# * Instructor.all should return all instructors 
# * Instructor#passed_students should return an array of students who passed a boating test with this specific instructor. 
# * Instructor#pass_student should take in a student instance and test name. If there is a BoatingTest whose name and student match the values passed in, this method should update the status of that BoatingTest to 'passed'. If there is no matching test, this method should create a test with the student, that boat test name, and the status 'passed'. Either way, it should return the BoatingTest instance. 
# * Instructor#fail_student should take in a student instance and test name. Like #pass_student, it should try to find a matching BoatingTest and update its status to 'failed'. If it cannot find an existing BoatingTest, it should create one with the name, the matching student, and the status 'failed'. 
# * Instructor#all_students should return an array of students who took a boating test with this specific instructor.