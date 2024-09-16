ug <- df %>% 
  filter(university == "Glasgow")  %>%
  mutate_at(vars(venue), factor) %>%
  group_by(venue) %>%
  summarise(n = length(venue))

# make bar plot to show popular choices
p <- df %>% 
  filter(university == "Glasgow")  %>%
  filter(venue != "Addis in Dar") %>% 
  filter(venue != "IHI cafe" )  %>%
  group_by(venue, university) %>%
  summarise(n = length(venue)) %>%
  ggplot(aes(x = venue, y = n, fill = university)) +
  geom_bar(stat="identity") + 
  theme_minimal()
p

# save an svg file
ggsave("figs/demo_stacked_chart2.svg", p, device = "svg")

# See if the file can be edited in ppt! Follow instructions here:
# https://nalinan.medium.com/how-to-vectorize-plots-from-r-in-powerpoint-bad7c238e86a
# Check out the ppt for this practical