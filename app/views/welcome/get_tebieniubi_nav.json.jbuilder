json.array!(@nav_menu) do |menu|
  json.extract! menu, :id, :title
end