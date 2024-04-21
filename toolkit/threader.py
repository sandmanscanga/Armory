#!/usr/bin/env python3
# -*- coding:utf-8 -*-
import threading
import queue
import time

print_lock = threading.Lock()


def threader(total, func, jobs):
    que = queue.Queue()  # FIFO queue

    # puts jobs in queue for threads
    for job in jobs:
        que.put(job)

    def stager():
        # slave loop for threads
        while True:
            data = que.get()
            if data is not None:
                func(data)
                que.task_done()
            else:
                break

    # trigger for threads to begin working
    for _ in range(total):
        t = threading.Thread(target=stager, args=())
        t.start()

    # signal to join threads
    for _ in range(total):
        que.put(None)


def test_func(num):
    with print_lock:
        print(f"Job #{num} --> Sleeping for a second.")
    time.sleep(1)


def main():
    jobs = [_+1 for _ in range(20)]
    total_threads = 5
    threader(total_threads, test_func, jobs)


if __name__ == "__main__":
    main()
