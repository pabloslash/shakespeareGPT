
# Setup script for the demo notebook environments
echo "Setting up environment..."

# Check if demo folder has been created
if { pwd | grep 'gpt'; } </dev/null 2>&1; then
    echo "Inside Directory..."
 if { ls | grep 'gpt'; } </dev/null 2>&1; then
    cd bird_nwb
    echo 'Located Directory...'
 fi;
else
    mkdir gpt
    # Move the necessary items into the folder
    mv environment.yml gpt/
    mv setup.sh gpt/
    cd gpt

    echo "Created Directory..."
fi;

# Conda setup
# Creates a new environment from the YAML file if an environment 
# does not already exist
echo "checking if conda environment exists"
if { conda env list | grep 'gpt'; } >/dev/null 2>&1; then
    echo "Activating existing environment"
    conda activate gpt
else
    echo "Creating new environment"
    conda env create -f environment.yml
    conda activate gpt
fi;

# Install jupyter notebook and the notebook dependencies
python -m ipykernel install --user --name=gpt

echo "** Process Completed :) **"
