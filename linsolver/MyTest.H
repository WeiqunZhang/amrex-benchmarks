#ifndef MY_TEST_H_
#define MY_TEST_H_

#include <AMReX_MLMG.H>

#ifdef AMREX_USE_HYPRE
#include <AMReX_Hypre.H>
#endif

class MyTest
{
public:

    MyTest ();

    void solve ();

    void resetSolution ();

// make these public for cuda
    void initProbPoisson ();
    void initProbABecLaplacian ();
    void initProbABecLaplacianInhomNeumann ();
    void initProbNodeABecLaplacian ();

private:

    void readParameters ();
    void initData ();
    void solvePoisson ();
    void solveABecLaplacian ();
    void solveABecLaplacianInhomNeumann ();
    void solveNodeABecLaplacian ();
    void solveABecLaplacianGMRES ();

#ifdef AMREX_USE_HYPRE
    void solveMLHypre ();
#endif

    int max_level = 1;
    int ref_ratio = 2;
    int n_cell = 128;
    int max_grid_size = 64;

    bool composite_solve = true;

    // 1. Poisson,  2. ABecLaplacian, 3. ABecLaplacian w/ inhomNeumann
    // 4. NodeABecLaplacian
    int prob_type = 1;

    bool use_mlhypre = false; // use multi-level hypre solver
    bool use_hypre_ssamg = false; // this option is for mlhypre only

    // For MLMG solver
    int verbose = 2;
    int bottom_verbose = 0;
    int max_iter = 100;
    int max_fmg_iter = 0;
    int linop_maxorder = 2;
    bool agglomeration = true;
    bool consolidation = true;
    bool semicoarsening = false;
    int max_coarsening_level = 30;
    int max_semicoarsening_level = 0;
    bool use_gauss_seidel = true; // true: red-black, false: jacobi
    bool use_hypre = false;
    bool use_petsc = false;

    // GMRES
    bool use_gmres = false;

#ifdef AMREX_USE_HYPRE
    int hypre_interface_i = 1;  // 1. structed, 2. semi-structed, 3. ij
    amrex::Hypre::Interface hypre_interface = amrex::Hypre::Interface::structed;
#endif

    amrex::Vector<amrex::Geometry> geom;
    amrex::Vector<amrex::BoxArray> grids;
    amrex::Vector<amrex::DistributionMapping> dmap;

    amrex::Vector<amrex::MultiFab> solution;
    amrex::Vector<amrex::MultiFab> rhs;
    amrex::Vector<amrex::MultiFab> exact_solution;
    amrex::Vector<amrex::MultiFab> acoef;
    amrex::Vector<amrex::MultiFab> bcoef;

    amrex::Real ascalar = 1.e-3;
    amrex::Real bscalar = 1.0;
};

#endif
