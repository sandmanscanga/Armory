"""
Module containing the main GenFtp module execution functionality.

Summary:
    This module is the entry point for the GenFtp module. It is responsible
    for setting up the logging configuration, parsing the command line
    arguments, and starting the scraper application.

"""

import logging.config
import os
from argparse import ArgumentParser, Namespace
from pathlib import Path

from dotenv import load_dotenv
from demo.utils.controller import get_logger_config


def get_version() -> str:
    """
    Check the version of the demo module.

    Summary:
        This function is responsible for checking the version of the demo
        module. It reads the version from a file and returns it.

    Returns:
        str: The version of the demo module.

    """

    version = "0.0.0"

    project_path = os.environ.get("PROJECT_PATH", "")
    if not project_path:
        project_path = Path(__file__).resolve().parents[2]

    version_path = Path(project_path).joinpath("VERSION")
    if version_path.exists():
        version = version_path.read_text(encoding="utf8").strip()

    return version


def main(cmdline: Namespace) -> None:
    """
    Execute the main module.

    Summary:
        This function is responsible for setting up the logging
        configuration, parsing the command line arguments, and starting
        the scraper application. It is the entry point for the GenFtp
        module.

    Args:
        cmdline (Namespace): The command line arguments.

    """

    load_dotenv()

    if cmdline.version:
        version = get_version()
        print(f"demo version: {version}")
        return

    logger_config = get_logger_config()
    logging.config.dictConfig(logger_config)
    logger = logging.getLogger("demo.entrypoint")
    logger.info("Hello, world!")


if __name__ == "__main__":
    parser = ArgumentParser(description="Demo module entrypoint.")
    parser.add_argument(
        "-v",
        "--version",
        action="store_true",
        help="Print the version of the demo module.",
    )
    main(cmdline=parser.parse_args())
