library(tidyverse)

# 使用BIG5編碼讀取CSV檔案
df <- read_csv("臺北市各級學校教師數.csv", locale = locale(encoding = "BIG5"))

# 檢查資料結構，並查看欄位名稱
glimpse(df)

# 查看欄位名稱
colnames(df)

# 將資料轉換為tidy格式，並將年份轉換為西元年
df_tidy <- df |> 
  rename(
    year = `民國年`, 
    senior_high_teacher_count = `高級中等學校教師數【人】`,
    junior_high_teacher_count = `國民中學教師數【人】`,
    elementary_teacher_count = `國民小學教師數【人】`
  ) |> 
  mutate(
    year = as.numeric(year) + 1911  # 將民國年轉換為西元年
  ) |> 
  pivot_longer(
    cols = c("senior_high_teacher_count", "junior_high_teacher_count", "elementary_teacher_count"),  # 手動指定欄位
    names_to = "school_type", 
    values_to = "teacher_count"
  ) |> 
  mutate(
    school_type = case_when(
      school_type == "senior_high_teacher_count" ~ "高級中等學校",
      school_type == "junior_high_teacher_count" ~ "國民中學",
      school_type == "elementary_teacher_count" ~ "國民小學",
      TRUE ~ school_type
    )
  )

# 顯示tidy格式的資料
view(df_tidy)




