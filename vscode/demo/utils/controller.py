"""
Module to setup the logging configuration.

Summary:
    This module is responsible for setting up the logging configuration for
    the GenFtp module. It defines the logging configuration and applies it
    to the logging module.

"""

import logging
import logging.config


def get_logger_config() -> dict:
    """
    Get the logging configuration.

    Summary:
        This function is responsible for getting the logging configuration
        for the demo module. It defines the logging configuration and
        returns it.

    Returns:
        dict: The logging configuration for the demo module.

    """

    logger_config = {
        "version": 1,
        "disable_existing_loggers": False,
        "formatters": {
            "standard": {
                "format": "%(asctime)s [%(levelname)s] %(name)s: "
                "%(message)s"
            },
            "simple": {"format": "%(levelname)s:%(name)s:%(message)s"},
            "detailed": {
                "format": "%(asctime)s - %(name)s - %(levelname)s - "
                "%(module)s:%(lineno)d - %(message)s"
            },
        },
        "handlers": {
            "console": {
                "class": "logging.StreamHandler",
                "level": "INFO",
                "formatter": "simple",
                "stream": "ext://sys.stdout",
            },
            "file_handler": {
                "class": "logging.FileHandler",
                "level": "DEBUG",
                "formatter": "detailed",
                "filename": "debug.log",
                "mode": "w",
                "encoding": "utf-8",
            },
        },
        "loggers": {
            "demo": {
                "level": "DEBUG",
                "handlers": ["console", "file_handler"],
                "propagate": False,
            },
        },
        "root": {"level": "INFO", "handlers": ["console"]},
    }

    return logger_config


def main() -> None:
    """
    Execute the main module.

    Summary:
        This function is responsible for setting up the logging
        configuration for the GenFtp module. It is the entry point for
        the demo module.

    """

    logger_config = get_logger_config()
    logging.config.dictConfig(logger_config)
    logger = logging.getLogger("demo")

    logger.debug("This is a debug message")
    logger.info("This is an info message")
    logger.warning("This is a warning message")
    logger.error("This is an error message")
    logger.critical("This is a critical message")


if __name__ == "__main__":
    main()
