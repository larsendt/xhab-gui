class RogrDecorator < Draper::Decorator
  delegate_all

  def water_pump_buttons
    if water_pump_power?
      "<td><button id='rogr-pump-off'>Off</button></td>
       <td><button id='rogr-pump-on' class='green-bg'>On</button></td>".html_safe
    else
      "<td><button id='rogr-pump-off' class='red-bg'>Off</button></td>
       <td><button id='rogr-pump-on'>On</button></td>".html_safe
    end
  end

  def nutrient_pump_buttons
    if nutrient_pump_power?
      "<td><button id='rogr-nutrient-pump-off'>Off</button></td>
       <td><button id='rogr-nutrient-pump-on' class='green-bg'>On</button></td>".html_safe
    else
      "<td><button id='rogr-nutrient-pump-off' class='red-bg'>Off</button></td>
       <td><button id='rogr-nutrient-pump-on'>On</button></td>".html_safe
    end
  end

  def docked_status
    if docked?
      "<td class='active'>On Dock</td>
       <td class='inactive'>Off Dock</td>".html_safe
    else
      "<td class='inactive'>On Dock</td>
       <td class='active'>Off Dock</td>".html_safe
    end
  end
end
