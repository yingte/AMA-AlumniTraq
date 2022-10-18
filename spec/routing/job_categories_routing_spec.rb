# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(JobCategoriesController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/job_categories').to(route_to('job_categories#index'))
    end

    it 'routes to #new' do
      expect(get: '/job_categories/new').to(route_to('job_categories#new'))
    end

    it 'routes to #show' do
      expect(get: '/job_categories/1').to(route_to('job_categories#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/job_categories/1/edit').to(route_to('job_categories#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/job_categories').to(route_to('job_categories#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/job_categories/1').to(route_to('job_categories#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/job_categories/1').to(route_to('job_categories#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/job_categories/1').to(route_to('job_categories#destroy', id: '1'))
    end
  end
end
