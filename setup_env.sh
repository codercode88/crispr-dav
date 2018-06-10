# If the modules and bwa can be found in your environment, this script can be removed. 

# Otherwise change the paths accordingly.
python_modpath=/bfx/app/lib64/python2.7/site-packages
perl_modpath=/bfx/app/perlmod/lib/perl5
bwa_path=/bfx/app/bin

## Don't change below
## Check perl modules
perl -e "use Config::Tiny" &> /dev/null \
    && perl -e "use Excel::Writer::XLSX" &> /dev/null \
    && perl -e "use JSON" &> /dev/null 

if [[ $? -ne "0" ]]; then	
    export PERL5LIB=$perl_modpath
    echo PERL5LIB was set to $PERL5LIB
fi


## Check python modules
python -c "import pysam" &> /dev/null \
    && python -c "import pysamstats" &> /dev/null

if [[ $? -ne "0" ]]; then
    export PYTHONPATH=$python_modpath
    echo PYTHONPATH was set to $PYTHONPATH
fi

## Check bwa path
which bwa &> /dev/null
if [[ $? -ne "0" ]]; then
    export PATH=$bwa_path:$PATH 
    echo BWA search path was set to $PATH
fi
