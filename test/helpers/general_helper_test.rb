class GeneralHelperTest < ActionView::TestCase

  test "calc_range_margins" do
    assert_equal(
      { "low" => 40, "high" => 40 },
      calc_range_margins({ "low" => 40, "high" => 60 })
    )

    assert_equal(
      { "low" => 20, "high" => 10 },
      calc_range_margins({ "low" => "20", "high" => "90" })
    )
  end

  test "cst" do
    uk_noon = "2020-05-25 12:00:00 +0000"
    assert_equal "25 May 2020  7:00 am", cst(uk_noon)
  end

  test "temp_to_f" do
    assert_equal "32˚F", temp_to_f("0")
    assert_equal "212˚F", temp_to_f("100")
    assert_equal "64˚F", temp_to_f("18")
    assert_not temp_to_f(nil)
  end

  test "wind_dir_desc" do
    assert_equal "N", wind_dir_desc(10)
    assert_equal "S", wind_dir_desc("200")
    assert_equal "NE", wind_dir_desc(45)
  end

end