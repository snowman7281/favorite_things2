require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/practice')


get('/') do
  @list = Item.clear()
  erb(:list)
end

post('/') do
  name = params["name"]
  rank = params["rank"].to_i
  item = Item.new(name, rank)
  @error = item.duplicates()
  binding.pry
  if @error == []
    item.save()
    @list = Item.all()
    erb(:list)
  else
    @list = Item.all()
    erb(:list)
  end

end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end

get('/items/:rank') do
  @item = Item.find(params[:rank])
  erb(:item)
end
