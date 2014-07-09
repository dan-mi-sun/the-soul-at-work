class Buyer < User 

  has_many :projects

    def find_or_create_balanced_customer(address)
    if self.balanced_customer_uri?
      buyer_fetch = Balanced::Customer.fetch(self.balanced_customer_uri)
      return buyer_fetch 
    else
      buyer = Balanced::Customer.new(
      name: self.username,
      email: self.email,
      address: {
        postal_code: address[3],
        city: address[1],
        state: address[2],
        line1: address[0],
        country_code: "US"
      }
      )
      if buyer.save
        self.update_attribute(:balanced_customer_uri, buyer.href) # Update user with the new customer url from balanced
      end
      return buyer
    end
  end

end
