require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @projects with user\'s projects' do
      project1 = FactoryBot.create(:project, user: @user)
      project2 = FactoryBot.create(:project, user: @user)
      get :index
      expect(assigns(:projects)).to eq([project1, project2])
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      project = FactoryBot.create(:project, user: @user)
      get :show, params: { id: project.id }
      expect(response).to render_template(:show)
    end

    it 'assigns @project with the correct project' do
      project = FactoryBot.create(:project, user: @user)
      get :show, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
    end

    it 'assigns a new Comment object to @comment' do
      project = FactoryBot.create(:project, user: @user)
      get :show, params: { id: project.id }
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it 'assigns @comments with project\'s comments' do
      project = FactoryBot.create(:project, user: @user)
      comment1 = FactoryBot.create(:comment, project: project, user: @user)
      comment2 = FactoryBot.create(:comment, project: project, user: @user)
      get :show, params: { id: project.id }
      expect(assigns(:comments)).to eq([comment1, comment2])
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Project object to @project' do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new project' do
        expect {
          post :create, params: { project: { name: 'Test Project', status: 'draft' } }
        }.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        post :create, params: { project: { name: 'Test Project', status: 'draft' } }
        expect(response).to redirect_to(Project.last)
      end

      it 'sets a success notice' do
        post :create, params: { project: { name: 'Test Project', status: 'draft' } }
        expect(flash[:notice]).to eq('Project was successfully created.')
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the project' do
        project = FactoryBot.create(:project, user: @user)
        patch :update, params: { id: project.id, project: { name: 'Updated Project' } }
        project.reload
        expect(project.name).to eq('Updated Project')
      end

      it 'redirects to the updated project' do
        project = FactoryBot.create(:project, user: @user)
        patch :update, params: { id: project.id, project: { name: 'Updated Project' } }
        expect(response).to redirect_to(project)
      end

      it 'sets a success notice' do
        project = FactoryBot.create(:project, user: @user)
        patch :update, params: { id: project.id, project: { name: 'Updated Project' } }
        expect(flash[:notice]).to eq('Project was successfully updated.')
      end
    end

    context 'with invalid params' do
      it 'renders the edit template' do
        project = FactoryBot.create(:project, user: @user)
        patch :update, params: { id: project.id, project: { name: '' } }
        expect(response).to render_template(:edit)
      end

      it 'does not update the project' do
        project = FactoryBot.create(:project, user: @user)
        original_name = project.name
        patch :update, params: { id: project.id, project: { name: '' } }
        project.reload
        expect(project.name).to eq(original_name)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the project' do
      project = FactoryBot.create(:project, user: @user)
      expect {
        delete :destroy, params: { id: project.id }
      }.to change(Project, :count).by(-1)
    end

    it 'redirects to projects index' do
      project = FactoryBot.create(:project, user: @user)
      delete :destroy, params: { id: project.id }
      expect(response).to redirect_to(projects_url)
    end

    it 'sets a success notice' do
      project = FactoryBot.create(:project, user: @user)
      delete :destroy, params: { id: project.id }
      expect(flash[:notice]).to eq('Project was successfully destroyed.')
    end
  end
end
