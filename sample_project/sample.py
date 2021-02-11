"""
Some sample functions.
"""


def greeting(name: str) -> str:
    """
    Construct a greeting.

    :param name: name of the person or object to greet
    :return: greeting
    """
    return f"Hello, {name}!" if name else "Hello!"


def main():
    """
    Print greetings.
    """
    print(greeting("world"))
