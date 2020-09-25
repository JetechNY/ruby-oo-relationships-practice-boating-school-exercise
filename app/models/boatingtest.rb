require 'pry'
class BoatingTest

    attr_accessor :student, :testname, :teststatus, :instructor
    @@all = []

    def initialize(student, testname, teststatus, instructor)
        @student = student
        @testname = testname
        @teststatus = teststatus
        @instructor = instructor
        @@all << self
    end

    def teststatus
        @teststatus
    end

    def self.all
        @@all
    end

end
# BoatingTest class: * should initialize with Student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object) * BoatingTest.all returns an array of all boating tests