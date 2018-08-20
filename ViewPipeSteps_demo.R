library(tidyverse)
library(lubridate)

promos_tibb <- tibble::tribble(
    ~Date,                    ~Offer, ~Discount.code,
    "1/1/18",         "Happy Brew Year",          1111L,
    "2/2/18", "Coarsely Ground Hog Day",          2222L,
    "2/14/18",      "Espresso Your Love",          3333L,
    "2/19/18",     "Aeropressidents Day",          4444L,
    "3/17/18",        "St. Patdrips Day",          5555L,
    "4/1/18",           "Frappy Easter",          6666L,
    "5/5/18",          "Cinco de Nitro",          7777L,
    "7/4/18",       "Fourth of Julatte",          8888L
)

# find number of offers per month
promo_month <- promos_tibb %>%
    mutate(month = month(as.Date(Date, "%m/%d/%y"))) %>%
    group_by(month) %>%
    summarize(n_offers = n())

ggplot(promo_month,
       aes(x = month, y = n_offers)) +
    geom_col()