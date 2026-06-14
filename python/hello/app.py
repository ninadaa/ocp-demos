import time
import os
hostname = os.getenv('HOSTNAME')

while True:
    print("Hello World from container " + hostname)
    time.sleep(10)
