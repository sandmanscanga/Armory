#!/usr/bin/env python3
# -*- coding:utf-8 -*-
import logging, time, sys, os
from functools import wraps

DEBUG = 10
INFO = 20
WARN = 30
ERROR = 40
FATAL = 50

NOLOGS = 0
LOGALL = 1

INITLOG = 2
CHECKIN = 3

FUNCLOG = 4
TIMELOG = 5


class DebugFormatter(logging.Formatter):
    def __init__(self):
        super().__init__("%(asctime)s  |  %(levelno)-2d  |  %(name)s  |  %(message)s")


class StdoutFormatter(logging.Formatter):
    def __init__(self):
        super().__init__("%(message)s")


class StderrFormatter(logging.Formatter):
    def __init__(self):
        super().__init__("[%(levelname)s] %(message)s")


class DebugFilter(logging.Filter):
    def filter(self, record):
        return record.levelno > NOLOGS


class StdoutFilter(logging.Filter):
    def filter(self, record):
        return record.levelno >= INFO and record.levelno < WARN


class StderrFilter(logging.Filter):    
    def filter(self, record):
        return record.levelno >= WARN


class DebugHandler(logging.FileHandler):

    def __init__(self, logfile):
        super().__init__(logfile, mode="w")
        self.setFormatter(DebugFormatter())
        self.addFilter(DebugFilter())


class StdoutHandler(logging.StreamHandler):

    def __init__(self):
        super().__init__(sys.stdout)
        self.setFormatter(StdoutFormatter())
        self.addFilter(StdoutFilter())


class StderrHandler(logging.StreamHandler):

    def __init__(self):
        super().__init__(sys.stderr)
        self.setFormatter(StderrFormatter())
        self.addFilter(StderrFilter())


class Logger(object):

    _RUNNING = None

    @classmethod
    def init_logger(cls):
        cls._RUNNING = True

    def __init__(self, alias=None, level=None):
        self.alias = alias if alias else __name__
        self.level = level if level else LOGALL
        self.logger = logging.getLogger(self.alias)
        self.logger.setLevel(self.level)
        if not self._RUNNING:
            logpath = os.path.join(__name__, "logs", ("%s.log" % __name__))
            os.makedirs(os.path.split(logpath)[0], exist_ok=True)
            self.logger.addHandler(DebugHandler(logpath))
            self.logger.addHandler(StdoutHandler())
            self.logger.addHandler(StderrHandler())
            Logger.init_logger()
            self.initlog()

    def __call__(self, orig_func):
        lg = Logger(".".join((self.alias, orig_func.__name__)))
        @wraps(orig_func)
        def wrapper_func(*args, **kwargs):
            lg.funclog()
            start_time = time.time()
            result = orig_func(*args, **kwargs)
            end_time = time.time() - start_time
            lg.timelog(end_time)
            return result
        return wrapper_func

    def __repr__(self):
        return repr(self.alias)

    def __str__(self):
        return self.alias

    def __int__(self):
        return self.level

    def get_logger(self, alias):
        return Logger(".".join((self.alias, alias)))

    def initlog(self):
        self.logger.log(INITLOG, "INITLOG  |  %s", repr(self))

    def checkin(self):
        self.logger.log(CHECKIN, "CHECKIN  |  %s", repr(self))

    def funclog(self):
        self.logger.log(FUNCLOG, "FUNCLOG  |  %s", repr(self))

    def timelog(self, elapsed):
        self.logger.log(TIMELOG, "TIMELOG  |  %f", elapsed)

    def debug(self, *args, **kwargs):
        self.logger.debug(*args, **kwargs)

    def info(self, *args, **kwargs):
        self.logger.info(*args, **kwargs)

    def warn(self, *args, **kwargs):
        self.logger.warning(*args, **kwargs)

    def error(self, *args, **kwargs):
        self.logger.error(*args, **kwargs)

    def fatal(self, *args, **kwargs):
        self.logger.critical(*args, **kwargs)

    def throw(self, *args, **kwargs):
        self.logger.exception(*args, **kwargs)
