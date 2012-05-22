class Connection < Neo4j::Rails::Model
  property :strength, :type => Fixnum
  property :num, :type => Fixnum
  property :source_id, :type => Fixnum
  property :target_id, :type => Fixnum
  property :relationship_type, :type => String

end
