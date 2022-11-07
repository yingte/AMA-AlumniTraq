# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(MediaHandlesController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/media_handles').to(route_to('media_handles#index'))
    end

    it 'routes to #new' do
      expect(get: '/media_handles/new').to(route_to('media_handles#new'))
    end

    it 'routes to #show' do
      expect(get: '/media_handles/1').to(route_to('media_handles#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/media_handles/1/edit').to(route_to('media_handles#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/media_handles').to(route_to('media_handles#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/media_handles/1').to(route_to('media_handles#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/media_handles/1').to(route_to('media_handles#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/media_handles/1').to(route_to('media_handles#destroy', id: '1'))
    end
  end
end
