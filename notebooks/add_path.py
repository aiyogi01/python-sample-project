"""
Add the project directory to `sys.path`, so that the main package
becomes available for imports in notebooks.

In order to activate, add to one of the notebook cells: `import add_path`.
"""

import sys
from pathlib import Path


sys.path.append(str(Path(__file__).parents[1]))
