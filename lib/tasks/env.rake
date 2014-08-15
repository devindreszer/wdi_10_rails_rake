namespace :rake_demo do

  desc "Show the Unix Environment Variables"
  task :show_env do

    # Action can run a Unix command by using 'sh'
    # 'sh' means shell
    sh 'env'
  end

  task :my_ls do
    sh 'ls -F'
  end
end
