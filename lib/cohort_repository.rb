require_relative "cohort"
require_relative "student"

class CohortRepository
    def find_with_students(id)
        # Executes the SQL query:
        sql = 'SELECT cohorts.id, cohorts.cohort_name, cohorts.starting_dates, students.id AS students_id, students.name, students.cohort_id FROM cohorts JOIN students ON students.cohort_id = cohorts.id WHERE cohorts.id = $1;'
        params = [id]
        results = DatabaseConnection.exec_params(sql, params)

        cohort = Cohort.new
        cohort.id = results.first['id']
        cohort.cohort_name = results.first['cohort_name']
        cohort.starting_dates = results.first['starting_dates']

        results.each do |record|
            student = Student.new
            student.id = record['id']
            student.students_id = record['students_id']
            student.name = record['name']
            student.cohort_id = record['cohort_id']
      
            cohort.students << student
          end
      
          return cohort
      end
end