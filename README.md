# Office Stationery Sales Method Analysis

## Overview

This project analyzes which sales method works best for selling a new office stationery product line at Pens and Printers, a B2B office products distributor.

## The Problem

Pens and Printers tested three different sales approaches over 6 weeks:
- **Email**: Two emails per customer (~3 minutes)
- **Call**: One 30-minute phone call per customer
- **Email + Call**: One email followed by a 10-minute call

**Question:** Which method should the company continue using?

## The Data

- **15,000+ customer transactions** over 6 weeks
- **8 variables** including sales method, revenue, customer tenure, and week of sale
- **3 sales methods** tested across different customer groups

## Key Findings

**Revenue Performance:**
- Email + Call: **175** median revenue per customer
- Email: **95** per customer
- Call: **45** per customer

**Time Efficiency:**
- Email + Call generates **1,029 per hour** of team time
- Call only generates **90 per hour** (worst Return Of Investment)

**Growth Over Time:**
- Email + Call showed strongest growth (Week 1: 125 → Week 6: 210)

## Recommendation

**Scale the Email + Call method** - it delivers 290% better revenue than Call-only while using 67% less time per customer.

## Tools Used

- R (dplyr, ggplot2, tidyr)
- Data cleaning and validation
- Statistical analysis and visualization

## Project Files

- `Product Sales Analysis Report.ipynb` - Full detailed analysis and recommendations
- `scripts/` - R code for data cleaning and analysis
- `product_sales.csv` - The dataset 

---

**For full details, see the complete report.(Product Sales Analysis Report.ipynb)**
