namespace :cake do

  desc "Bake a cake"
  # This bake task DEPENDS on the mix_up and go_to_store tasks
  # These dependencies MUST be run before the action is run
  task :bake => [:mix_up, :go_to_store] do
    puts "Cake is baked"
  end

  desc "Mix up ingredients"
  task :mix_up => [:add_flour, :add_eggs] do
    puts "Mix up ingredients"
  end

  task :add_flour => :go_to_store do
    puts "Add flour"
  end

  task :add_eggs => :go_to_store do
    puts "Add eggs"
  end

  task :go_to_store do
    puts "Got ingredients"
  end
end
