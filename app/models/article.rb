class Article < ActiveRecord::Base

  attr_accessible :name, :city, :street, :extra, :published_at


  def self.text_search(query, ad_type)
    if query.present?

      case ad_type
      when "name"
  puts query
      rank = <<-RANK
      ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize_sql_array(query)}))
    RANK
      where("to_tsvector(name) @@ plainto_tsquery(:q)", q: query)

      when "phone"

        rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize_sql_array(query)}))
      RANK
        where("to_tsvector('english', jsonb_path_query_array(extra, '$.**.phone')::text) @@ plainto_tsquery(:q)", q: query);

      when "website" || "contact_website"
        rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize_sql_array(query)}))
      RANK
        where("to_tsvector('english', jsonb_path_query_array(extra, '$.**.website')::text) @@ plainto_tsquery(:q) or to_tsvector('english', jsonb_path_query_array(extra, '$.**.contact_website')::text) @@ plainto_tsquery(:q)", q: query);
      end
      
       else
      all

    end




  end

end