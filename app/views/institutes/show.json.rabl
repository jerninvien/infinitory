object @institute
attributes :name

child @departments => "children" do
  attribute :name
  child(:labs => "children") do
  	attribute :name
    node :size do |l|
      l.users.count
    end
  end
end