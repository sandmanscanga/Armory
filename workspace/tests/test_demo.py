"""
Module to test the demo module.

Summary:
    This module contains tests for the demo module. It tests the main
    functionality of the demo module to ensure that it works as expected.

"""

from demo import check_version


def test_check_version() -> None:
    """
    Test the check_version function.

    Summary:
        This function tests the check_version function of the demo module.
        It ensures that the function executes without errors and
        produces the expected output.

    """

    assert check_version.get_version() == "0.1.0"


if __name__ == "__main__":
    test_check_version()
