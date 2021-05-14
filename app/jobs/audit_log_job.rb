class AuditLogJob < ApplicationJob
  queue_as :default

  def perform(*args)
    enrollment = args[0]
    study1 = enrollment.study.name
    subject1 = enrollment.subject.name
    file = File.join(File.dirname(__FILE__), 'audit.txt')
    File.open(file, 'w') {|f| f.puts "Study name = #{study1} + Subject name = #{subject1}" }
  end
end
