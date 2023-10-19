# frozen_string_literal: true

class TalksController < ApplicationController
  before_action :talk, only: %i[show edit destroy]

  def index
    result = Talks::List.result.talks

    @talks = result
  end

  def show
    @talk = talk
  end

  def new
    @talk = Talk.new
  end

  def edit; end

  def create
    result = Talks::Create.result(attributes: talk_params)

    if result.success?
      @talk = result.talk

      redirect_to @talk
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = Talks::Update.result(id: params[:id], attributes: talk_params)

    if result.success?
      redirect_to talk_path(result.talk), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    talk.destroy!

    redirect_to talks_path, status: :see_other
  end

  def import
    result = Talks::CreateFromFile.result(file: params[:file])
  end

  private

  def parse_talk_attributes(line)
    match = line.match(/(\d+)min/)

    if match
      duration = match[1].to_i

      title = line.sub(match[0], "").strip

      { title: title, duration: duration, lightning_talk: false }
    else
      { title: line, duration: 5, lightning_talk: true }
    end
  end

  def talk
    @talk ||= Talks::Find.result(id: params[:id]).talk
  end

  def talk_params
    params.require(:talk).permit(:title, :duration, :lightning_talk, :session_id).to_h
  end
end
