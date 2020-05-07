module GeneralHelper

  def calc_range_margins(range)
    low = range["low"]
    high = 100 - range["high"].to_i
    { "low" => low, "high" => high }
  end

  def temp_to_f(temp)
    float = temp.to_f
    f = float*(9/5)+32
    f.round
  end

end