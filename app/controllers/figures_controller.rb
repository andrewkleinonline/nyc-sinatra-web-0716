class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    new_figure_data = Hash.new
    new_figure_data[:name] = params[:figure][:name]
    new_figure_data[:title_ids] = !params[:figure][:title_ids] ? [] : params[:figure][:title_ids]
    new_figure_data[:landmark_ids] = !params[:figure][:landmark_ids] ? [] : params[:figure][:landmark_ids]

    if !params[:title][:name].empty?
      new_title = Title.create(name: params[:title][:name])
      new_figure_data[:title_ids] << new_title.id
    end

    if !params[:landmark][:name].empty?
      new_landmark = Landmark.create(name: params[:landmark][:name])
      new_figure_data[:landmark_ids] << new_landmark.id
    end

    Figure.create(new_figure_data)
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    new_figure_data = Hash.new
    new_figure_data[:name] = params[:figure][:name]
    new_figure_data[:title_ids] = !params[:figure][:title_ids] ? [] : params[:figure][:title_ids]
    new_figure_data[:landmark_ids] = !params[:figure][:landmark_ids] ? [] : params[:figure][:landmark_ids]

    if !params[:title][:name].empty?
      new_title = Title.create(name: params[:title][:name])
      new_figure_data[:title_ids] << new_title.id
    end

    if !params[:landmark][:name].empty?
      new_landmark = Landmark.create(name: params[:landmark][:name])
      new_figure_data[:landmark_ids] << new_landmark.id
    end

    Figure.find(params[:id]).update(new_figure_data)

    redirect "/figures/#{params[:id]}"
  end
end
