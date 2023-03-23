class Cohort

    # Replace the attributes by your own columns.
    attr_accessor :id, :cohort_name, :starting_dates, :students

    def initialize
        @students = []
    end
end