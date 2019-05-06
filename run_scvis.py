import subprocess
import tarfile
import sys
import os

function "train"
data_matrix_file = sys.argv[1]

cmd = "scvis {0} --data_matrix_file {1} --out_dir /results/ --verbose".format(function, data_matrix_file)

subprocess.call(cmd.split())

with tarfile.open("scvis-results.tar.gz", "w:gz") as tar:
    tar.add("/results/", arcname=os.path.basename("scvis-results.tar.gz"))

print("Completed.")
