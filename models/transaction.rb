class Transaction < ActiveRecord::Base
  belongs_to :product
  validate :amount_total_price_balance

  def amount_total_price_balance
    msg = <<-EOF

              (<$$$$$$>#####<::::::>)
            _/~~~~~~~~~~~~~~~~~~~~~~~~~\
          /~                             ~\
        .~                                 ~
    ()\/_____                           _____\/()
   .-''      ~~~~~~~~~~~~~~~~~~~~~~~~~~~     ``-.
.-~              __________________              ~-.
`~~/~~~~~~~~~~~~TTTTTTTTTTTTTTTTTTTT~~~~~~~~~~~~\~~'
| | | #### #### || | | | [] | | | || #### #### | | |
;__\|___________|++++++++++++++++++|___________|/__;
 (~~====___________________________________====~~~)
  \------_____________[CHIP 911]__________-------/
     |      ||         ~~~~~~~~       ||      |
      \_____/                          \_____/
  #
  
   Whooooouuuuuuu!!!
   You cannot receibe both product and money on a transaction
   You cannot lose both product and money on a transaction
    EOF
    if (amount >= 0 && total_price >= 0) ||
        (amount <= 0 && total_price <= 0)
      errors.add(:coaf, msg)
    end
  end
end
