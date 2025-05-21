
#include <AMReX.H>
#include "MyTest.H"

int main (int argc, char* argv[])
{
    amrex::Initialize(argc, argv);

    {
        BL_PROFILE("main");
        MyTest mytest;
        mytest.solve();
        mytest.resetSolution();
        auto t0 = amrex::second();
        mytest.solve();
        auto t1 = amrex::second();
        amrex::Print() << "Solve Time is " << t1-t0 << "\n";
    }

    amrex::Finalize();
}
