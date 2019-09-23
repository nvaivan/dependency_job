require_relative '../job_sequence'

describe JobSequence do

  it "shows jobs can't depend on themselves" do

    dependencies = {

      'a' => nil,

      'b' => nil,

      'c' => 'c',

    }

    expect(JobSequence.job_sequence(dependencies)).to eq("jobs can't depend on themselves")

  end


  it "shows jobs can't have circular dependencies" do

    dependencies = {

      'a' => nil,

      'b' => 'c',

      'c' => 'f',

      'd' => 'a',

      'e' => nil,

      'f' => 'b',

    }

    expect(JobSequence.job_sequence(dependencies)).to eq("jobs can't have circular dependencies")

  end

  it 'returns jobs sequence' do

    dependencies1 = {

      'a' => nil,

    }

    expect(JobSequence.job_sequence(dependencies1)).to eq(['a'])


    dependencies2 = {

      'a' => nil,

      'b' => nil,

      'c' => nil,

    }

    expect(JobSequence.job_sequence(dependencies2)).to eq(['a', 'b', 'c'])

    dependencies3 = {

      'a' => nil,

      'b' => 'c',

      'c' => nil,

    }

    expect(JobSequence.job_sequence(dependencies3)).to eq(['a', 'c', 'b'])

    dependencies4 = {

      'a' => nil,

      'b' => 'c',

      'c' => 'f',

      'd' => 'a',

      'e' => 'b',

      'f' => nil,

    }

    expect(JobSequence.job_sequence(dependencies4)).to eq(['a', 'd', 'f', 'c', 'b', 'e'])

  end

end