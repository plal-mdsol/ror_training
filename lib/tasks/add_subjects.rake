require 'faker'

# namespace :hello do
#     desc "say hello" 
#     # task :process => :environment do
#     task :process do
#         puts "Hello All "
#     end
#     desc "say hello1" 
#     task :process1 do
#         puts "Hello All1 "
#     end
# end

# create a rake task to enroll given no of subjects to a study
# add 100 participant to a given study

namespace :add_subjects do
    desc "add given no. of subjects to a study" 
    # task :process => :environment do
    task :process, [:study_name, :subject_count] => :environment do |t,args|
        # binding.pry
        study = Study.find_by_name(args[:study_name])
        abort('Study not found') unless study
        puts "Adding #{args[:subject_count]} to study: #{study.name} "
        args[:subject_count].to_i.times do |i|
            subject = Subject.new(name: Faker::Name.name, age: rand(10..100))
            puts "Adding subject with #{:subject.name} to study: #{study.name} "
            subject.save
        end
        puts "Adding #{args[:subject_count]} to study: #{study.name} "
    end
end
