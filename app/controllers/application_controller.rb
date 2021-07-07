class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #INDEX action/method
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  #NEW action/method
  get "/recipes/new" do 
    erb :new 
  end 

  #SHOW action/method
  get "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #CREATE action/method
  post "/recipes" do 
    recipe = Recipe.create(params)

    redirect to "/recipes/#{recipe.id}"
  end

  #EDIT action/method
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  #UPDATE action/method
  patch  "/recipes/:id" do 
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])

    redirect to "/recipes/#{recipe.id}"
  end

  #DELETE action/method
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete

    redirect to "/recipes"
  end

end
