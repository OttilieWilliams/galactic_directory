module Capitalizable
  extend ActiveSupport::Concern

  included do
    before_save :capitalize_attributes
  end

  def capitalize_attributes
    self.attributes.each do |attr,val|
      # if the attribute only has spaces, then this will store nil in the DB
      self.send("#{attr}=",val.strip.titleize) if self.capitalizable_attrs.include?(attr) && !val.nil?
    end    
  end
end

