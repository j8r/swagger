require "../spec_helper"

describe Swagger::Controller do
  ok_response = [Swagger::Response.new "200", "OK"]

  describe "#new" do
    it "should works without any action" do
      raw = Swagger::Controller.new("Users", "User APIs")
      raw.name.should eq "Users"
      raw.description.should eq "User APIs"
      raw.actions.should eq Array(Swagger::Action).new
      raw.external_docs.should be_nil
    end

    it "should works with actions" do
      raw = Swagger::Controller.new("Users", "User APIs", [
        Swagger::Action.new("get", "/users", ok_response, "List Users"),
      ])
      raw.name.should eq "Users"
      raw.description.should eq "User APIs"
      raw.actions.should eq([Swagger::Action.new("get", "/users", ok_response, "List Users")])
      raw.external_docs.should be_nil
    end
  end
end
