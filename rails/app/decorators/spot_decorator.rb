class SpotDecorator < Draper::Decorator
  delegate_all

  def white_light_on
    Time.at(object.white_light_on).localtime.strftime("%l:%M%P") 
  end

  def white_light_off
    Time.at(object.white_light_off).localtime.strftime("%l:%M%P") 
  end

  def red_light_on
    Time.at(object.red_light_on).localtime.strftime("%l:%M%P") 
  end

  def red_light_off
    Time.at(object.red_light_off).localtime.strftime("%l:%M%P") 
  end

  def enclosure_status
    enclosure? ? "<span class='green'>Open</span>".html_safe : "<span class='red'>Closed</span>".html_safe
  end

  def white_light_status
    white_light_power? ? "<span class='green'>On</span>".html_safe : "<span class='red'>Off</span>".html_safe
  end

  def red_light_status
    red_light_power? ? "<span class='green'>On</span>".html_safe : "<span class='red'>Off</span>".html_safe
  end

  def fan_status
    fans? ? "<span class='green'>On</span>".html_safe : "<span class='red'>Off</span>".html_safe
  end

  def white_light
    white_light_power? ? "<div id='white-light'></div>".html_safe : "<div id='white-light' style='display:none;'></div>".html_safe
  end

  def red_light
    red_light_power? ? "<div id='red-light'></div>".html_safe : "<div id='red-light' style='display:none;'></div>".html_safe
  end

  def tomato
    h.image_tag '/tomato.png', id: 'tomato'
  end

  def fan_icons
    if fans
      "<div id='fan1' class='fan-icon fa-spin on'></div>
       <div id='fan2' class='fan-icon fa-spin on'></div>".html_safe
    else
      "<div id='fan1' class='fan-icon'></div>
       <div id='fan2' class='fan-icon'></div>".html_safe
    end
  end

  def air_temp_td
    if air_temp > set_air_temp_high
      "<td class='label blink'>Temp <i class='fa fa-arrow-up'></i></td>
       <td class='blink'>#{air_temp}&deg; C</td>".html_safe
    elsif air_temp < set_air_temp_low
      "<td class='label blink'>Temp <i class='fa fa-arrow-down'></i></td>
       <td class='blink'>#{air_temp}&deg; C</td>".html_safe
    else
      "<td class='label'>Temp</td>
       <td>#{air_temp}&deg; C</td>".html_safe
    end
  end

  def rh_td
    if rh > set_rh_high
      "<td class='label blink'>R.H. <i class='fa fa-arrow-up'></i></td>
       <td class='blink'>#{rh} %</td>".html_safe
    elsif rh < set_rh_low
      "<td class='label blink'>R.H. <i class='fa fa-arrow-down'></i></td>
       <td class='blink'>#{rh} %</td>".html_safe
    else
      "<td class='label'>R.H.</td>
       <td>#{rh} %</td>".html_safe
    end 
  end

  def co2_td
    if co2 > set_co2_high
      "<td class='label blink'>CO2 <i class='fa fa-arrow-up'></i></td>
       <td class='blink'>#{co2.to_i} ppm</td>".html_safe
    elsif co2 < set_co2_low
      "<td class='label blink'>CO2 <i class='fa fa-arrow-down'></i></td>
       <td class='blink'>#{co2.to_i} ppm</td>".html_safe
    else
      "<td class='label'>CO2</td>
       <td>#{co2.to_i} ppm</td>".html_safe
    end 
  end

  def ec_td
    if ec > set_ec_high
      "<td class='label blink'>E.C. <i class='fa fa-arrow-up'></i></td>
       <td class='blink'>#{ec} mS/cm2</td>".html_safe
    elsif ec < set_ec_low
      "<td class='label blink'>E.C. <i class='fa fa-arrow-down'></i></td>
       <td class='blink'>#{ec} mS/cm2</td>".html_safe
    else
      "<td class='label'>E.C.</td>
       <td>#{ec} ppm</td>".html_safe
    end 
  end

  def ph_td
    if ph > set_ph_high
      "<td class='label blink'>pH <i class='fa fa-arrow-up'></i></td>
       <td class='blink'>#{ph}</td>".html_safe
    elsif ph < set_ph_low
      "<td class='label blink'>pH <i class='fa fa-arrow-down'></i></td>
       <td class='blink'>#{ph}</td>".html_safe
    else
      "<td class='label'>pH</td>
       <td>#{ph}</td>".html_safe
    end 
  end

  def do_td
    if object.do > set_do_high
      "<td class='label blink'>D.O. <i class='fa fa-arrow-up'></i></td>
       <td class='blink'>#{object.do.to_i} ppm</td>".html_safe
    elsif object.do < set_do_low
      "<td class='label blink'>D.O. <i class='fa fa-arrow-down'></i></td>
       <td class='blink'>#{object.do.to_i} ppm</td>".html_safe
    else
      "<td class='label'>D.O.</td>
       <td>#{object.do.to_i} ppm</td>".html_safe
    end 
  end

  def white_light_buttons
    if white_light_power
      "<td><button id='white-lights-off'>Off</button></td>
       <td><button id='white-lights-on' class='green-bg'>On</button></td>".html_safe
    else
      "<td><button id='white-lights-off' class='red-bg'>Off</button></td>
       <td><button id='white-lights-on'>On</button></td>".html_safe
    end
  end    

  def red_light_buttons
    if red_light_power
      "<td><button id='red-lights-off'>Off</button></td>
       <td><button id='red-lights-on' class='green-bg'>On</button></td>".html_safe
    else
      "<td><button id='red-lights-off' class='red-bg'>Off</button></td>
       <td><button id='red-lights-on'>On</button></td>".html_safe
    end
  end    

  def refresh_buttons
    if refresh
      "<td><button id='camera-refresh-off'>Off</button></td>
       <td><button id='camera-refresh-on' class='green-bg'>On</button></td>".html_safe
    else
      "<td><button id='camera-refresh-off' class='red-bg'>Off</button></td>
       <td><button id='camera-refresh-on'>On</button></td>".html_safe
    end
  end

  def enclosure_buttons
    if enclosure
      "<td><button id='enclosure-close'>Close</button></td>
       <td><button id='enclosure-open' class='green-bg'>Open</button></td>".html_safe
    else
      "<td><button id='enclosure-close' class='red-bg'>Close</button></td>
       <td><button id='enclosure-open'>Open</button></td>".html_safe
    end
  end

  def fan_buttons
    if fans
      "<td><button id='fans-off'>Off</button></td>
       <td><button id='fans-on' class='green-bg'>On</button></td>".html_safe
    else
      "<td><button id='fans-off' class='red-bg'>Off</button></td>
       <td><button id='fans-on'>On</button></td>".html_safe
    end
  end
end
