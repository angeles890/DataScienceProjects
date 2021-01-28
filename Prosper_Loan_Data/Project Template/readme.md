# Prosper Loan Data Exploration
## by Andrew Angeles


## Dataset

> The dataset consisted of records for 113,937 loans originated on the Prosper platform. The attributes included original loan amount, borrower's Prosper rating, loan term, borrower's stated monthly income, as well as many other features such as borrower's employment status, debt to income ratio, current loan status etc. The dataset can be downloaded <a href="https://s3.amazonaws.com/udacity-hosted-downloads/ud651/prosperLoanData.csv&sa=D&ust=1554486256021000">here</a>, and the data documentation can be found <a href="https://docs.google.com/spreadsheet/ccc?key%3D0AllIqIyvWZdadDd5NTlqZ1pBMHlsUjdrOTZHaVBuSlE%26usp%3Dsharing&sa=D&ust=1554486256024000">here</a>


## Summary of Findings

> In this exercise I found that generally speaking, lower rates of bank card utilization and/or lower debt to income ratios were associated with better final loan outcomes, even after accounting for Prosper Score. Conversely, a higher proportion of loans ended in default or charge off (investor loss) when borrowers showed a higher rate of bank card utilization and/or higher debt to income ratio. This relationship held mostly true even after controlling for the effects of low and high Prosper Score as the universe was divided into two roughly equal bins of loans with a Prosper Score 6 and below, and those with a Prosper Score of 7 or above. There was a noted exception when reviewing the relationship between low vs high bank card utilization for the bottom half of the Prosper Score group; the relationship was flat as there was no noticeable difference in loan outcomes between the bottom and top quartile of bank card utilization groups.


## Key Insights for Presentation

> For the presentation I focused on variables that showed some effect on overall loan outcome, namely bank card utilization and debt to income ratio. It was found that for the lower quartiles of both bank card utilization rates and debt to income ratio, a lower proprtion of loans ended as default or charge off. The results held generally true when controlling broadly for Prosper Score by comparing within a low and high Prosper Score group. Additionally, the relationship became more prononaced with focusing on only a single low Propser Score (score of 5) and a single high Prosper Score (score of 7). Afterwards I started addressing the potential for the observed results to be mainly a result of a relationship between low/high bank card utilization rates and debt to income ratios with higher and lower Prosper scores, respectively. 