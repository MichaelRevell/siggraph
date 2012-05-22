namespace :neo4j do
  desc "Populates the database with nodes."
  task :populate  => :environment do
    user_count = 10
    belief_count = 10
    min_beliefs = 1
    max_beliefs = 5
    belief_range = max_beliefs - min_beliefs
    b = Array.new
    u = Array.new
    
    for i in 1..belief_count
      b[i] = Belief.new
      b[i].title = "Belief #{i}"
      b[i].save
      puts b[i]
    end
    
    
    for i in 1..user_count
      u[i] = User.new
      u[i].name = "User #{i}"
      u[i].save
      puts u[i]
      
      number_of_beliefs = rand(belief_range) + min_beliefs
      
      for n in 0..number_of_beliefs
        rand_belief = b[rand(belief_count - 1)+1]
        u[i].beliefs << rand_belief
        rand_belief.users << u[i]
        
        rand_belief.save
        u[i].save
        
        puts "#{u[i].name} believes in #{rand_belief.title}"
      end
    end
    
    
  end
  
  
  
  
  task :relate  => :environment do
    Belief.all.each do |b|
      b.users.all.each do |u|
        u.beliefs.all.each do |b2|
          rel = nil
          # See if relationship exists
          b.beliefs_rels.all.each do |r|
            if r.end_node.id == b2.id
              # found relationship!
              rel = r
            end
          end
          
          if rel == nil
            # Create new relationship!
            rel = b.beliefs << b2
            #rel[:strength] = 1
            puts "#{b.title} to #{b2.title}"
            rel.save
          else
            # Relationship exists! Strengthen it
            #rel[:strength] = 1 if rel[:strength] == nil
            #rel[:strength] = 8
            rel.save
            
            strength = 4 #rel[:strength]
            
            puts "#{b.title} to #{b2.title}. New strength #{strength}"
          end

        end
      end
    end
  end
  
  
  
  task :delete_users  => :environment do
    User.destroy_all
    puts "Destroyed all Users."
  end
end