desc 'my plugins rake task'
task :do_kinit_enforce do
  puts "Enforcing best practices."
  @gen = Kinit::GemsEnforcer.new
  @gen.CheckIsGemPresent 
end