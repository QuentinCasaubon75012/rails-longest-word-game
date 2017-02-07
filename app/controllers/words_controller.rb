class WordsController < ApplicationController
  def game
    @grid = Array.new(9) { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    end_time = Time.now
    start_time = DateTime.parse(params[:start_time])
    @result = params[:result]

    @final_time = end_time - start_time

    api_key = "fdcb5701-756e-4bd9-841b-cf6f021a19e3"
    # begin
    #   response = open("https://api-platform.systran.net/translation/text/translate?source=en&target=fr&key=#{api_key}&input=#{@results}")
    #   json = JSON.parse(response.read.to_s)
    #   if json['outputs'] && json['outputs'][0] && json['outputs'][0]['output'] && json['outputs'][0]['output'] != @results
    #     return json['outputs'][0]['output']
    #   end
    # rescue


    # result[:score], result[:message] = score_and_message(
    # attempt, result[:translation], grid, result[:time])

    # result

    @final_score = (@final_time > 60.0) ? 0 : @result.size * (1.0 - @final_time / 60.0)
    if correct_word?(@result) == true
      if @final_score > 0
        @message = "Well done, you are great !"
      else @final_score = 0
        @message = "You suck"
      end
    else
      @message = "you dumbshit this word doesn't exist"
    end
  end

  def correct_word?(result)
    if File.read('/usr/share/dict/words').upcase.split("\n").include? result.upcase
      return true
    else
      return nil
    end
  end
end
