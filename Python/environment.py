import subprocess, os

my_env = os.environ.copy()
my_env.clear()
my_env["311"] = "kqsdvqkqsn"
subprocess.run(["/challenge/embryoio_level77"], env=my_env)