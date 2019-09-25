
def set_returns_flags(company_id:, returns_store_id:)
  c = Company.find(company_id)        # raises error if not found
  m = Merchant.find(returns_store_id) # raises error if not found
  if m.company_id != c.id
    puts "Portal merchant (#{returns_store_id}, #{m.store_name}), does not belong to company (#{company_id}, #{c.name})"; return
  end
  c.update_columns(customer_initiated_returns: true)
  puts "Company activated for returns... #{c.id}, #{c.name}, returns=#{c.reload.customer_initiated_returns}"
  m_updated = 0
  c.merchants.each do |m|
    m.update_columns(customer_initiated_returns_processing: true)
    if m.id == returns_store_id
      m.update_columns(customer_initiated_returns_store: true)
      puts "Returns store = #{m.id}, #{m.store_name}"
    end
    m_updated += 1
  end
  puts "#{m_updated} merchants updated..."
  c.merchants.each {|m| puts "#{m.id} #{m.store_name}, processing=#{m.customer_initiated_returns_processing?}, returns store=#{m.customer_initiated_returns_store?}" }; nil
end

# Staging
set_returns_flags(company_id: 42, returns_store_id: 1276) # PUMA
set_returns_flags(company_id: 43, returns_store_id: 1403) # TAF

# Production
set_returns_flags(company_id: 123, returns_store_id: 5185) # PUMA
set_returns_flags(company_id:  74, returns_store_id: 5583) # TAF




