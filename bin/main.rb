require_relative '../config/environment'
require 'pry'
class Main

    def self.run
        list_products
        # table_print_products
    end

    def self.list_products
        system "clear"
        product_header("Product List")
        product_h = {}
        product_sorted = Product.all.sort_by {|p| p.name.downcase}
        products = product_sorted.map do |product| 
            product_h['%-6s|' % product.id + '%3s' % "" +
                 '%-18s|' % product.name.truncate(15) + '%2s' % "" +
                 '%-26s|' % product.description.truncate(20) + '%2s' % "" +
                 '%-11s|' % product.condition + '%2s' % "" +
                 '%11s' % num_format(product.price)] = product.id
        end
        product_selection = prompt.select(" ",product_h, per_page: 15)
       
        empty_lines(2)
        puts "You selected product with ID: #{product_selection}"
        empty_lines(2)
        # sleep(2)
        # run
    end

    def self.table_print_products
        system "clear"
        tp Product.all.sort_by {|p| p.name.downcase}, :id, :name, :description, :condition, :price
        empty_lines(3)
    end

    def self.num_format(num)
        num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end

    def self.product_header(message)
        centralize_text(message)
        puts "--------+---------------------+----------------------------+-------------+-------------+"
        puts "|  ID   |      Name           |         Description        |  Condition  |   Price $   |"
        puts "--------+---------------------+----------------------------+-------------+-------------+"
    
    end
    def self.centralize_text(string)
        base = "======================================================================================"
        margin = (base.length - string.length) /2
        puts " " * margin + string
    end

    def self.empty_lines(number)
        c_number = number.to_i
        c_number.times {puts ""}
    end

    private
    def self.prompt
        @@prompt ||= TTY::Prompt.new
    end

end

