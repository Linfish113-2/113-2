
##########

# 讀取 CSV 檔案
df <- readr::read_csv("歷年中華民國國民出國目的地人數統計2002-2024.csv", show_col_types = FALSE)

# 先將所有數值欄位轉換為 character，然後處理 "-" 變成 NA，再轉換為 numeric
df <- df |>
  dplyr::mutate(across(-c(首站抵達地, 細分), as.character)) |>
  dplyr::mutate(across(-c(首站抵達地, 細分), ~ dplyr::na_if(., "-"))) |>
  dplyr::mutate(across(-c(首站抵達地, 細分), readr::parse_number))

# 轉換為長格式
df_long <- df |>
  tidyr::pivot_longer(
    cols = -c(首站抵達地, 細分),
    names_to = "年份",
    values_to = "人數"
  )

# 查看結果
print(df_long)
glimpse(df_long)
view(df_long)

