#Deploy and rollback on Heroku in staging and production
task :deploy => ['deploy:push', 'deploy:restart', 'deploy:tag']

namespace :deploy do

  task :migrations => [:off, :push, :migrate, :restart, :on, :tag]
  task :production_rollback => [:off, :push_previous, :restart, :on]

  task :push do
    puts 'Deploying site to Heroku ...'
    puts `git push heroku master`
  end
  
  task :restart do
    puts 'Restarting app servers ...'
    puts `heroku restart`
  end
  
  task :tag do
    release_name = "joust_release-#{Time.now.utc.strftime("%Y%m%d%H%M%S")}"
    puts "Tagging release as '#{release_name}'"
    puts `git tag -a #{release_name} -m 'Tagged release'`
    puts `git push heroku --tags`
  end
  
  task :migrate do
    puts 'Running database migrations ...'
    puts `heroku run rake db:migrate`
  end
  
  task :off do
    puts 'Putting the app into maintenance mode ...'
    puts `heroku maintenance:on`
  end
  
  task :on do
    puts 'Taking the app out of maintenance mode ...'
    puts `heroku maintenance:off`
  end

  task :push_previous do
    prefix = "joust_release-"
    releases = `git tag`.split("\n").select { |t| t[0..prefix.length-1] == prefix }.sort
    current_release = releases.last
    previous_release = releases[-2] if releases.length >= 2
    if previous_release
      puts "Rolling back to '#{previous_release}' ..."
      
      puts "Checking out '#{previous_release}' in a new branch on local git repo ..."
      puts `git checkout #{previous_release}`
      puts `git checkout -b #{previous_release}`
      
      puts "Removing tagged version '#{previous_release}' (now transformed in branch) ..."
      puts `git tag -d #{previous_release}`
      puts `git push heroku :refs/tags/#{previous_release}`
      
      puts "Pushing '#{previous_release}' to Heroku master ..."
      puts `git push heroku +#{previous_release}:master --force`
      
      puts "Deleting rollbacked release '#{current_release}' ..."
      puts `git tag -d #{current_release}`
      puts `git push heroku :refs/tags/#{current_release}`
      
      puts "Retagging release '#{previous_release}' in case to repeat this process (other rollbacks)..."
      puts `git tag -a #{previous_release} -m 'Tagged release'`
      puts `git push --tags heroku`
      
      puts "Turning local repo checked out on master ..."
      puts `git checkout master`
      puts 'All done!'
    else
      puts "No release tags found - can't roll back!"
      puts releases
    end
  end
end