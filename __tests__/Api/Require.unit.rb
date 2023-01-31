# Require.unit.rb

RSpec.describe "Require" do
  
      it "works with lob.rb" do
          Object.send :remove_const, :Lob
          paths = $".select do |path|
            path.include?(File.expand_path("../../lib", File.dirname(__FILE__)))
          end
          paths.each { |path| $".delete(path) }
          
          expect(defined?(Lob)).to eq(nil)
          expect(defined?(Lob::Configuration)).to eq(nil)
          
          require "lob"
          
          expect(defined?(Lob)).to eq("constant")
          expect(defined?(Lob::Configuration)).to eq("constant")
      end

end
