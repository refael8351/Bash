# import Lib's on python3

# 1. Lib = 'Time'

from time import asctime
from time import localtime
from time import clock
from time import clock_gettime
from time import clock_settime
from time import get_clock_info
from time import sleep
from time import perf_counter
from time import perf_counter_ns
from time import daylight
from time import process_time
from time import process_time_ns
from time import strptime
from time import strftime
from time import struct_time
from time import thread_time
from time import time
from time import timezone

# 2. Lib = 'requests'
def requests_command():
    import requests
    # Put The Output in Object For Better Control

    a = requests.put('url', data={'key': 'value'})
    requests.delete('url')
    requests.head('url')
    requests.options('url')
    requests.post('url', data={'key': 'value'})
    requests.get('url')
    requests.session()
    requests.patch('url')

    b = a.json()['value']
    print(b)
