library(flextable)

baseline_data <- test_path("data", "baseline_data.csv") |>
  read.csv()

baseline_data$Arm <- factor(
  baseline_data$Arm,
  levels = c("Sham procedure", "Intrathecal treatment"),
)

baseline_formula <- age +
  sex +
  bmi +
  tetanus +
  icudays +
  outcome +
  timetoadm +
  maxtemp +
  resp +
  fio2 +
  spo2 ~ Arm


test_that("create, mutate, and print sstable.baseline", {
  baseline.sstable <- expect_no_condition(
    sstable.baseline(
      formula = baseline_formula,
      data = baseline_data,
      statistics = "Median (q1, q3)",
      pooledGroup = FALSE,
      flextable = TRUE,
      footer = "we can add any note here and it will appear at the bottom of the table",
      bg = "lightblue" #we can style our table with different color, if we do not specify this argument, it will be gray in color by default
    )
  )

  baseline.sstable <- expect_no_condition(
    baseline.sstable %>%
      set_caption(
        caption = 'Baseline characteristics of study population grouped by Treatment Arm.'
      )
  )

  expect_s3_class(baseline.sstable, "flextable")
})
