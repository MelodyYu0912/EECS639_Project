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
f(x) = (e^x^)^2, [0.6,1] |  
:-----------------------:|
![alt text][data_set_1]  |

## Data set 2
f(x) = 1 / ( 1 + 12x^2^ ), [-1,1] |  
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

[data_set_1]: https://imgur.com/WcA3yNs "Interpolants for f(x) = e^(x^2)"
[data_set_2]: https://imgur.com/4K5PzMu "Interpolants for f(x) = 1/(1 + 12x^2)"
[data_set_3]: https://imgur.com/r4KZEfk "Interpolants for f3 data set"
[temperature]: https://github.com/vchadha/EECS639_Project/tree/master/images/Lawrence_temperature_Newton.png "Newton interpolation for temperature data"
[temperature_zoomed]: https://github.com/vchadha/EECS639_Project/tree/master/images/Lawrence_temperature_Newton_zoomed.png "Zoomed in Newton's interpolation for temperature data"
[temperature_spline]: https://github.com/vchadha/EECS639_Project/tree/master/images/Lawrence_temperature_spline.png "Natural spline interpolation for temperature data"
[precipitation]: https://github.com/vchadha/EECS639_Project/tree/master/images/Lawrence_precipitation_Newton.png "Newton interpolation for precipitation data"
[precipitation_zoomed]: https://github.com/vchadha/EECS639_Project/tree/master/images/Lawrence_precipitation_Newton_zoomed.png "Zoomed in Newton's interpolation for precipitation data"
[precipitation_spline]: https://github.com/vchadha/EECS639_Project/tree/master/images/Lawrence_precipitation_spline.png "Natural spline interpolation for precipitation data"
