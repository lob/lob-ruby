require "bundler/gem_tasks"
require "rake/testtask"


Rake::TestTask.new do |t|
  t.libs.push "lib", "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end


namespace :dev do

  desc "Download sample files to run tests with"
  task :setup do
    Dir.mkdir("spec/samples") unless File.exist?("spec/samples")
    files = [
      {url: "https://s3-us-west-2.amazonaws.com/lob-assets/postcardfront.pdf", name: "postcardfront.pdf"},
      {url: "https://s3-us-west-2.amazonaws.com/lob-assets/postcardback.pdf",  name: "postcardback.pdf"},
      {url: "https://s3-us-west-2.amazonaws.com/lob-assets/test.pdf",          name: "test.pdf"}
    ]
    files.each do |f|
      system "curl #{f[:url]} -o spec/samples/#{f[:name]}"
    end

  end
end
