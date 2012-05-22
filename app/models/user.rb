class User < Neo4j::Rails::Model
  index :name
  
  property :name, :type => String
  validates :name, :uniqueness => true
  
  has_n(:beliefs)


end
