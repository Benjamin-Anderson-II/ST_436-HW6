degree_days <- tribble(
  ~ type,   ~`1`,   ~`2`,   ~`3`,   ~`4`,   ~`5`,   ~`6`,   ~`7`,   ~`8`,   ~`9`,   ~`10`,  ~`11`,  ~`12`,
  "cooling", 	0, 	0, 	0, 	0, 	3, 	14, 	93, 	91, 	31, 	0, 	0, 	0,
  "heating", 	830, 	630, 	438, 	188, 	41, 	1, 	0, 	1, 	22, 	159, 	459, 	762
)

degree_days |>
  pivot_longer(-type, names_to = "month", values_to = "temp") |> 
  filter(type == "cooling") |> 
  select(-type) |>
  mutate(month = month.abb[as.integer(month)]) |>
  ggplot(mapping = aes(x=fct_inorder(month), y=temp)) +
  geom_point() +
  labs(x = "Months",
       y = "Cooling Degree Days")
