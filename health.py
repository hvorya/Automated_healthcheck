#!/usr/bin/env python3
import sys
from datetime import datetime
import requests
def main():
    url=sys.argv[1]
    #url="https://example-service.f-secure.com/health"
    #url="https://www.google.com/health"
    #url="http://www.website.com/health/"
    now = datetime.now()
    date_time = now.strftime("%m/%d/%Y, %H:%M:%S")

    try:
        response=requests.get(url,timeout=30)
        response.raise_for_status()
    except requests.exceptions.HTTPError as errh:
           print(date_time + " : An HTTP Error Occurred :" + repr(errh))
    except requests.exceptions.ConnectionError as errcon:
           print(date_time + " : An Error Connecting to the API Occurred :" + repr(errcon))
    except requests.exceptions.Timeout as errtime:
          print(date_time + " : The server did not send any data in alloted amount of time" + repr(errtime))
    except requests.exceptions.RequestException as err:
              print(date_time + " : An Unknown Error Occurred" + repr(err))
    else:
          if response.status_code ==200:
              return 0
          else:
              print(response.status_code)

if __name__=="__main__":
    main()
