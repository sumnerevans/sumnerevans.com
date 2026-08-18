---
title: Plain Text Accounting is Pretty Cool
date: 2026-08-15T06:25:00-06:00
categories:
  - Money
tags:
  - Plain Text
  - Accounting
  - Double-Entry Bookkeeping
  - Personal Finance
  - hledger
---

I like to keep track of my finances pretty religiously. I don't really budget, I
am just very obsessive about tracking every expense, and ensuring that my
overall savings rate is high[^1]. I started by using Mint (may it rest in peace)
and when it got killed, I switched to
[Rocket Money](https://www.rocketmoney.com/). Eventually I got annoyed with that
due to it not supporting connections to some of my accounts and I ended up
keeping track of my finances manually in markdown files in a git repo for a few
years.[^2] Last year, I started using [Origin](https://useorigin.com/), which
was pretty good. However, recently I started looking for a new solution due to a
few reasons:

[^1]: My gross savings rate is over 35%, and my after-tax savings rate is
    approaching 50%.

[^2]: I built some basic automations for doing things like summing expenses by
    category, but they were very primitive and everything was very manual.

1. Origin (like Rocket Money and Mint before it) has issues staying connected to
   all my accounts reliably. I consider periodically unreliable connections to
   be significantly more annoying than having to do manual entry of every
   financial transaction.
1. Origin does not handle closed accounts very well (closed credit cards/bank
   accounts/loans).
1. Origin does not allow me to track gross income and count payroll deductions
   towards my 401(k) as savings. As someone who is fortunate enough to be able
   to max out my 401(k), this really affects my monthly savings rate
   calculations.
1. One of the benefits that is included in the Origin subscription is free tax
   returns. However, they don't support one of the situations that I had this
   year, so I wasn't able to take advantage of that service and ended up having
   to pay for a different service anyway.
1. Origin keeps trying to AI-ify everything. I've tried asking questions of the
   AI for various financial situations, but its responses have been kinda
   obvious and uninsightful at best. I already pay $20/mo for a Claude
   subscription which has actually been more helpful with sorting out a few
   weird financial situations I've found myself in the last year.

In addition, I wanted to convert my personal finances to use
[double-entry bookkeeping](https://en.wikipedia.org/wiki/Double-entry_bookkeeping)
for learning purposes. Double-entry bookkeeping is slightly unintuitive if you
are unfamiliar with it (as I was when I started this journey), but once you get
used to it, it's pretty straightforward. I'm going to assume in the rest of this
post that you have a basic understand of double-entry bookkeeping.

I briefly considered moving back to markdown files, and using AI to help me
build better automation of the monthly net worth calculations (which was the
most annoying part of the markdown file method). I asked Claude to do some
research into best practices, and it surfaced an option that I hadn't even heard
of: plain text accounting.

## Plain Text Accounting

[Plain Text Accounting](https://plaintextaccounting.org/) (PTA) is an umbrella
term for storing accounting data with plaintext files. This can get tedious (as
I discovered from my years of using markdown files) so plain text accounting
generally is also associated with using software tools to modify and report on
the underlying plaintext files. Most plain text accounting programs use
double-entry accounting at their core.

Of course, since it's plain text, you don't need to use any tools at all or you
can easily create your own tooling. You can use a simple text editor to edit the
source files. You can create custom programs to manipulate or report on your
financial data. You can even take advantage of the fact that plain text is
AI-native and use something like Claude Code to analyse your finances for
insights.

Plain text also has the advantage that you can easily store the files in source
control. In my case, I use a git repo that stores all my financial data.

After some further research, I landed on using [hledger](https://hledger.org/).
It's written in Haskell, seems very well supported by the community, has
built-in tools for importing transaction CSVs, and I like its journal file
format.

In hledger, you create journal files to record journal entries (transactions)
with a fairly straightforward syntax. Here is an example journal entry:

```ledger
2026-08-09 * XCEL ENERGY
    liabilities:credit-cards:capitalone:venturex   -$80.00  ; date:2026-08-10
    expenses:home:utilities                         $80.00
```

On the first line, we have the transaction date, a `*` indicating that the
transaction has posted, and a transaction description. The subsequent lines are
the entries that constitute the transaction. Since this is double-entry
accounting, the entries must always sum to zero[^3] and hledger checks this as
it reads the journal. In this case, we are taking money out of the liability
account for my VentureX credit card and applying it towards the utilities
account.

[^3]: The money has to go from somewhere to somewhere else; it can't just
    disappear or appear out of nowhere.

The `hledger` program parses the file, and allows you to generate useful reports
such as showing a net worth breakdown via the `balance` command or a spending
breakdown via the `incomestatement` command. Each of these commands can be
scoped to a certain date range and/or show trends over time.

That's the essence of hledger. As I've converted to this system, I've discovered
additional things that it helps with, some of which I didn't even know I wanted
it to do! Below, in no particular order, is a series of things which I like
about the system.

## Multi-Account Transactions

Transactions can have more than two accounts. This is particularly helpful for
tracking transactions where multiple payment methods are used or where there is
a mix of expense categories. The most common instance of this situation is
Amazon transactions where I apply Prime rewards points or a gift card against
the total. Here is an example transaction which demonstrates this:

```ledger
2026-08-10 * Amazon
    expenses:home:decor                           $37.99  ; Shoe Bench
    expenses:shopping:tech                         $5.99  ; USB Cables
    expenses:taxes:sales                           $2.20
    expenses:taxes:delivery-fee                    $0.31
    assets:gift-cards:amazon                     -$17.59
    income:rewards:amazon-prime                   -$6.29
    liabilities:credit-cards:chase:amazon-prime  -$22.61
```

In this transaction, I bought two items from Amazon, which applied to two
different expense categories, and was charged sales tax and the
[Colorado Retail Delivery Fee](https://tax.colorado.gov/retail-delivery-fee). I
paid with a combination of the remainder of my Amazon gift card balance, rewards
from my credit card, and my Amazon credit card.

## Commodities + Pricing Information

Assets and transactions can be tracked in terms of units of stock and currency
while also being able to have dollar-denominated value calculations. In fact,
there is nothing special about `$` in hledger; it's just a commodity (albeit
with a special-case syntax) declared in a journal alongside other commodities:

```ledger
commodity $0.00
commodity 0.000 VOO  ; Vanguard S&P 500 ETF
```

Transactions can then transact the commodities directly:

```ledger
2026-08-03 * YOU BOUGHT VANGUARD INDEX FUNDS S&P 500 ETF USD (VOO) (Cash)
    assets:retirement:ira:roth:fidelity      -$10,450.65
    assets:retirement:ira:roth:fidelity:VOO        15.000 VOO  @@  $10,450.65
```

The `@@` syntax allows you to specify the total cost-basis of the 15 VOO
shares[^4].

[^4]: Technically, the `@@` syntax is a shorthand for additional equity
    postings. See https://hledger.org/1.52/hledger.html#costs for details.

But 15 VOO is not very helpful unless you know its market value denominated in
dollars. hledger solves this by providing the ability to augment the commodities
with pricing information from currency exchange rates or market value. I can add
`P` (price) directives to track the price of VOO in terms of dollars.

```ledger
; ...
P 2026-08-12 VOO $710.1699829101562
P 2026-08-13 VOO $714.9500122070312
P 2026-08-14 VOO $713.6099853515625
; ...
```

All of the hledger commands allow you to report in terms of either the
underlying commodities or the value of said commodities.

## Multi-File Journals

Depending on how complicated your financial situation is, there may be lots of
accounts and commodities to keep track of. Luckily, you can split the journal
into separate files and `include` additional journal files. I've created one
journal file per account so that I can view the history of a single account in a
single file, which makes it easy to maintain on an ongoing basis.

This organisation structure does present a challenge, though: which account file
should transactions related to transfers between accounts (credit card payments,
bank transfers, etc.) go in? That is where the next feature (that I didn't even
know I needed) comes in.

## Transfer Tracking

One of the biggest issues that I've had in the past with tracking finances is
tracking how money is moving between my accounts. Often, a bank transfer may
take days to settle, and I want to have visibility into when it left one bank
and when it landed in another. The solution is an `equity:transfers` account
representing the asset in transition. (For reasons that still don't entirely
make sense to me, suspense accounts such as this are "equity" in double-entry
accounting. I've been told that it's just convention.) For example, when I pay
for my CapitalOne credit card, money moves from my checking account to pay down
my liabilities:

In the checking account journal file:

```ledger
2026-08-14 * DIRECT DEBIT CAPITAL ONE CRCARDPMT (Cash)
    assets:cash:fidelity:checking  -$1,226.98
    equity:transfers                $1,226.98
```

and in the credit card journal file:

```ledger
2026-08-14 * CAPITAL ONE AUTOPAY PYMT
    liabilities:credit-cards:capitalone:venturex   $1,226.98
    equity:transfers                              $-1,226.98
```

This allows both journal files to maintain a linear history that individually
looks like the statements that I get from those accounts while keeping
everything balanced.

This point is more a feature of double-entry bookkeeping than of hledger, but
having an automated tool makes this level of accounting rigour bearable.

## Reimbursable Expense Tracking

Transfers are not the only place where intermediate accounts are useful. Another
example is keeping track of reimbursable expenses. I created an
[accounts receivable](https://en.wikipedia.org/wiki/Accounts_receivable) account
for expense reimbursements from
[my job at Can/Am]({{<ref"../../portfolio/index.md#experience-canam-tech-lead">}}):
`assets:accounts-receivable:expense-reimbursement:canam`. This account
represents the amount I'm floating for work-related expenses. It is an asset
because it represents money that I am owed. Using this account allows work
expenses to never show up as an expense on my books. Let me demonstrate this
with an example:

When I pay for travel expenses to visit a client with my personal credit card,
instead of it showing up as a transaction against `expenses:travel`, it becomes
an asset (future income):

```ledger
2025-06-23 * COT*FLT  ; DEN <-> CLT
    liabilities:credit-cards:capitalone:venturex            $-619.17  ; date:2025-06-24
    assets:accounts-receivable:expense-reimbursement:canam   $619.17

; ... other travel expenses
```

Then, some time in the future after I submit my expense report and get
reimbursed for the travel expenses, the asset is converted into cash in my
checking account:

```ledger
2025-07-10 * DIRECT DEPOSIT CAN-AM TECH VENDOR (Cash)
    assets:cash:fidelity:checking                            $1,288.24
    assets:accounts-receivable:expense-reimbursement:canam  $-1,288.24
```

Previously, when using other systems, I would record the reimbursable expenses
as "travel" expenses, and the reimbursement as a negative expense against the
same category. This approach had two major problems which this system fixes:

1. **Reimbursements across month boundaries look weird.** In one month, I would
   have a large positive "travel" expense, and the next month I'd have a large
   negative "travel" expense representing the refund.
2. **The reimbursement covered multiple expense categories.** Expenses were
   recorded against sub-categories such as "flights", "lodging", and "food", but
   the reimbursement was a single dollar amount.

   This meant that I either had to split the reimbursement by subcategory, or
   just deal with the fact that the expenses and subsequent reimbursement only
   zero out at the top-level category. I found it easiest to just do the latter,
   which was a rather unsatisfactory result.

Now, the real capital outflow is recorded (so I still keep track of every
transaction on my credit card), but it is not an "expense". Instead, it
immediately becomes an asset, which will eventually be converted to cash in my
bank account.

## Balance Assertions

hledger allows you to specify expected balances on accounts via
[balance assertions](https://hledger.org/1.52/hledger.html#balance-assertions).
For example, if I know that my Venmo balance should be $82 after getting
reimbursed for food by a friend, then I can add a balance assertion like so:

```ledger
2026-07-06 * Chicken Tikka masala
    assets:cash:venmo           $32.00  =  $82.00  ; assert the resulting account balance is $82
    expenses:food:restaurants  $-32.00
```

If the balance that is calculated by hledger by replaying all of the
transactions differs from the asserted balance, hledger surfaces that
discrepancy:

```plain
$ hledger check
hledger: Error: /path/to/venmo.journal:10:40
   | 2026-07-06 * Chicken Tikka masala
10 |     assets:cash:venmo                  $32.00 = $82
   |                                               ^^^^^
   |     expenses:food:restaurants         $-32.00

Balance assertion failed in assets:cash:venmo
In commodity $ at this point, excluding subaccounts, ignoring costs,
the asserted balance is:           $82
but the calculated balance is:  $95.43
(difference: $-13.43)
To troubleshoot, check this account's running balance with assertions disabled, eg:
hledger reg -I 'assets:cash:venmo$' cur:'$'
```

You can also do balance assertions in transactions that don't even have any
money moving around. For example, if you get an end-of-month statement from your
bank, you can record the balance assertions:

```ledger
2026-07-31 * End-of-Month Balances Based on Account Statements
    assets:cash:checking  0  =   $1,927.79
    assets:cash:savings   0  =  $10,000.00
```

Alternatively, if you ever get to a point where balances get out of sync with
reality and you don't want to figure out where the mistake happened, you can use
balance assertions to correct your amounts going forward:

```ledger
2026-07-31 * End-of-Month Balance Corrections
    asets:cash:checking   =$1,930.00
    asets:cash:savings   =$10,000.00
    equity:unaccounted                ; any discrepancy will be attributed to this account
```

In this example, since the amount is omitted on the balance assertion lines, the
amount is inferred as the difference between the computed amount and the
asserted amount. Then, the `equity:unaccounted` line is used to absorb any
discrepancy emerging from those assertions.

## Other Nice Features

Here are a few nice features of the `hledger` tool that didn't really fit
anywhere else in the blog post:

- [hledger can read CSVs](https://hledger.org/1.52/hledger.html#csv),
  [apply rules to them](https://hledger.org/1.52/hledger.html#csv-rules-examples),
  and [print](https://hledger.org/1.52/hledger.html#print) the data in the
  journal format. This made it very easy for me to import transactions based on
  transaction exports from my various banking institutions.
- The `hledger register` command displays all transactions (optionally scoped to
  a specific account). This was helpful during the conversion to see when things
  got out of balance.
- The `hledger check` command checks the validity of your journal. It ensures
  the transactions all sum to zero, and that the balance assertions don't have
  any issues.
- There is a browser-based UI called [hledger-web](https://hledger.org/web.html)
  that uses the journal files and presents visualisations in your browser. This
  is helpful for visualising trends like net worth over time.

## Conclusion

I've been using this system for only a few weeks, and so far I am enjoying using
it. I greatly value the benefits of plain text aided by the reporting tooling
that hledger provides. I am also happy with the switch to double-entry
accounting, which has solved many annoyances I had with previous systems. Of
course, I'm back to manually entering every transaction into my ledger, but the
amount of accounting rigour I'm able to apply to all my transactions makes it
worth it for me.

I'm still learning how to most effectively use double-entry accounting and the
hledger tool, but so far I've been able to get all of the financial reporting
and data I care about. I don't think I've been using it long enough to give it
an unequivocal endorsement. However, I think that if you (1) are as obsessive as
I am about keeping track of your finances to the last penny and (2) find having
your financial data stored in a highly readable plain text format appealing,
then you should look into plain text accounting.
