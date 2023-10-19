# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Talks" do
  describe "#index" do
    it "renders a successful response" do
      get talks_path

      expect(response).to be_successful
    end
  end

  describe "#show" do
    it "renders a successful response" do
      talk = create(:talk)

      get talk_path(talk)

      expect(response).to be_successful
    end
  end

  describe "#new" do
    it "renders a successful response" do
      get new_talk_path

      expect(response).to be_successful
    end
  end

  describe "#edit" do
    it "renders a successful response" do
      talk = create(:talk)

      get edit_talk_path(talk)

      expect(response).to be_successful
    end
  end

  describe "#create" do
    context "with valid parameters" do
      it "creates a new talk" do
        session = create(:session)
        valid_attributes = { title: "First talk", duration: 10, lightning_talk: false, session_id: session.id }

        expect do
          post talks_path, params: { talk: valid_attributes }
        end.to change(Talk, :count).by(1)
      end

      it "redirects to the created talk" do
        session = create(:session)
        valid_attributes = { title: "First talk", duration: 10, lightning_talk: false, session_id: session.id }

        post talks_path, params: { talk: valid_attributes }

        expect(response).to redirect_to(talk_path(Talk.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new talk" do
        invalid_attributes = { title: "First talk", duration: 10, lightning_talk: false }

        expect do
          post talks_path, params: { talk: invalid_attributes }
        end.not_to change(Talk, :count)
      end

      it "renders a response with 422 status" do
        invalid_attributes = { title: "First talk", duration: 10, lightning_talk: false }

        post talks_path, params: { talk: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#update" do
    context "with valid parameters" do
      it "returns sucessful response" do
        talk = create(:talk, title: "Old title")
        new_attributes = { title: "New title" }

        put talk_path(talk), params: { talk: new_attributes }

        expect(response).to have_http_status(:ok)
      end

      it "updates the requested talk" do
        talk = create(:talk, title: "Old title")
        new_attributes = { title: "New title" }

        patch talk_path(talk), params: { talk: new_attributes }

        talk.reload

        expect(talk.title).to eq("New title")
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        talk = create(:talk, title: "Old title")

        patch talk_url(talk), params: { talk: { title: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#destroy" do
    it "destroys the requested talk" do
      talk = create(:talk)

      expect do
        delete talk_path(talk)
      end.to change(Talk, :count).by(-1)
    end

    it "redirects to the talks list" do
      talk = create(:talk)

      delete talk_path(talk)

      expect(response).to redirect_to(talks_path)
    end
  end
end
