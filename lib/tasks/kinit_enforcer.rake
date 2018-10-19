desc 'my plugins rake task'
task :do_kinit_enforce do
  puts "Scanning..."
  gen = Kinit::GemsEnforcer.new
  gen.CheckIsGemPresent
end
