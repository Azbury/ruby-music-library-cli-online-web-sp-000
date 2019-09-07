module Concerns::Findable
  def find_by_name (name)
    all.detect{|s| s.name == name}
  end
end
