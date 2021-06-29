class Company < ApplicationRecord
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
             month3 = row.field('extra').gsub("=>", ":")
             data = JSON.parse month3

            data3 = {}
            data3["phone"] = data['phone']
            data3["website"] = data['website']
            data3["contact_website"] = data['contact_website']
     
            data4 = {}
            data4["name"] = row.field('name').gsub(/[^a-zA-ZÀ-ÿ ]/, "").gsub(/ +/, ' ').lstrip
            data4["city"] = row.field('city')
            data4["street"] = row.field('street')
            data4["extra"] = data3
            puts data4["name"]
            Article.create! data4.to_hash   
        end
    end    
end
