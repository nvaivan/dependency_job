class JobSequence

  def self.job_sequence(dependencies)

    result = dependencies.select{|_,v| v.nil? }.keys # independent jobs

    dependencies.reject!{ |_,v| v.nil? }

    dependencies.each do |job1, job2|

      # job1 depends to job2

      return 'jobs can\'t depend on themselves' if job1 == job2

      result << job2 unless result.include? job2

      job1_index = result.index(job1)

      job2_index = result.index(job2)

      if job1_index

        if job2_index > job1_index # job2 already depends to job1

          return 'jobs can\'t have circular dependencies'

        end

      else

        result.insert(job2_index + 1, job1)

      end

    end


    result

  end

end


# dependencies = {

#   'a' => nil,

# }

# puts "#{JobSequence.job_sequence(dependencies)}"


# dependencies = {

#   'a' => nil,

#   'b' => nil,

#   'c' => nil,

# }

# puts "#{JobSequence.job_sequence(dependencies)}"


# dependencies = {

#   'a' => nil,

#   'b' => 'c',

#   'c' => nil,

# }

# puts "#{JobSequence.job_sequence(dependencies)}"


# dependencies = {

#   'a' => nil,

#   'b' => 'c',

#   'c' => 'f',

#   'd' => 'a',

#   'e' => 'b',

#   'f' => nil,

# }

# puts "#{JobSequence.job_sequence(dependencies)}"


# dependencies = {

#   'a' => nil,

#   'b' => nil,

#   'c' => 'c',

# }

# puts "#{JobSequence.job_sequence(dependencies)}"


# dependencies = {

#   'a' => nil,

#   'b' => 'c',

#   'c' => 'f',

#   'd' => 'a',

#   'e' => nil,

#   'f' => 'b',

# }

# puts "#{JobSequence.job_sequence(dependencies)}"