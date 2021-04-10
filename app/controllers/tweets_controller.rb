class TweetsController < ApplicationController

    get '/tweets' do 
        @tweets = Tweet.all
        erb :index
    end

    get 'tweets/new' do 
        erb :new
    end

    post '/tweets' do 
        @tweet = Tweet.create(content: params[:content])
        redirect to "/tweets/#{@tweet.id}"
    end

    get '/tweets/:id' do 
        @tweet = Tweet.find_by_id(params[:id])
        erb :show_tweet
    end

    get '/tweets/:id/edit' do 
        @tweet = Tweet.find_by_id(params[:id])
        erb :edit_tweet
    end 

    patch '/tweets/:id' do 
        @tweet = Tweet.find_by_id(params[:id])
        @tweet.update(params[:content])
        redirect to "tweets/#{@tweet.id}"
    end

    delete '/tweets/:id' do
        @tweet = Tweet.find_by_id[params[:id]]
        @tweet.delete
        redirect to '/tweets'
    end 

end
