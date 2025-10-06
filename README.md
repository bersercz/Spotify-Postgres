# Spotify‑Data Analysis

## About  
Spotify‑Postgres is a PostgreSQL-based data analysis project focused on exploring song popularity and engagement trends using Spotify data. The project involved designing a relational database schema, performing data cleaning, and executing complex SQL queries to extract patterns from user interactions like views, likes, and comments. It aims to answer various analytical questions around what makes songs go viral, how popularity evolves, and how user behavior varies across artists and tracks.

## Project Description  
The project utilized a cleaned dataset (`Spotify_Dataset.csv`) and PostgreSQL queries (`Analysis_Tasks.sql`) to perform the following:

- Import and clean song-level engagement data
- Structure data into a PostgreSQL database
- Write queries to solve multiple analytical questions (15 in total)
- Extract trends based on popularity growth, engagement ratios, artist activity, and anomaly detection

### Dataset Features:
- **Engagement Metrics**: Views, likes, comments  
- **Growth Metrics**: Popularity change, relative increase over 30 days  
- **Ratios**: Like/view and comment/view ratios for qualitative engagement analysis  
- **Song Info**: Track name, artist, release date  

---

## Query-Based Discoveries

These insights are directly related to the specific tasks and questions addressed through SQL analysis:

- **Popularity Growth**: Several songs showed rapid popularity increases within short timeframes—indicating clear viral behavior.
- **Top Artists**: A subset of artists consistently appeared in the top ranks for engagement metrics and popularity growth.
- **Ratio Metrics**: Songs with the highest like/view and comment/view ratios were not always the most viewed—indicating strong audience sentiment even for lesser-known tracks.
- **Stability vs. Volatility**: Some songs showed stable and consistent growth, while others had sharp peaks followed by decline.
- **Low Engagement Outliers**: A few popular songs surprisingly had low like/view or comment/view ratios, pointing to possible passive listening behavior or bot-generated views.
- **Repeated Virality**: A few artists had multiple songs that went viral, suggesting established fan bases or effective promotional strategies.

---

## Findings

These are broader conclusions that emerged across the full workflow, from data prep to query-based insights:

- **Engagement ≠ Popularity**: While likes, views, and comments are correlated with popularity, they don’t always scale together. Some high-engagement songs don’t gain overall popularity and vice versa.
- **Virality Patterns**: Viral songs often spike early and then flatten, while others (slow-burners) grow steadily. Virality isn’t always predictable from baseline metrics.
- **Data Quality Matters**: Proper cleaning and formatting were critical to drawing accurate conclusions—especially around date comparisons and ratio calculations.
- **SQL is Powerful for EDA**: With just SQL (no external tools), deep analysis was achievable—showing how capable relational databases are for real-world data insights.
- **Artist Behavior Clusters**: Artists naturally fell into behavioral clusters based on growth curves—those with flash virality, sustained growth, or declining patterns.
- **Scalability of Schema**: The database design is robust and scalable—making it ready for additional data such as genre, country, or platform.

---

## Conclusion  
This project demonstrates how PostgreSQL can be used to explore, analyze, and extract meaningful trends from engagement data. By designing the schema, cleaning the dataset, and writing analytical SQL queries, I was able to uncover how songs perform over time, what drives engagement, and which artists maintain momentum. The findings can inform not just marketing strategies for music platforms, but also data-driven decisions for artists and labels looking to understand audience behavior.

---

## Author
- **Devansh Singh Tomar**
