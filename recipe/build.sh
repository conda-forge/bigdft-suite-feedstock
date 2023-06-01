# Files
cp $RECIPE_DIR/conda.rc .
mkdir build
cd build

# Autotools stuff
export JHBUILD_RUN_AS_ROOT="please do it"
python ../Installer.py -y autogen
cp $BUILD_PREFIX/share/gnuconfig/config.* ../futile/config/

# Run Installer
python ../Installer.py -y build -f ../conda.rc

# Copy Executable
cp install/bin/bigdft $PREFIX/bin/

