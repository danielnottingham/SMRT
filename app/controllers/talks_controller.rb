# frozen_string_literal: true

class TalksController < ApplicationController
  before_action :talk, only: %i[show edit destroy]

  def index
    result = Talks::List.result.talks

    @talks = result
  end

  def show
    render talk
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
      redirect_to result.talk, status: :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    talk.destroy!

    redirect_to talks_path, status: :see_other
  end

  private

  def talk
    @talk ||= Talks::Find.result(id: params[:id]).talk
  end

  def talk_params
    params.require(:talk).permit(:title, :duration, :lightning_talk, :session_id).to_h
  end
end
