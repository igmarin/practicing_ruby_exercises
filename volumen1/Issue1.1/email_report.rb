require 'date'
require_relative 'report'

class EmailReport < Report
  def header
    "Dear Valued Customer,\n\n"+
    "This report shows your account activity as of #{Date.today}\n"
  end
  def banner
    "\n............................................................\n"
  end
  def formatted_output
    header + banner + super + banner + footer
  end
  def footer
    "\nWith Much Love,\nYour Faceless Banking Institution"
  end
end

if __FILE__ == $0
  ledger = [["Deposit Check #123", 500.15],
            ["Fancy Shoes",       -200.25],
            ["Fancy Hat",          -54.40],
            ["ATM Deposit",       1200.00],
            ["Kitteh Litteh",       -5.00]]

  report = EmailReport.new(ledger)
  puts report.formatted_output
end
