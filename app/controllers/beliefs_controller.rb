class BeliefsController < ApplicationController
  # GET /beliefs
  # GET /beliefs.json
  def index
    @beliefs = Belief.all #current_user.beliefs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @beliefs }
    end
  end
  
  def mine
    @beliefs = Belief.all
    @mine = current_user.beliefs
    @connection = Connection.new
    @users = User.all
  end
  
  def edges
    users = User.all
    @edges = Array.new
    
    
    for i in 0...users.size
      @edges += extractEdgesFromBeliefArray(i, users[i].beliefs.sort_by{|b| b.title.downcase})
    end
    
   
    @weights = @edges.uniq.map {|e| [e, (@edges.select {|ee| ee["Label"] == e["Label"]}).size ]} 
    @edges = @edges.uniq 
    for i in 0...@weights.length
      @edges[i]["Weight"] = @weights[i][1]
    end
    
    @edges = @edges.uniq
    respond_to do |format|
      format.html {render :html => @edges }# index.html.erb
      format.json { render :json => @edges }
    end
  end
  
  def extractEdgesFromBeliefArray(id, beliefs)
    edges = Array.new
    for x in 0...beliefs.length
      for y in x+1...beliefs.length
        weight = 1
        b = beliefs[x]
        b2 = beliefs[y]
        edges += ["Id" => "#{b.title}_#{b2.title}", "Label" => "#{b.title}_#{b2.title}", "Source" => b.title, "Target" => b2.title, "Weight" => weight, "Type" => "undirected"]
        x += 1
      end
    end
    return edges.uniq
  end
  
  def find_unique_edge_count(edges)
    
  end
  
  def nodes
    @beliefs = Belief.all
    
    @nodes = Array.new
    @beliefs.each do |b|
      @nodes += ["Id" => b.title, "Label" => b.title, "Believers" => b.rels.size/2, "Description" => "Description"]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @nodes }
    end
  end
  

  # GET /beliefs/1
  # GET /beliefs/1.json
  def show
    @belief = Belief.find(params[:id])
    #@belief = Belief.first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @belief }
    end
  end

  # GET /beliefs/new
  # GET /beliefs/new.json
  def new
    @belief = Belief.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @belief }
    end
  end

  # GET /beliefs/1/edit
  def edit
    @belief = Belief.find(params[:id])
  end
  
  # POST /beliefs
  # POST /beliefs.json
  def create
    # if(current_user.id)
    #      @belief = Belief.find_by_title(params[:title]) 
    #      
    #      if @belief == nil
        @belief = Belief.new(params[:belief])
        # current_user.beliefs << @belief
        #         @belief.users << current_user
        #         current_user.update
      
        respond_to do |format|
          if @belief.save
            format.html { redirect_to @belief, :notice => 'Belief was successfully created.' }
            format.json { render :json => @belief, :status => :created, :location => @belief }
          else
            format.html { render :action => "new" }
            format.json { render :json => @belief.errors, :status => :unprocessable_entity }
          end
        end
      # else
      #        format.html { render :action => "new", :notice => 'Please Log in.' }
      #      end
      
      # else
      #         #@belief.errors << "Please go to page to add existing belief"
      #         respond_to do |format|
      #           format.html { render :action => "new" }
      #           format.json { render :json => @belief.errors, :status => :unprocessable_entity }
      #         end
      #       end
  end

  # PUT /beliefs/1
  # PUT /beliefs/1.json
  def update
    @belief = Belief.find(params[:id])

    respond_to do |format|
      if @belief.update_attributes(params[:belief])
        format.html { redirect_to @belief, :notice => 'Belief was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @belief.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /beliefs/1
  # DELETE /beliefs/1.json
  def destroy
    @belief = Belief.find(params[:id])
    @belief.destroy

    respond_to do |format|
      format.html { redirect_to beliefs_url }
      format.json { head :no_content }
    end
  end
  
  def existing
     @beliefs = Belief.all
     #@non_beliefs = current_user.beliefs
     
     # Beliefs you don't hold
     #@beliefs = @beliefs - @non_beliefs
  end
  
  def add
     @belief = Belief.find(params[:id])
     current_user.beliefs << @belief
     

     respond_to do |format|
       if @belief.update
         format.html { redirect_to @belief, :notice => 'Belief was successfully added.' }
         format.json { head :no_content }
       else
         format.html { render :action => "edit" }
         format.json { render :json => @belief.errors, :status => :unprocessable_entity }
       end
     end
   end
   
   def display
   end
end
