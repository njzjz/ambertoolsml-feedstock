set -euxo pipefail

# Patch AmberTools/src/etc/setup.py to report correct version
# See https://github.com/conda-forge/ambertools-feedstock/issues/45
sed -i.bak "s/version='17.0',/version=\"$PKG_VERSION\",/" AmberTools/src/etc/setup.py

# Some Fortran binaries segfault because of this flag (addles, make_crd_hg... maybe sander?)
# See PR #24 -- this might be against CF conventions; might also disappear when we provide openmp/mpi
export FFLAGS=${FFLAGS//-fopenmp }
export FORTRANFLAGS=${FORTRANFLAGS//-fopenmp }
export DEBUG_FFLAGS=${DEBUG_FFLAGS//-fopenmp }

# memembed requires -pthread
# from: https://github.com/facebook/Surround360/issues/3
export CXXFLAGS="${CXXFLAGS} -pthread"

CMAKE_FLAGS=""
BUILD_GUI="TRUE"

if [ ${cuda_compiler_version} != "None" ]; then
    export DEEPMD_CUDA_LINK="-DMLCUDA"
	export CMAKE_CUDA_FLAGS="-DUSE_CUDA_TOOLKIT=0"
else
	export DEEPMD_CUDA_LINK=""
	export CMAKE_CUDA_FLAGS="-DUSE_CUDA_TOOLKIT=true -DCUDA_HOST_COMPILER=${CC} -DCUDA_TOOLKIT_ROOT_DIR=${CUDA_HOME} -DCUDA_NVCC_FLAGS=\"-gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35 gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_53,code=sm_53 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75\""
fi
export flibs_ml="${DEEPMD_CUDA_LINK} -DHIGH_PREC -L ${PREFIX}/lib -Wl,--no-as-needed -lrt -ldeepmd_op -ldeepmd -ltensorflow_cc -ltensorflow_framework -lstdc++ -Wl,-rpath=${PREFIX}/lib"

# Build AmberTools with cmake
mkdir -p build
cd build
cmake ${SRC_DIR} ${CMAKE_FLAGS} \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCOMPILER=MANUAL \
    -DPYTHON_EXECUTABLE=${PYTHON} \
    -DBUILD_GUI=${BUILD_GUI} \
    -DCHECK_UPDATES=FALSE \
    -DTRUST_SYSTEM_LIBS=TRUE \
	-DCMAKE_CXX_FLAGS="${flibs_ml}" \
	${CMAKE_CUDA_FLAGS}

make && make install

cmake ${SRC_DIR} ${CMAKE_FLAGS} \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCOMPILER=MANUAL \
    -DPYTHON_EXECUTABLE=${PYTHON} \
    -DBUILD_GUI=${BUILD_GUI} \
    -DCHECK_UPDATES=FALSE \
    -DTRUST_SYSTEM_LIBS=TRUE \
	-DCMAKE_CXX_FLAGS="${flibs_ml}" \
    -DMPI=TRUE \
	${CMAKE_CUDA_FLAGS}

make && make install


# Export AMBERHOME automatically
mkdir -p ${PREFIX}/etc/conda/{activate,deactivate}.d
cp ${RECIPE_DIR}/activate.sh ${PREFIX}/etc/conda/activate.d/ambertools.sh
cp ${RECIPE_DIR}/activate.fish ${PREFIX}/etc/conda/activate.d/ambertools.fish
cp ${RECIPE_DIR}/deactivate.sh ${PREFIX}/etc/conda/deactivate.d/ambertools.sh
cp ${RECIPE_DIR}/deactivate.fish ${PREFIX}/etc/conda/deactivate.d/ambertools.fish


# Fix https://github.com/conda-forge/ambertools-feedstock/issues/35
cp ${RECIPE_DIR}/patches/parmed_version.py ${SP_DIR}/parmed/_version.py
