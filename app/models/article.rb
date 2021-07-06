class Article < ActiveRecord::Base

  attr_accessible :name, :city, :street, :extra, :published_at
  def self.text_search(query)
    if query.present?
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize_sql_array(query)}))
      RANK
        where("to_tsvector(extra::text) @@ plainto_tsquery(:q) or to_tsvector(name) @@ plainto_tsquery(:q)", q: query)
 
       else
      all
    end




  end
end
