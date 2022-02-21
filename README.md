# B-CNA-410-NCE-4-1-groundhog-loup.mesquita - Subject

Several industries rely on weather forecasts: insurance, farming, construction, airlines, shipping, power generation and supply, drinks, clothing, sports, etc. . . In fact, it’s quite challenging to find a business which is not
affected by climatic conditions. That’s why the weather forecasting market is so burgeoning.
Despite popular opinion, weather forecasts are becoming more accurate than ever. Thanks to ingenious and
talented people like you, who use smart tools to get better, faster and stronger predictions than the others.
Your job is to extract some relevant information from the data received in real-time on standard input (each
float representing a temperature), in order to detect weather aberrations (droughts, severe colds, hurricanes
or any other extreme climatic condition whatsoever) as soon as possible.

aberration: deviation from what is normal, expected, or usual.

forecast: a forecast is a statement of what is expected to happen in the future, especially in relation to a
particular event or situation.

To do so, your program must, given a number of days (called period) as argument:
  1. wait for the next value to be written on the standard input,
  2. output, once enough data has been gathered, some technical indicators:

    a. the temperature increase average, g, observed on the last period (decrease in temperature are
       not taken into account),
       
    b. the relative temperature evolution, r, between the last given temperature and the temperature
       observed n-days ago,
       
    c. the standard deviation, s, of the temperatures observed during the last period,
    
    d. when appropriate, an alert as soon as it detects a switch in global tendency,
    
  3. return to the first step, until the STOP keyword is read.

Eventually, once the keyword is entered, it must output:
1. the total number of tendency switches observed on the whole time-series,
2. the list of the five biggest aberrations observed on the whole time-series (sorted by decreasing weirdness).

## Compilation 

    make && make re && make fclean

## Usage 

![Screenshot_20210405_143856](https://user-images.githubusercontent.com/57537562/113574599-b8496300-961c-11eb-8b94-8a74746c1686.png)

## Tests

    make tests_ground

    make clean_ground

## Exemple 

![Screenshot_20210405_144333](https://user-images.githubusercontent.com/57537562/113574916-5c330e80-961d-11eb-8ed9-babdfb2e2766.png)
![Screenshot_20210405_144534](https://user-images.githubusercontent.com/57537562/113575071-9dc3b980-961d-11eb-9001-30f42cd9b8eb.png)
![Screenshot_20210405_144653](https://user-images.githubusercontent.com/57537562/113575241-debbce00-961d-11eb-8ea6-4d3cd9fcbd0d.png)
![Screenshot_20210405_144718](https://user-images.githubusercontent.com/57537562/113575254-e24f5500-961d-11eb-876e-097fe0084cc3.png)

## Test Results

| Groundhog | Test % |
| --- | --- |
| rgs | 100% |
| final switches | 100% |
| errors | 100% |
| timing of switches | 100% |

# Loup mesquita
