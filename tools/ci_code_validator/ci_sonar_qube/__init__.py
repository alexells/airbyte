import os
from pathlib import Path

ROOT_DIR = Path(os.getcwd())
while str(ROOT_DIR) != "/" and not (ROOT_DIR / "gradlew").is_file():
    ROOT_DIR = ROOT_DIR.parent
if str(ROOT_DIR) == "/":
    LOGGER.critical("this script must be executed into the Airbite repo only")