# EECS639_Project

##### Melody Yu . Varun Chadha
---
## Project to visualise weather data and data set with various Interpolation methods
* Vandermonde Interpolation
* Lagrange Interpolation
* Newton's interpolation
* Cubic Spline Interpolation
    * Natural Spline Interpolation
    * Complete Spline Interpolation
    * Not-a-knot Spline Interpolation
---
# Resulting renders of interpolants:

## Data set 1
f(x) = e^(x^2), [0.6,1] |  
:-----------------------:|
![alt text][data_set_1]  |

## Data set 2
f(x) = 1 / ( 1 + 12x^2 ), [-1,1] |  
:--------------------------------:|
![alt text][data_set_2]           |

## Data set 3
Given yearly data set    |  
:-----------------------:|
![alt text][data_set_3]  |

---
## Weather data

### Temperature

Newton's Interpolation     |  Zoomed                  |
:-------------------------:|:-------------------------:
![alt_text][temperature]  |  ![alt_text][temperature_zoomed]

Natural Cubic Spline Interpolation |  
:---------------------------------:|
![alt_text][temperature_spline]    |

### Precipitation

Newton's Interpolation     |  Zoomed                  |
:-------------------------:|:-------------------------:
![alt_text][precipitation]  |  ![alt_text][precipitation_zoomed]

Natural Cubic Spline Interpolation |  
:---------------------------------:|
![alt_text][precipitation_spline]    |

[data_set_1]: https://i.imgur.com/WcA3yNs.png "Interpolants for f(x) = e^(x^2)"
[data_set_2]: https://i.imgur.com/4K5PzMu.png "Interpolants for f(x) = 1/(1 + 12x^2)"
[data_set_3]: https://i.imgur.com/r4KZEfk.png "Interpolants for f3 data set"
[temperature]: https://i.imgur.com/M7dvYyy.png?1 "Newton interpolation for temperature data"
[temperature_zoomed]: https://i.imgur.com/JoyDT3h.png "Zoomed in Newton's interpolation for temperature data"
[temperature_spline]: https://i.imgur.com/Skolj99.png "Natural spline interpolation for temperature data"
[precipitation]: https://i.imgur.com/3I4YwhB.png "Newton interpolation for precipitation data"
[precipitation_zoomed]: https://i.imgur.com/xeYa1ru.png "Zoomed in Newton's interpolation for precipitation data"
[precipitation_spline]: https://i.imgur.com/97iLpkF.png "Natural spline interpolation for precipitation data"
