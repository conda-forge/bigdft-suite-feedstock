# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* futile/

# Files
cp $RECIPE_DIR/conda.rc .

# Build
export JHBUILD_RUN_AS_ROOT="please do it"
mkdir build
cd build
python ../Installer.py -y autogen
python ../Installer.py -y build -f ../conda.rc

# Environment variables
cp install/bin/bigdft $PREFIX/bin/

