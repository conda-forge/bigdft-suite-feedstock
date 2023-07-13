# Files
cp $RECIPE_DIR/conda.rc .
tar xvf tarballs/GaIn-1.0.tar.gz

mkdir build
cd build

# Autotools stuff
export JHBUILD_RUN_AS_ROOT="please do it"
python ../Installer.py -y autogen
cp $BUILD_PREFIX/share/gnuconfig/config.* ../futile/config/
cp $BUILD_PREFIX/share/gnuconfig/config.* ../GaIn-1.0/

# Make sure the Fortran compiler is correct for openmpi
if [ "$mpi" == "openmpi" ]
then
    export OMPI_FC=$FC
fi

# Run Installer
python ../Installer.py -y build -f ../conda.rc

# Copy Executable
cp install/bin/bigdft $PREFIX/bin/

