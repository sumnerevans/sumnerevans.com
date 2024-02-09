#! /usr/bin/env bash

# Dependencies:
# - bc
# - python-virtualenv

submission_file=$1
deliverable_num=$2

if [[ $submission_file == "" || $deliverable_num == "" ]]; then
    echo "Usage: ./slytherlisp.sh <submission_file> <deliverable_number>"
    exit 1
fi

# Make a directory inside of /tmp specific to the user (this will avoid
# problems with multiple people using the script at once).
TMPDIR="/tmp/$(whoami)"
mkdir -p $TMPDIR
echo $TMPDIR

# Download the starter code using git.
if [ ! -d ${TMPDIR}/slytherlisp-starter-code ]; then
    git clone https://gitlab.com/sumner/slytherlisp-starter-code.git \
        ${TMPDIR}/slytherlisp-starter-code
fi

# Create a virtualenvironment for testing the code.
rm -rf ${TMPDIR}/venvs
mkdir -p ${TMPDIR}/venvs
pushd ${TMPDIR}/venvs
python3 -m venv slytherlisp
source slytherlisp/bin/activate
popd

# Copy the student's code to the slytherlisp directory.
rm -rf ${TMPDIR}/slytherlisp-starter-code/slyther
rm -rf ${TMPDIR}/submission
mkdir -p ${TMPDIR}/submission
tar jxf $submission_file -C ${TMPDIR}/submission
cp -r "${TMPDIR}/submission/slyther" ${TMPDIR}/slytherlisp-starter-code/slyther

pushd ${TMPDIR}/slytherlisp-starter-code

# Install the user's code in the directory
python -m pip install -e .

# Run the tests
echo "Running the tests..."
set -x
python -m pytest -vvv --d$2 | tee ${TMPDIR}/pytest_results.txt
python -m flake8 slyther
style_passed=$?
set +x

popd

# Determine which tests failed
failed=()
num_failures=0
for x in $(cat ${TMPDIR}/pytest_results.txt | grep FAILED | cut -d ' ' -f 1); do
    failed+=($x)
    num_failures=$((num_failures+1))
done

# Read in the weights of each of the components
declare -A weights
while IFS=, read -r test weight
do
    weights["$test"]="$weight"
done < $(echo "${TMPDIR}/slytherlisp-starter-code/rubrics/d$2.csv")

# Output the grade

echo -e "\n\n\n==================== GRADE ===================="
echo -e "Total number of test failures: ${num_failures}"
echo

grade=${weights["TOTAL"]}
for f in ${failed[@]}; do
    echo "-${weights["$f"]}: Failed the '$f' test"
    grade=$(bc -l <<< "$grade - ${weights["$f"]}")
done

if [[ $style_passed != 0 ]]; then
    style_guide_weight=${weights["Style Guide"]}
    echo "-${style_guide_weight}: style guide not passed"
    grade=$(bc -l <<<"$grade - ${style_guide_weight}")
fi

echo -e "\nGRADE: ${grade}"
echo "    Note the above may not accurately reflect the final grade."
echo "    More evaluations will be run by the grader."
