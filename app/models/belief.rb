class Belief < Neo4j::Rails::Model
  index :title
  property :title, :type => String
  validates :title, :uniqueness => true
  property :description, :type => String
  
  has_n(:users)
  #has_n(:related_beliefs).to(Belief).relationship(Connection)
  #has_n(:rel_beliefs).from(Belief, :related_beliefs)
  
  has_n(:beliefs)
  #has_n(:peer, :type=> Belef)
  #has_n(:denpendencies)
  #has_n(:dependents)

  public

  def self.generate_beliefs (belief_count)
    beliefs=Array.new { }
    for i in 0..belief_count-1
      beliefs[i] = "b#{i}"
    end
    return beliefs
  end

end
