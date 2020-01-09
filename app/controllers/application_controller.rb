class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

   # READ
   get '/recipes' do
    # grab all recipes
    @recipes = Recipe.all
    # loads index
    erb :index
  end
 
  # READ
  get '/recipes/new' do
    # loads new form
    erb :new
  end

  # READ
  get '/recipes/:id' do
    # finds the recipe for that id
    @recipe = Recipe.find(params[:id])
    # loads show page
    erb :show
  end

  # READ
  get '/recipes/:id/edit' do
    # finds the recipe for that id
    @recipe = Recipe.find(params[:id])
    # loads edit form
    erb :edit
  end

  # EDIT/UPDATE
  patch '/recipes/:id' do
    # updates the info based on user input
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    # redirect to page with that specific id
    redirect to "/recipes/#{ @recipe.id }"
  end

  # CREATE
  post '/recipes' do
    # creates new instance based on user input from new.erb form
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{ @recipe.id }"
  end

  # DELETE
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to "/recipes"
  end

end
