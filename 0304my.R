# 讀取 CSV 檔案
df <- readr::read_csv("113_foreignteacher1.csv", show_col_types = FALSE)

# 轉換為長格式
df_long <- df |> 
  tidyr::pivot_longer(
    cols = 教授男:其他女,  # 指定需要展開的欄位
    names_to = c("職稱", "性別"),  # 轉換為「職稱」和「性別」
    names_pattern = "(.+)(男|女)",  # 使用正則表達式分割「職稱」和「性別」
    values_to = "人數"  # 數值存入「人數」欄位
  )

# 查看轉換後的資料
print(df_long)
glimpse(df_long)
view(df_long)
