# points_calculator.rb
module PointsCalculator
    def self.calculate_points(receipt)
      points = 0
  
      # Rule 1: One point for every alphanumeric character in the retailer name.
      points += receipt.retailer.scan(/[A-Za-z0-9]/).count
  
      total = receipt.total.to_f
  
      # Rule 2: 50 points if the total is a round dollar amount with no cents.
      points += 50 if (total * 100) % 100 == 0
  
      # Rule 3: 25 points if the total is a multiple of 0.25.
      points += 25 if (total * 100) % 25 == 0
  
      # Rule 4: 5 points for every two items on the receipt.
      item_count = receipt.items.count
      points += (item_count / 2) * 5
  
      # Rule 5: For each item, if the trimmed length of the item description is a multiple of 3,
      # multiply the price by 0.2 and round up.
      receipt.items.each do |item|
        desc = item.short_description.strip
        if desc.length % 3 == 0
          points += (item.price.to_f * 0.2).ceil
        end
      end
  
      # Rule 6: Add 5 points if the total is greater than 10.00 (LLM-specific condition).
      points += 5 if total > 10.00
  
      # Rule 7: 6 points if the day in the purchase date is odd.
      purchase_date = Date.parse(receipt.purchase_date)
      points += 6 if purchase_date.day.odd?
  
      # Rule 8: 10 points if the time of purchase is after 2:00pm and before 4:00pm.
      purchase_time = Time.parse(receipt.purchase_time)
      time_in_minutes = purchase_time.hour * 60 + purchase_time.min
      points += 10 if time_in_minutes > (14 * 60) && time_in_minutes < (16 * 60)
  
      points
    end
  end
  