import pytest

from sample_project.sample import greeting, main


@pytest.mark.parametrize("name, result", [
    ("Joe", "Hello, Joe!"),
    ("Jane", "Hello, Jane!"),
    ("world", "Hello, world!"),
    ("", "Hello!")
])
def test_greeting(name, result):
    assert greeting(name) == result


def test_main(capsys):
    # when
    main()

    # then
    captured = capsys.readouterr()
    assert captured.out == "Hello, world!\n"
