class Report
  attr_reader :credits, :debits, :balance
  def initialize(ledger)
    @balance = ledger.inject(0) {|sum, (k,v)| sum + v }
    @credits, @debits = ledger.partition {|k,v| v > 0}
  end
  
  def formatted_output
    "Current Balance: #{balance}\n\n" +
    "Credits:\n\n#{formatted_line_items(credits)}\n\n" +
    "Debits:\n\n#{formatted_line_items(debits)}"
  end

  def formatted_line_items(items)
    items.map {|k,v| "#{k}: #{'%.2f' % v.abs}"}.join("\n")
  end
end
