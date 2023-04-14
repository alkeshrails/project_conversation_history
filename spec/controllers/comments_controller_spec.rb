require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:comment_params) { { body: 'Some comment body', user_id: user.id } }

    context 'with valid params' do
      before do
        sign_in user
      end

      it 'creates a new comment' do
        expect {
          post :create, params: { project_id: project.id, comment: comment_params }
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the project show page' do
        post :create, params: { project_id: project.id, comment: comment_params }
        expect(response).to redirect_to(project)
      end

      it 'sets a success notice' do
        post :create, params: { project_id: project.id, comment: comment_params }
        expect(flash[:notice]).to eq('Comment was successfully added.')
      end
    end

    context 'with invalid params' do
      let(:invalid_comment_params) { { body: '' } }

      it 'does not create a new comment' do
        expect {
          post :create, params: { project_id: project.id, comment: invalid_comment_params }
        }.not_to change(Comment, :count)
      end
    end
  end
end
