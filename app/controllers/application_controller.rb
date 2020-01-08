class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    Recipe.create(params)
    redirect to "/recipes/#{Recipe.last.id}"
  end
  
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch  "/recipes/:id" do 
    recipe = Recipe.find(params[:id])
    recipe.update(params)

    redirect to "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.destroy 

    redirect to "/recipes"
  end

end
