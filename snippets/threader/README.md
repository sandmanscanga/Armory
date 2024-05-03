#  Threader

The program I wrote utilizes multi-threading to solve a list of jobs much faster than if written and executed in a single main thread.

For instance, we have a simple function that sleeps for *1* second:

```python
import time

def the_job(sleep_time=1):
    time.sleep(sleep_time)
```

This function would take one second if you call it one time, but it would take *10* seconds if you called it ten times...

---

Wrong

---

The threader is meant to utilize the following:
+ a reference to a function
+ a list of arguments that should be provided to the function
+ the total number of threads you would like to create

So you could use code like the following to create the scenario:

```python

sleep_times = [1 for _ in range(10)]  # 10 jobs - 1 second each

"""
We want to avoid doing this...

  for sleep_time in sleep_times:
    the_job(sleep_time)
    
Because it will take too long, and we like things fast :)
"""

""" We want to call it like this... """
total_threads = 5  # five threads
threader(the_job, sleep_times, total_threads)
## 10 jobs, 1 second each, divided between 5 threads...
## means the whole process would take 2 seconds instead of 10 seconds

```
