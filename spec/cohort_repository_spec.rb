require 'cohort_repository'
require './app'

def reset_cohorts_table
    seed_sql = File.read('spec/seeds_cohorts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
    connection.exec(seed_sql)
end
RSpec.describe CohortRepository do
    before(:each) do 
        reset_cohorts_table
    end
    it 'finds cohort 1 with related students' do
        repo = CohortRepository.new
        cohort = repo.find_with_students(1)

        expect(cohort.cohort_name).to eq 'Feb_apprentice'
        expect(cohort.students.length).to eq 2
    end
    it "output the list of albums" do
        io = double :i
        expect(io).to receive(:puts).with("Here is the list of students: \n").ordered
        cohort = CohortRepository.new
        app = Application.new('student_directory_2', io, cohort)
        expect(app.run).to eq "1 - Ray\n3 - Jay\n"
    end
end