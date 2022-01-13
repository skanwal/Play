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

# pivot_* 
people <- tribble(
  ~name, ~key, ~value,
  #-----------------|--------|------
  "Phillip Woods",  "age", 45,
  "Phillip Woods", "height", 186,
  "Phillip Woods", "age", 50,
  "Jessica Cordero", "age", 37,
  "Jessica Cordero", "height", 156
)
glimpse(people)
# error - as name and key are not unique for two rows
pivot_wider(people, names_from="key", values_from = "value")
# to solve the issue add a column that refers to distinct obsertvation count
people2 <- people %>%
  group_by(name, key) %>%
  mutate(obs = row_number())
pivot_wider(people2, names_from="name", values_from = "value")

# tidy the following data
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes", NA, 10,
  "no", 20, 12
)
preg_tidy2 <- preg %>%
  pivot_longer(c(male, female), names_to = "sex", values_to = "count", values_drop_na = TRUE)

preg_tidy3 <- preg_tidy2 %>%
  mutate(
    female = sex == "female",
    pregnant = pregnant == "yes"
  )