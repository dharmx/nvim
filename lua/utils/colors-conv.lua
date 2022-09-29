function hsl(hue, saturation, luminance)
  local red, green, blue
  if saturation == 0.0 then
    red = luminance
    green = luminance
    blue = luminance
  else
    local q = luminance + saturation - luminance * saturation
    if luminance < 0.5 then
      q = luminance * (1 + saturation)
    end

    local p = 2 * luminance - q
    red = hue_to_rgb(p, q, hue + 1.0 / 3.0)
    green = hue_to_rgb(p, q, hue)
    blue = hue_to_rgb(p, q, hue - 1.0 / 3.0)
  end
  return string.format("#%02x%02x%02x", unpack(vim.tbl_map(function(item)
    return math.min(255, 256 * item)
  end, { red, green, blue })))
end

function hue_to_rgb(p, q, t)
  if t < 0.0 then
    t = t + 1.0
  end
  if t > 1.0 then
    t = t - 1.0
  end
  if t < 1.0 / 6.0 then
    return p + (q - p) * 6.0 * t
  end
  if t < 1.0 / 2.0 then
    return q
  end
  if t < 2.0 / 3.0 then
    return p + (q - p) * (2.0 / 3.0 - t) * 6.0
  end
  return p
end
