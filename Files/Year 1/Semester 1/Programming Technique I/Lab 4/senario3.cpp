#include <iostream>
#include <iomanip>
#include <cstring>
#include <fstream>
using namespace std;

double calculateKeywordPercentage(const char*,int,int);

int main(){
    ifstream inputf("input2.txt");
    ofstream outputf("output3.txt");
    const int MAX_SIZE=1000;
    char userInput[MAX_SIZE];
    int Totalchar,Totalword=0;
    //cout<<"Enter the input(up to 999 characters, end with an empty line): "<<endl;
    inputf.getline(userInput,MAX_SIZE);

    for (Totalchar=0;Totalchar,MAX_SIZE;Totalchar++){
        if(userInput[Totalchar] == 0){
            break;
        }
    }

    for(int a=0; a<Totalchar; a++){
        if(userInput[a] != ' '){
            if(a == 0 || userInput[a-1]==' '){
                Totalword++;
            }
        }
    }
    //cout<<"Input:"<<endl;
    outputf<<"Input: \n";
    for(int i=0;i<Totalchar;i++){
        outputf<<userInput[i];
    }
    double result=calculateKeywordPercentage(userInput,Totalchar,Totalword);
    //cout<<fixed<<setprecision(2);
    outputf<<endl;
    outputf<<"\nPercentage of lines containing 'data': "<<fixed<<showpoint<<setprecision(2)<<result<<"%"<<endl;
    inputf.close();
    outputf.close();
    cout<<"\nAll the results have been recorded in output2.txt";
    system ("pause");
    return 0;
}

double calculateKeywordPercentage(const char* userInput,int Totalchar,int Totalword){
    char keyword[]="data";
    double Keynum = 0.0;
    double average;

    for(int j=0; j<Totalchar; j++){
        if(strstr((userInput+j),keyword) == (userInput+j)){
            Keynum++;
        }
        keyword[0]=toupper(keyword[0]);

        if (strstr((userInput+j),keyword) == (userInput+j)){
            Keynum++;
        }
        keyword[0]=tolower(keyword[0]);

    }
    average=(Keynum/Totalword)*100;
    return average;
}
