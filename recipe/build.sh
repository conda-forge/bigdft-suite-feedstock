# Files
cp $RECIPE_DIR/conda.rc .
mkdir build
cd build

# Autotools stuff
export JHBUILD_RUN_AS_ROOT="please do it"
cp $BUILD_PREFIX/share/gnuconfig/config.* ../futile/config/
python ../Installer.py -y autogen

# Run Installer
python ../Installer.py -y build -f ../conda.rc

# Environment variables
cp install/bin/bigdft $PREFIX/bin/

