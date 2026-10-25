namespace :auth do
  desc 'Delete expired browser sessions'
  task prune_sessions: :environment do
    puts "Deleted #{AuthSession.prune_expired!} expired sessions"
  end
end
