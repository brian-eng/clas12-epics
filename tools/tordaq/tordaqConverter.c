#include <unistd.h> 
#include <stdio.h>
#include <vector>
#include <string>
#include <time.h>

#include <TSystem.h>
#include <TNtupleD.h>

#include "tordaqReader.hh"


int main(int argc,char **argv)
{
    TString usage="\ntordaq [options]\n"
        "\t  -i input wf2root filename\n"
        "\t  -o output ascii filename\n"
        "\t  -t output ROOT filename with ntuple\n"
        "\t  -H output ROOT filename with histos\n"
        "\t  -s first epoch second or YYYY-MM-DD_HH:MM:SS\n"
        "\t  -e last  epoch second or YYYY-MM-DD_HH:MM:SS\n"
        "\t  -n max # samples\n"
        "\t  -R (output Ruben's ascii time format)\n"
        "\t  -h (print usage)\n";
    
    const char* timeFormat="%Y-%m-%d_%H:%M:%S";

    tordaqReader tdr;
   
    int itmp;
    std::string sStartTime="";
    std::string sEndTime="";
    
    while ( (itmp=getopt(argc,argv,"i:o:t:s:e:H:n:Rh")) != -1 )
    {
        switch (itmp)
        {
            case 'i':
                tdr.inFilename=optarg;
                break;
            case 'o':
                tdr.outAsciiFilename=optarg;
                break;
            case 't':
                tdr.outRootFilename=optarg;
                tdr.makeNtuple=true;
                break;
            case 'H':
                tdr.outRootFilename=optarg;
                tdr.makeHistos=true;
                break;
            case 's':
                sStartTime=optarg;
                break;
            case 'e':
                sEndTime=optarg;
                break;
            case 'n':
                tdr.maxSamples=std::stoi(optarg);
                break;
            case 'R':
                tdr.rubenTime=1;
                break;
            case 'h':
                std::cout<<usage<<std::endl;
                exit(0);
            default:
                std::cout<<usage<<std::endl;
                exit(1);
        }
    }

    // interpret time arguments:
    if (sStartTime!="")
    {
        if (sStartTime.find(":")==std::string::npos)
            tdr.startTime=std::stoi(sStartTime.c_str());
        else
        {
            struct tm tm;
            strptime(sStartTime.c_str(),timeFormat,&tm);
            tdr.startTime=mktime(&tm);
        }
    }
    if (sEndTime!="")
    {
        if (sEndTime.find(":")==std::string::npos)
            tdr.endTime=std::stoi(sEndTime.c_str());
        else
        {
            struct tm tm;
            strptime(sEndTime.c_str(),timeFormat,&tm);
            tdr.endTime=mktime(&tm);
        }
    }

    // check filesystem for input/output files:
    if (gSystem->AccessPathName(tdr.inFilename))
    {
        std::cerr<<"Input File Does Not Exist:  "<<tdr.inFilename<<std::endl;
        std::cerr<<usage<<std::endl;
        exit(1);
    }
    if (tdr.outAsciiFilename!="" && !gSystem->AccessPathName(tdr.outAsciiFilename))
    {
        if (tdr.outAsciiFilename!="stdout")
        {
            std::cerr<<"Output File Already Exists:  "<<tdr.outAsciiFilename<<std::endl;
            std::cerr<<usage<<std::endl;
            exit(1);
        }
    }
    if (tdr.outRootFilename!="" && !gSystem->AccessPathName(tdr.outRootFilename))
    {
        std::cerr<<"Output File Already Exists:  "<<tdr.outRootFilename<<std::endl;
        std::cerr<<usage<<std::endl;
        exit(1);
    }

    tdr.process();
}


