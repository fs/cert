module Enumerable
  def index_and_group_by
    inject({}) do |accum, elem|
      key = yield(elem)

      accum[key] ||= []
      accum[key] << elem
      
      accum
    end
  end
end