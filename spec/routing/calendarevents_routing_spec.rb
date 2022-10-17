require "rails_helper"

RSpec.describe CalendareventsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/calendarevents").to route_to("calendarevents#index")
    end

    it "routes to #new" do
      expect(get: "/calendarevents/new").to route_to("calendarevents#new")
    end

    it "routes to #show" do
      expect(get: "/calendarevents/1").to route_to("calendarevents#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/calendarevents/1/edit").to route_to("calendarevents#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/calendarevents").to route_to("calendarevents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/calendarevents/1").to route_to("calendarevents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/calendarevents/1").to route_to("calendarevents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/calendarevents/1").to route_to("calendarevents#destroy", id: "1")
    end
  end
end
