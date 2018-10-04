## Following are the steps to get PyCDt running on your system:
1. Install the latest version of PyCDt from : https://pypi.org/project/pycdt/ . Latest version was released on 1st March.
2. Install a compatible Pymatgen version from https://pypi.org/project/pymatgen/#history - 2nd March 2018 version is found to be compatible.
3. Run the following command : **pmg config -p vasp_pp/ .ymgrc.yaml** (http://pymatgen.org/installation.html). This is to ensure that the Pymatgen has access to VASP pseudo-potentials. They are needed for POTCAR generation.
