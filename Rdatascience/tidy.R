# https://r4ds.had.co.nz/tidy-data.html#tidy-data

library("tidyverse")

#create an example tibble
table2 <- tribble(~country, ~year, ~type, ~count,
        "Afghanistan", 1999, "cases", 745,
        "Afghanistan", 1999, "population", 19987071,
        "Afghanistan",  2000, "cases", 2666,
        "Afghanistan",  2000, "population", 20595360,
        "Brazil", 1999, "cases", 37737,
        "Brazil", 1999, "population", 172006362
        )
# create two separate tables for 'cases' and population'
t2_cases <- dplyr::filter(table2, type == "cases") %>%
  dplyr::rename(cases = count) %>%
  dplyr::arrange(country, year)

t2_population <- dplyr::filter(table2, type == "population") %>%
  dplyr::rename(population = count) %>%
  dplyr::arrange(country, year)

# create a tibble with desired coloumn for performing calculation on cases and population
t2_cases_per_cap <- tibble(
  year = t2_cases$year,
  country = t2_cases$country,
  cases = t2_cases$cases,
  population = t2_population$population
) %>%
  dplyr::mutate(cases_per_cap = (cases / population) * 10000) %>%
  dplyr::select(country, year, cases_per_cap)

# add and rename coloums to match with original table2
t2_cases_per_cap <- t2_cases_per_cap %>%
  dplyr::mutate(type = "cases_per_cap") %>%
  dplyr::rename(count = cases_per_cap)

# join newly created data with original data
bind_rows(table2, t2_cases_per_cap) %>%
  arrange(country, year, type, count)
