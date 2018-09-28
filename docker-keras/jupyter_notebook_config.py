import os
from IPython.lib import passwd
if 'PASSWORD' in os.environ:
  c.NotebookApp.password = passwd(os.environ['PASSWORD'])
else:
  c.NotebookApp.password = ''
  c.NotebookApp.token = ''
del os.environ['PASSWORD']